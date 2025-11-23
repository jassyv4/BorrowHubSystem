<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs"
    Inherits="BorrowHub.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard - BorrowHub</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Boxicons -->
    <link href="https://cdn.boxicons.com/3.0.3/fonts/basic/boxicons.min.css" rel="stylesheet" />
    <!-- Custom dashboard CSS -->
    <link rel="stylesheet" href="css/dashboard.css" />
    <style>
    .bh-tab-active-student {
        background: #f5dd3d !important;  
        color: #1f2933 !important;       
    }
    </style>
    <style>
        .bh-addrequest-header {
            background-color: #f5dd3d !important;
            color: #1f2933 !important;
            padding: 12px 18px;
            border-radius: 10px 10px 0 0;
            font-size: 14px;
            font-weight: 500;
        }

        .bh-addrequest-header-sub {
            font-size: 12px;
            opacity: 0.9;
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
                    <asp:Button ID="btnLogoutStudent" runat="server" Text="Log out"
                        CssClass="bh-logout-btn" OnClick="btnLogoutStudent_Click" />
                </div>
            </div>

            <!-- NAV TABS -->
            <div class="bh-tabs bh-tabs-student">
                <a class="bh-tab bh-tab-active-student" href="StudentDashboard.aspx">Dashboard</a>
                <a class="bh-tab" href="StudentBorrow.aspx">Borrow</a>
                <a class="bh-tab" href="StudentPending.aspx">Pending Request</a>
                <a class="bh-tab" href="StudentHistory.aspx">History</a>
            </div>
            <!-- SUMMARY CARDS -->
            <div class="row g-3 bh-cards-row">
                <div class="col-md-3">
                    <div class="bh-card bh-card-blue">
                        <div class="bh-card-label">Items Borrowed</div>
                        <div class="bh-card-main">
                            <div>
                                <div class="bh-card-value">3</div>
                                <div class="bh-card-sub">Currently checked out</div>
                            </div>
                            <i class='bx bx-package bh-card-icon'></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="bh-card bh-card-green">
                        <div class="bh-card-label">Available Now</div>
                        <div class="bh-card-main">
                            <div>
                                <div class="bh-card-value">58</div>
                                <div class="bh-card-sub">Out of 164 total items</div>
                            </div>
                            <i class='bx bx-cart-alt bh-card-icon'></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="bh-card bh-card-red">
                        <div class="bh-card-label">Overdue</div>
                        <div class="bh-card-main">
                            <div>
                                <div class="bh-card-value">1</div>
                                <div class="bh-card-sub">Need immediate return</div>
                            </div>
                            <i class='bx bx-time-five bh-card-icon'></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="bh-card bh-card-orange">
                        <div class="bh-card-label">Recent Returns</div>
                        <div class="bh-card-main">
                            <div>
                                <div class="bh-card-value">0</div>
                                <div class="bh-card-sub">In the last 24 hours</div>
                            </div>
                            <i class='bx bx-rotate-left bh-card-icon'></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- WELCOME + ANNOUNCEMENT -->
            <div class="bh-welcome-box">
                <div class="bh-welcome-title">Welcome back!</div>
                <p style="font-size:13px; color:var(--bh-text-muted); max-width:480px;">
                    Stay updated with announcements and check your borrowing activity here.
                </p>

                <div class="bh-announcement-card">
                    <strong>Announcement: System Maintenance</strong>
                    BorrowHub will undergo scheduled maintenance on
                    <span>Sept 25, 2025 from 8:00 PM to 10:00 PM.</span><br />
                    During this time, borrowing and returning transactions will be unavailable.
                    Please make sure to process any urgent requests before the downtime.  
                    <br /><br />
                    <span>— BorrowHub Admin Team</span>
                </div>
            </div>

            <!-- MY BORROWED ITEMS -->
            <div class="mt-4">
                <div class="bh-addrequest-header">
                    <div>My Borrowed Items</div>
                    <div class="bh-addrequest-header-sub">Track items you currently have on loan.</div>
                </div>
                <div class="bh-section-body">
                    <div class="bh-item-row">
                        <div class="bh-item-title">Laptop #1</div>
                        <div class="bh-item-meta">Borrowed on: Feb 1, 2025 • Due: Feb 10, 2025 • Status: On loan</div>
                    </div>
                    <div class="bh-item-row">
                        <div class="bh-item-title">Basketball</div>
                        <div class="bh-item-meta">Borrowed on: Jan 29, 2025 • Due: Feb 5, 2025 • Status: Returned</div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
