<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs"
    Inherits="BorrowHub.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard - BorrowHub</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Boxicons -->
    <link href="https://cdn.boxicons.com/3.0.3/fonts/basic/boxicons.min.css" rel="stylesheet" />
    <!-- Custom dashboard CSS -->
    <link rel="stylesheet" href="css/dashboard.css" />
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
                        <div style="font-size:13px;">Welcome, Admin!</div>
                        <div style="font-size:12px; color:#6b7280;">
                            <asp:Label ID="lblAdminEmail" runat="server" />
                        </div>
                    </div>
                    <asp:Button ID="btnLogoutAdmin" runat="server" Text="Log out"
                        CssClass="bh-logout-btn" OnClick="btnLogoutAdmin_Click" />
                </div>
            </div>

            <!-- NAV TABS -->
            <!-- AdminRequests.aspx -->
            <div class="bh-tabs">
    <a class="bh-tab bh-tab-active-admin" href="AdminDashboard.aspx">Dashboard</a>
    <a class="bh-tab" href="AdminRequests.aspx">Requests</a>
    <a class="bh-tab" href="AdminReturns.aspx">Returns</a>
    <a class="bh-tab" href="AdminInventory.aspx">Inventory</a>
    <a class="bh-tab" href="AdminHistory.aspx">History</a>
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

            <!-- RECENTLY BORROWED SECTION -->
            <div class="mt-3">
                <div class="bh-section-header">
                    <div>Recently Borrowed Items</div>
                    <div class="bh-section-sub">
                        Items currently checked out by students – keep updated!
                    </div>
                </div>
                <div class="bh-section-body">
                    <div class="bh-item-row">
                        <div class="bh-item-title">Chess board set</div>
                        <div class="bh-item-meta">Borrowed by: Renz Pangan</div>
                    </div>
                    <div class="bh-item-row">
                        <div class="bh-item-title">Volleyball</div>
                        <div class="bh-item-meta">Borrowed by: Vivian Dela Cruz</div>
                    </div>
                    <div class="bh-item-row">
                        <div class="bh-item-title">Guitar</div>
                        <div class="bh-item-meta">Borrowed by: Jasmine Villanovar</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS (optional, for future dropdowns/modals) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
