<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHistory.aspx.cs"
    Inherits="BorrowHub.AdminHistory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>History - BorrowHub Admin</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Boxicons -->
    <link href="https://cdn.boxicons.com/3.0.3/fonts/basic/boxicons.min.css" rel="stylesheet" />
    <!-- Dashboard CSS -->
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/dashboard.css") %>" />
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
            <div class="bh-tabs">
    <a class="bh-tab" href="AdminDashboard.aspx">Dashboard</a>
    <a class="bh-tab" href="AdminRequests.aspx">Requests</a>
    <a class="bh-tab" href="AdminReturns.aspx">Returns</a>
    <a class="bh-tab" href="AdminInventory.aspx">Inventory</a>
    <a class="bh-tab bh-tab-active-admin" href="AdminHistory.aspx">History</a>
</div>


            <!-- SUMMARY CARDS (top row) -->
            <div class="row g-3 bh-cards-row">
                <div class="col-md-3 col-6">
                    <div class="bh-card bh-card-blue">
                        <div class="bh-card-label">Total Transactions</div>
                        <div class="bh-card-main">
                            <div class="bh-card-value">37</div>
                            <div class="bh-card-icon">
                                <i class='bx bx-cube-alt'></i>
                            </div>
                        </div>
                        <div class="bh-card-sub">All Time</div>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="bh-card bh-card-green">
                        <div class="bh-card-label">Items Borrowed</div>
                        <div class="bh-card-main">
                            <div class="bh-card-value">20</div>
                            <div class="bh-card-icon">
                                <i class='bx bx-export'></i>
                            </div>
                        </div>
                        <div class="bh-card-sub">Total Borrow</div>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="bh-card bh-card-orange">
                        <div class="bh-card-label">Items Returned</div>
                        <div class="bh-card-main">
                            <div class="bh-card-value">7</div>
                            <div class="bh-card-icon">
                                <i class='bx bx-import'></i>
                            </div>
                        </div>
                        <div class="bh-card-sub">Total Returns</div>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="bh-card bh-card-red">
                        <div class="bh-card-label">Overdue</div>
                        <div class="bh-card-main">
                            <div class="bh-card-value">3</div>
                            <div class="bh-card-icon">
                                <i class='bx bx-error-circle'></i>
                            </div>
                        </div>
                        <div class="bh-card-sub">Need Attention</div>
                    </div>
                </div>
            </div>

            <!-- HISTORY TABLE -->
            <div class="bh-history-wrapper">
                <div class="bh-history-header">
                    <div class="bh-history-title">Inventory Items</div>
                    <div class="bh-history-sub">Showing 4 of 37 transactions</div>
                </div>

                <div class="bh-history-body">
                    <table class="bh-history-table">
                        <thead>
                            <tr>
                                <th>Date &amp; Time</th>
                                <th>Item</th>
                                <th>Student Name</th>
                                <th>Status</th>
                                <th>Action</th>
                                <th>Notes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    11/26/2025<br />
                                    <span class="bh-history-time">11:35 AM</span>
                                </td>
                                <td>
                                    <div class="bh-history-item">Chess Board Set</div>
                                    <div class="bh-history-meta">Board Game</div>
                                </td>
                                <td>Renz Pangan</td>
                                <td>
                                    <span class="bh-status-pill bh-status-good">Good Condition</span><br />
                                    <span class="bh-history-id">ID:001</span>
                                </td>
                                <td><span class="bh-action-overdue">Overdue</span></td>
                                <td>Late return</td>
                            </tr>

                            <tr>
                                <td>
                                    07/03/2025<br />
                                    <span class="bh-history-time">10:35 AM</span>
                                </td>
                                <td>
                                    <div class="bh-history-item">Basketball</div>
                                    <div class="bh-history-meta">Sport</div>
                                </td>
                                <td>Unjane Galura</td>
                                <td>
                                    <span class="bh-status-pill bh-status-damaged">Damaged</span><br />
                                    <span class="bh-history-id">ID:005</span>
                                </td>
                                <td><span class="bh-action-overdue">Overdue</span></td>
                                <td>Slight damaged</td>
                            </tr>

                            <tr>
                                <td>
                                    01/26/2025<br />
                                    <span class="bh-history-time">07:35 AM</span>
                                </td>
                                <td>
                                    <div class="bh-history-item">Volleyball</div>
                                    <div class="bh-history-meta">Sport</div>
                                </td>
                                <td>Vivian Dela Cruz</td>
                                <td>
                                    <span class="bh-status-pill bh-status-good">Good Condition</span><br />
                                    <span class="bh-history-id">ID:003</span>
                                </td>
                                <td><span class="bh-action-returned">Returned</span></td>
                                <td>Returned good</td>
                            </tr>

                            <tr>
                                <td>
                                    01/26/2025<br />
                                    <span class="bh-history-time">07:35 AM</span>
                                </td>
                                <td>
                                    <div class="bh-history-item">Guitar</div>
                                    <div class="bh-history-meta">Instrument</div>
                                </td>
                                <td>Jasmine Villanovar</td>
                                <td>
                                    <span class="bh-status-pill bh-status-good">Good Condition</span><br />
                                    <span class="bh-history-id">ID:010</span>
                                </td>
                                <td><span class="bh-action-returned">Returned</span></td>
                                <td>Returned good</td>
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
