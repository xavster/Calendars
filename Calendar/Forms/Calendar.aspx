<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="Calendar.Forms.Calendar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calendar</title>
    <link href="../bootstrap.min.css" rel="stylesheet" />
    <link href="../main.css" rel="stylesheet" />
    <script src="../bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-2 cell30 width30">
                        <asp:Button
                            ID="prev1"
                            runat="server"
                            Text="prev"
                            OnClick="prev_Click"
                            CssClass="navButton" />
                    </div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Monday" Enabled="false" /></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Tuesday" Enabled="false"/></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Wednesday" Enabled="false" /></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Thursday" Enabled="false"/></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Friday" Enabled="false"/></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Saturday" Enabled="false"/></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Sunday" Enabled="false"/></div>
                    <div class="col-md-2 cell30 width30">
                        <asp:Button
                            ID="prev2"
                            runat="server"
                            Text="prev"
                            OnClick="prev_Click"
                            CssClass="navButton" />
                    </div>
                </div>

                <div class="row row_min">
                    <div class="col-md-1"></div>
                    <div class="col-md-2 w_cell width30" runat="server"><asp:Button ID="week1a" runat="server" CssClass="weekCell" Enabled="false"/></div>
                    <div id="cell1" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day1" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell2" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day2" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell3" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day3" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell4" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day4" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell5" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day5" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell6" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day6" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell7" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day7" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div class="col-md-2 w_cell width30" runat="server"><asp:Button ID="week1b" runat="server" CssClass="weekCell" Enabled="false" /></div>
                </div>
                <div class="row row_min">
                    <div class="col-md-1"></div>
                    <div class="col-md-2 w_cell width30" runat="server"><asp:Button ID="week2a" runat="server" CssClass="weekCell" Enabled="false" /></div>
                    <div id="cell8" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day8" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell9" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day9" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell10" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day10" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell11" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day11" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell12" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day12" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell13" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day13" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell14" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day14" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div class="col-md-2 w_cell width30" runat="server"><asp:Button ID="week2b" runat="server" CssClass="weekCell" Enabled="false" /></div>
                </div>
                <div class="row row_min">
                    <div class="col-md-1"></div>
                    <div class="col-md-2 w_cell width30" runat="server"><asp:Button ID="week3a" runat="server" CssClass="weekCell" Enabled="false" /></div>
                    <div id="cell15" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day15" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell16" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day16" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell17" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day17" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell18" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day18" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell19" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day19" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell20" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day20" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell21" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day21" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div class="col-md-2 w_cell width30" runat="server"><asp:Button ID="week3b" runat="server" CssClass="weekCell" Enabled="false" /></div>
                </div>
                <div class="row row_min">
                    <div class="col-md-1"></div>
                    <div class="col-md-2 w_cell width30" runat="server"><asp:Button ID="week4a" runat="server" CssClass="weekCell" Enabled="false" /></div>
                    <div id="cell22" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day22" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell23" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day23" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell24" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day24" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell25" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day25" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell26" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day26" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell27" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day27" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div id="cell28" class="col-md-1 cell" runat="server">
                        <asp:Button ID="day28" CssClass="addCell" runat="server" OnClick="add_Click" /></div>
                    <div class="col-md-2 w_cell width30" runat="server"><asp:Button ID="week4b" runat="server" CssClass="weekCell" Enabled="false" /></div>
                </div>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-2 cell30 width30">
                        <asp:Button
                            ID="next1"
                            runat="server"
                            Text="next"
                            OnClick="next_Click"
                            CssClass="navButton" />
                    </div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Monday" Enabled="false" /></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Tuesday" Enabled="false"/></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Wednesday" Enabled="false" /></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Thursday" Enabled="false"/></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Friday" Enabled="false"/></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Saturday" Enabled="false"/></div>
                    <div class="col-md-1 cell30"><asp:Button runat="server" CssClass="dayLabel" Text="Sunday" Enabled="false"/></div>
                    <div class="col-md-2 cell30 width30">
                        <asp:Button
                            ID="next2"
                            runat="server"
                            Text="next"
                            OnClick="next_Click"
                            CssClass="navButton" />
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
