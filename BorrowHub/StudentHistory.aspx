<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="StudentHistory.aspx.cs"
    Inherits="BorrowHub.StudentHistory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Borrowing History - BorrowHub Student</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Boxicons -->
    <link href="https://cdn.boxicons.com/3.0.3/fonts/basic/boxicons.min.css" rel="stylesheet" />
    <!-- Shared dashboard CSS -->
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/dashboard.css") %>" />
    <style>
    .bh-tab-active-student {
        background: #f5dd3d !important; 
        color: #1f2933 !important;       
    }
    </style>
    <style>
    #studentHistoryWrapper .bh-history-header {
        background-color: #f5dd3d;   
        color: #1f2933;             
        padding: 12px 18px;
        border-radius: 10px 10px 0 0;
    }

    #studentHistoryWrapper .bh-history-title {
        font-size: 15px;
        font-weight: 600;
        color: #1f2933;
    }

    #studentHistoryWrapper .bh-history-sub {
        font-size: 12px;
        color: #1f2933;
        opacity: 0.9;
    }

    #studentHistoryWrapper .bh-history-body {
        border-radius: 0 0 12px 12px;
        margin-top: 0;
    }
</style>

</head>
<body class="dashboard-page">
    <form id="form1" runat="server">
        <div class="bh-shell">

            <!-- TOP BAR -->
            <div class="bh-topbar">
                <div class="bh-brand">
                    <div class="bh-logo-box">B</div>
                    <div class="bh-brand-text">
                        <span class="bh-brand-title">BorrowHub</span>
                        <span class="bh-brand-sub">STI Balagtas Digital Borrowing System</span>
                    </div>
                </div>

                <div class="bh-userbox">
                    <div class="bh-user-avatar">
                        <i class='bx bx-user'></i>
                    </div>
                    <div>
                        <div style="font-size:13px;">Welcome, Student!</div>
                        <div style="font-size:12px; color:#6b7280;">
                            <asp:Label ID="lblStudentEmail" runat="server" />
                        </div>
                    </div>
                    <asp:Button ID="btnLogoutStudent" runat="server"
                        Text="Log out" CssClass="bh-logout-btn"
                        OnClick="btnLogoutStudent_Click" />
                </div>
            </div>

            <!-- NAV TABS -->
            <div class="bh-tabs bh-tabs-student">
                <a class="bh-tab" href="StudentDashboard.aspx">Dashboard</a>
                <a class="bh-tab" href="StudentBorrow.aspx">Borrow</a>
                <a class="bh-tab" href="StudentPending.aspx">Pending Request</a>
                <a class="bh-tab bh-tab-active-student" href="StudentHistory.aspx">History</a>
            </div>
            <!-- HISTORY SECTION -->
            <div class="bh-history-wrapper" id="studentHistoryWrapper">

                <!-- Header -->
                <div class="bh-history-header">
                    <div class="bh-history-title">Borrowing History</div>
                    <div class="bh-history-sub">
                        A record of all items you have borrowed, including returned, overdue, and cancelled.
                    </div>
                </div>

                <!-- Table -->
                <div class="bh-history-body">
                    <table class="bh-history-table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Item</th>
                                <th>Details</th>
                                <th>Status</th>
                                <th>Action / Notes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Example row 1: Returned in good condition -->
                            <tr>
                                <td>
                                    <div>Oct 16, 2025</div>
                                    <div class="bh-history-time">Borrowed: Oct 10, 2025</div>
                                    <div class="bh-history-time">Due: Oct 17, 2025</div>
                                </td>
                                <td>
                                    <div class="bh-history-item">Arduino Kit</div>
                                    <div class="bh-history-meta">Academic • Lab equipment</div>
                                    <div class="bh-history-id">Ref: #REQ-2025-010</div>
                                </td>
                                <td>
                                    <div class="bh-history-meta">
                                        Returned before due date.<br />
                                        Used for final project prototype.
                                    </div>
                                </td>
                                <td>
                                    <span class="bh-status-pill bh-status-good">Returned (Good)</span>
                                </td>
                                <td>
                                    <span class="bh-action-returned">On time</span><br />
                                    <span class="bh-history-time">Handled by: Staff 001</span>
                                </td>
                            </tr>

                            <!-- Example row 2: Overdue -->
                            <tr>
                                <td>
                                    <div>—</div>
                                    <div class="bh-history-time">Borrowed: Sep 25, 2025</div>
                                    <div class="bh-history-time">Due: Oct 02, 2025</div>
                                </td>
                                <td>
                                    <div class="bh-history-item">Library Book - OOP in C#</div>
                                    <div class="bh-history-meta">Book • CS Section</div>
                                    <div class="bh-history-id">Ref: #REQ-2025-011</div>
                                </td>
                                <td>
                                    <div class="bh-history-meta">
                                        Not yet returned. Please coordinate with the librarian<br />
                                        to avoid additional penalties.
                                    </div>
                                </td>
                                <td>
                                    <span class="bh-status-pill bh-status-damaged" style="background:#ef4444;">Overdue</span>
                                </td>
                                <td>
                                    <span class="bh-action-overdue">Return immediately</span><br />
                                    <span class="bh-history-time">Penalty may apply</span>
                                </td>
                            </tr>

                            <!-- Example row 3: Cancelled -->
                            <tr>
                                <td>
                                    <div>Sep 06, 2025</div>
                                    <div class="bh-history-time">Requested: Sep 05, 2025</div>
                                </td>
                                <td>
                                    <div class="bh-history-item">Tripod Stand</div>
                                    <div class="bh-history-meta">Audio Visual • Equipment</div>
                                    <div class="bh-history-id">Ref: #REQ-2025-012</div>
                                </td>
                                <td>
                                    <div class="bh-history-meta">
                                        Request cancelled by student before release schedule.
                                    </div>
                                </td>
                                <td>
                                    <span class="bh-status-pill" style="background:#9ca3af;">Cancelled</span>
                                </td>
                                <td>
                                    <span class="bh-history-time">No penalties applied</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
