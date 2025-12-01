<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRequests.aspx.cs"
    Inherits="BorrowHub.AdminRequests" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Requests - BorrowHub Admin</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Boxicons -->
    <link href="https://cdn.boxicons.com/3.0.3/fonts/basic/boxicons.min.css" rel="stylesheet" />
    <!-- Dashboard CSS (use ResolveUrl so path is always right) -->
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
                            <%: Session["Email"] as string %>
                        </div>
                    </div>
                    <asp:Button ID="btnLogoutAdmin" runat="server" Text="Log out"
                        CssClass="bh-logout-btn" OnClick="btnLogoutAdmin_Click" />
                </div>
            </div>

            <!-- NAV TABS -->
            <div class="bh-tabs">
                <a class="bh-tab" href="AdminDashboard.aspx">Dashboard</a>
                <a class="bh-tab bh-tab-active-admin" href="AdminRequests.aspx">Requests</a>
                <a class="bh-tab" href="AdminReturns.aspx">Returns</a>
                <a class="bh-tab" href="AdminInventory.aspx">Inventory</a>
                <a class="bh-tab" href="AdminHistory.aspx">History</a>
            </div>

            <!-- REQUESTS LIST -->
            <div class="bh-requests-wrapper">

                <div class="bh-requests-header">
                    + Add Request
                    <div class="bh-requests-header-sub">
                        Click here to add request
                    </div>
                </div>

                <div class="bh-requests-body">
                    <!-- card 1: expanded info -->
                    <div class="bh-request-card">
                        <div class="bh-request-main">
                            <div class="bh-request-title">Chess board set</div>
                            <div class="bh-request-meta">Requested by: Renz Pangan</div>

                            <div class="bh-request-more">
                                <strong>More information:</strong><br />
                                Date Borrow: November 20, 2025<br />
                                Date Return: November 21, 2025<br />
                                Borrow Time: 12:00 PM<br />
                                Status: Pending
                            </div>
                        </div>
                        <div class="bh-request-actions">
                            <button type="button" class="bh-circle-btn bh-circle-approve">
                                <i class='bx bx-check'></i>
                            </button>
                            <button type="button" class="bh-circle-btn bh-circle-deny">
                                <i class='bx bx-x'></i>
                            </button>
                        </div>
                    </div>

                    <!-- other cards -->
                    <div class="bh-request-card">
                        <div class="bh-request-main">
                            <div class="bh-request-title">Volleyball</div>
                            <div class="bh-request-meta">Requested by: Vivian Dela Cruz</div>
                        </div>
                        <div class="bh-request-actions">
                            <button type="button" class="bh-circle-btn bh-circle-approve">
                                <i class='bx bx-check'></i>
                            </button>
                            <button type="button" class="bh-circle-btn bh-circle-deny">
                                <i class='bx bx-x'></i>
                            </button>
                        </div>
                    </div>

                    <div class="bh-request-card">
                        <div class="bh-request-main">
                            <div class="bh-request-title">Guitar</div>
                            <div class="bh-request-meta">Requested by: Jasmine Villanovar</div>
                        </div>
                        <div class="bh-request-actions">
                            <button type="button" class="bh-circle-btn bh-circle-approve">
                                <i class='bx bx-check'></i>
                            </button>
                            <button type="button" class="bh-circle-btn bh-circle-deny">
                                <i class='bx bx-x'></i>
                            </button>
                        </div>
                    </div>

                    <div class="bh-request-card">
                        <div class="bh-request-main">
                            <div class="bh-request-title">Badminton</div>
                            <div class="bh-request-meta">Requested by: Rio Galura</div>
                        </div>
                        <div class="bh-request-actions">
                            <button type="button" class="bh-circle-btn bh-circle-approve">
                                <i class='bx bx-check'></i>
                            </button>
                            <button type="button" class="bh-circle-btn bh-circle-deny">
                                <i class='bx bx-x'></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- BORROW FORM ONLY -->
            <div class="bh-request-form-wrapper">
                <div class="bh-request-form-header">
                    Borrow an Item
                </div>
                <div class="bh-request-form-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="bh-form-toggle">
                            <!-- Just a label now, no toggle -->
                            <button type="button" id="btnBorrowToggle" class="active-borrow">
                                Borrow Item
                            </button>
                        </div>
                        <button type="button" class="bh-form-submit">Submit</button>
                    </div>

                    <!-- BORROW FORM -->
                    <div id="borrowForm" class="row g-3">
                        <div class="col-md-6">
                            <label class="bh-form-label">Full Name</label>
                            <input type="text" class="form-control bh-form-control" />
                        </div>
                        <div class="col-md-6">
                            <label class="bh-form-label">Section</label>
                            <input type="text" class="form-control bh-form-control" />
                        </div>

                        <div class="col-md-6">
                            <label class="bh-form-label">Quantity</label>
                            <input type="number" class="form-control bh-form-control" />
                        </div>
                        <div class="col-md-6">
                            <label class="bh-form-label">Borrow date</label>
                            <input type="date" class="form-control bh-form-control" />
                        </div>

                        <div class="col-md-6">
                            <label class="bh-form-label">Return Date</label>
                            <input type="date" class="form-control bh-form-control" />
                        </div>
                        <div class="col-md-6">
                            <label class="bh-form-label">Borrow time</label>
                            <input type="time" class="form-control bh-form-control" />
                        </div>

                        <div class="col-md-6">
                            <label class="bh-form-label">Contact No.</label>
                            <input type="text" class="form-control bh-form-control" />
                        </div>
                        <div class="col-md-6">
                            <label class="bh-form-label">Item</label>
                            <input type="text" class="form-control bh-form-control" />
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // expand/collapse request cards
                document.querySelectorAll('.bh-request-card').forEach(function (card) {
                    card.addEventListener('click', function (e) {
                        if (e.target.closest('.bh-circle-btn')) {
                            return;
                        }
                        card.classList.toggle('expanded');
                    });
                });

                // show/hide borrow form when header clicked
                var header = document.querySelector('.bh-requests-header');
                var formWrapper = document.querySelector('.bh-request-form-wrapper');

                if (header && formWrapper) {
                    header.addEventListener('click', function () {
                        formWrapper.classList.toggle('show');
                    });
                }
            });
        </script>
    </form>
</body>
</html>
