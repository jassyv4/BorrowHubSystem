<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="StudentPending.aspx.cs"
    Inherits="BorrowHub.StudentPending" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pending Requests - BorrowHub Student</title>

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

    #studentPendingWrapper .bh-requests-header {
    background-color: #f5dd3d;  
    color: #1f2933;
    }
    #studentPendingWrapper .bh-requests-header-sub {
        color: #1f2933;
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
                    <asp:Button ID="btnLogoutStudent" runat="server"
                        Text="Log out" CssClass="bh-logout-btn"
                        OnClick="btnLogoutStudent_Click" />
                </div>
            </div>

            <!-- NAV TABS -->
            <div class="bh-tabs bh-tabs-student">
                <a class="bh-tab" href="StudentDashboard.aspx">Dashboard</a>
                <a class="bh-tab" href="StudentBorrow.aspx">Borrow</a>
                <a class="bh-tab bh-tab-active-student" href="StudentPending.aspx">Pending Request</a>
                <a class="bh-tab" href="StudentHistory.aspx">History</a>
            </div>

            <!-- PENDING REQUESTS (using REQUESTS PAGE styles) -->
            <div class="bh-requests-wrapper" id="studentPendingWrapper">
                <!-- Header bar (shares styles with admin requests) -->
                <div class="bh-requests-header">
                    Your Pending Requests
                    <div class="bh-requests-header-sub">
                        These requests are still waiting for approval or release.
                    </div>
                </div>

                <div class="bh-requests-body">

                    <!-- Simple filter/search row (Bootstrap) -->
                    <div class="row g-2 mb-2" style="font-size:12px;">
                        <div class="col-md-4 col-sm-6">
                            <input type="text" class="form-control form-control-sm" placeholder="Search by item or reference #" />
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <select class="form-select form-select-sm">
                                <option value="">All Status</option>
                                <option>Awaiting Approval</option>
                                <option>For Release</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <input type="date" class="form-control form-control-sm" />
                        </div>
                        <div class="col-md-2 col-sm-6 d-flex gap-2">
                            <button type="button" class="btn btn-primary btn-sm w-100">Filter</button>
                            <button type="reset" class="btn btn-outline-secondary btn-sm w-100">Reset</button>
                        </div>
                    </div>

                    <!-- Example request card 1 -->
                    <div class="bh-request-card">
                        <div class="bh-request-main">
                            <div class="bh-request-title">
                                Chess Board Set
                                <span class="bh-history-id"> • #REQ-2025-001</span>
                            </div>
                            <div class="bh-request-meta">
                                Borrow date: Nov 25, 2025 &nbsp;•&nbsp;
                                Return date: Nov 26, 2025<br />
                                Status: <span class="bh-status-pill bh-status-good" style="background:#facc15; color:#92400e;">Awaiting Approval</span>
                            </div>
                            <div class="bh-request-more">
                                Purpose: Classroom activity for Math Week (Grade 11).<br />
                                Submitted: Nov 20, 2025 • Contact: 09xx-xxx-xxxx
                            </div>
                        </div>
                        <div class="bh-request-actions">
                            <button type="button" class="bh-circle-btn bh-circle-deny" title="Cancel request">
                                <i class='bx bx-x'></i>
                            </button>
                        </div>
                    </div>

                    <!-- Example request card 2 -->
                    <div class="bh-request-card">
                        <div class="bh-request-main">
                            <div class="bh-request-title">
                                Microphone
                                <span class="bh-history-id"> • #REQ-2025-002</span>
                            </div>
                            <div class="bh-request-meta">
                                Borrow date: Nov 24, 2025 &nbsp;•&nbsp;
                                Return date: Nov 24, 2025<br />
                                Status: <span class="bh-status-pill bh-status-good" style="background:#bbf7d0; color:#166534;">For Release</span>
                            </div>
                            <div class="bh-request-more">
                                Purpose: Presentation for Oral Communication subject.<br />
                                Submitted: Nov 19, 2025 • Contact: 09xx-xxx-xxxx
                            </div>
                        </div>
                        <div class="bh-request-actions">
                            <button type="button" class="bh-circle-btn bh-circle-deny" title="Cancel request">
                                <i class='bx bx-x'></i>
                            </button>
                        </div>
                    </div>

                    <!-- Example request card 3 -->
                    <div class="bh-request-card">
                        <div class="bh-request-main">
                            <div class="bh-request-title">
                                Bluetooth Speaker
                                <span class="bh-history-id"> • #REQ-2025-003</span>
                            </div>
                            <div class="bh-request-meta">
                                Borrow date: Nov 23, 2025 &nbsp;•&nbsp;
                                Return date: Nov 23, 2025<br />
                                Status: <span class="bh-status-pill bh-status-good" style="background:#facc15; color:#92400e;">Awaiting Approval</span>
                            </div>
                            <div class="bh-request-more">
                                Purpose: School event rehearsal.<br />
                                Submitted: Nov 18, 2025 • Contact: 09xx-xxx-xxxx
                            </div>
                        </div>
                        <div class="bh-request-actions">
                            <button type="button" class="bh-circle-btn bh-circle-deny" title="Cancel request">
                                <i class='bx bx-x'></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('.bh-request-card').forEach(function (card) {
                    card.addEventListener('click', function (e) {
                        if (e.target.closest('.bh-request-actions')) return;
                        card.classList.toggle('expanded');
                    });
                });
            });
        </script>
    </form>
</body>
</html>
