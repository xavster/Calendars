using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;

namespace Calendar.Forms
{
    public partial class Calendar : System.Web.UI.Page
    {
        Dictionary<string, List<string>> appointments = new Dictionary<string, List<string>>();

        CultureInfo ci = new CultureInfo("en-US");

        static int week;
        static int weekOffset;

        Button[] dayButton;
        HtmlGenericControl[] dayCell;
        Button[] weekCell;

        DateTime findDate()
        {
            DateTime date = DateTime.Now;
            date = date.AddDays(7 * weekOffset);

            while (date.DayOfWeek != DayOfWeek.Monday)
            {
                date = date.AddDays(-1);
            }
            return date;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl h = new HtmlGenericControl();
            

            dayButton = new Button[]
            {
                day1, day2, day3, day4, day5, day6, day7,
                day8, day9, day10, day11, day12, day13, day14,
                day15, day16, day17, day18, day19, day20, day21,
                day22, day23, day24, day25, day26, day27, day28
            };

            

            dayCell = new HtmlGenericControl[]
            {
                cell1, cell2, cell3, cell4, cell5, cell6, cell7,
                cell8, cell9, cell10, cell11, cell12, cell13, cell14,
                cell15, cell16, cell17, cell18, cell19, cell20, cell21,
                cell22, cell23, cell24, cell25, cell26, cell27, cell28
            };

            weekCell = new Button[] 
            {
                week1a, week1b, week2a, week2b,
                week3a, week3b, week4a, week4b
            };

            readFromFile();


            if (!string.IsNullOrEmpty(Request.QueryString["edit"]) &&
                !string.IsNullOrEmpty(Request.QueryString["i"]) &&
                !string.IsNullOrEmpty(Request.QueryString["j"]) &&
                !string.IsNullOrEmpty(Request.QueryString["Text"]))
            {
                int i = int.Parse(Request.QueryString["i"]);
                int j = int.Parse(Request.QueryString["j"]);
                string text = Request.QueryString["Text"];

                string dateStr = findDate().AddDays(i).ToString("dd.MM.yyyy");

                if (appointments.ContainsKey(dateStr))
                {
                    appointments[dateStr][j] = text;
                    Title = text;
                }
                saveToFile();
                Response.Redirect("~/Forms/Calendar.aspx");
            }

            else if (!string.IsNullOrEmpty(Request.QueryString["remove"]) &&
                !string.IsNullOrEmpty(Request.QueryString["i"]) &&
                !string.IsNullOrEmpty(Request.QueryString["j"]))
            {
                int i = int.Parse(Request.QueryString["i"]);
                int j = int.Parse(Request.QueryString["j"]);

                string dateStr = findDate().AddDays(i).ToString("dd.MM.yyyy");

                if (appointments.ContainsKey(dateStr))
                {
                    appointments[dateStr].RemoveAt(j);
                }
                saveToFile();
                Response.Redirect("~/Forms/Calendar.aspx");
            }

            else if (!string.IsNullOrEmpty(Request.QueryString["Date"]) &&
                !string.IsNullOrEmpty(Request.QueryString["Text"]))
            {
                string dateStr = Request.QueryString["Date"];
                string text = Request.QueryString["Text"];

                List<string> appList = new List<string>();
                if (appointments.ContainsKey(dateStr))
                {
                    appList = appointments[dateStr];
                }
                appList.Add(text);
                appList.Sort();
                appointments[dateStr] = appList;

                saveToFile();
                Response.Redirect("~/Forms/Calendar.aspx");
            }

            DateTime date = findDate();

            week = (date.DayOfYear - 1) / 7;
 
            for (int i = 0; i < 4; i++)
            {
                weekCell[2 * i].Text = "W" + (week + i).ToString("D2") + " " + date.Year;
                weekCell[2 * i + 1].Text = "W" + (week + i).ToString("D2") + " " + date.Year;
            }

            foreach (Button b in dayButton)
            {
                if (date.DayOfYear == DateTime.Now.DayOfYear)
                {
                    b.Text = date.ToString("MMMM dd", ci);
                    b.CssClass = "addTodayCell";
                }
                else
                {
                    b.Text = date.ToString("MMMM dd", ci);
                    b.CssClass = "addCell";
                }

                date = date.AddDays(1);
            }

            date = findDate();

            int cnt = 0;

            for (int i = 0; i < 28; i++)
            {
                while (dayCell[i].Controls.Count > 2)
                {
                    dayCell[i].Controls.RemoveAt(dayCell[i].Controls.Count - 1);
                }
            }

            for (int i = 0; i < 28; i++)
            {
                string dayStr = date.ToString("dd.MM.yyyy");
                if (appointments.ContainsKey(dayStr))
                {
                    int j = 0;
                    foreach (var val in appointments[dayStr])
                    {
                        Button b = new Button()
                        {
                            ID = "btn" + (1000 * i + j),
                            Text = val,
                            CssClass = "appButton",
                        };

                        if (b.Text.Length > 16)
                        {
                            b.Text = b.Text.Substring(0, 16);
                        }

                        b.Click += edit_Click;
                        dayCell[i].Controls.Add(b);
                        j++;
                        cnt++;
                    }
                    
                }
                date = date.AddDays(1);
            }
            Title = "" + cnt;
        }

        protected void prev_Click(object sender, EventArgs e)
        {
            weekOffset--;
            Page_Load(sender, e);
        }

        protected void next_Click(object sender, EventArgs e)
        {
            weekOffset++;
            Page_Load(sender, e);
        }

        protected void add_Click(object sender, EventArgs e)
        {           
            Button b = (Button) sender;
            for (int i = 0; i < 28; i++)
            {
                if (b == dayButton[i])
                {
                    Response.Redirect("~/Forms/NewAppointment.aspx?Date=" + findDate().AddDays(i).ToString("dd.MM.yyyy"));
                    break;
                }
            }
        }

        void edit_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            DateTime date = findDate();

            int id = int.Parse(b.ID.Remove(0, 3));
            int i = id / 1000;
            int j = id % 1000;

            Response.Redirect("~/Forms/EditAppointment.aspx?" +
                "i=" + i +
                "&j=" + j +
                "&Date=" + findDate().AddDays(i).ToString("dd.MM.yyyy") +
                "&Text=" + b.Text);      
        }

        void fillAppointments()
        {
            DateTime date = findDate();
        }

        void readFromFile()
        {
            string path = Server.MapPath("~/appointments.txt");

            if (!File.Exists(path))
            {
                File.WriteAllText(path, "");
            }

            foreach (string s in File.ReadAllLines(path))
            {
                string[] fields = s.Split(new char[] { ';' });

                if (fields.Count() >= 2)
                {
                    string day = fields[0];
                    List<string> appList = new List<string>();

                    for (int i = 1; i < fields.Count(); i++)
                    {
                        appList.Add(fields[i]);
                    }

                    appList.Sort();
                    appointments[day] = appList;
                }
            }
        }

        void saveToFile()
        {
            string path = Server.MapPath("~/appointments.txt");
            using (StreamWriter file = new StreamWriter(path))
            {
                foreach (var item in appointments)
                {
                    string day = item.Key;
                    List<string> appList = item.Value;

                    List<string> line = new List<string>();
                    line.Add(day);
                    line.AddRange(appList);

                    file.WriteLine(String.Join(";", line));
                }
            }
        }
    }
}