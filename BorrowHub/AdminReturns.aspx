<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminReturns.aspx.cs"
    Inherits="BorrowHub.AdminReturns" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Returns - BorrowHub Admin</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Boxicons -->
    <link href="https://cdn.boxicons.com/3.0.3/fonts/basic/boxicons.min.css" rel="stylesheet" />
    <!-- Dashboard CSS -->
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/dashboard.css") %>" />
</head>
<body class="dashboard-page">

    <!-- RETURN MODAL: OUTSIDE the form/shell -->
    <div id="returnModal" class="bh-modal">
        <div class="bh-modal-dialog">
            <div class="bh-modal-title" id="modalItemTitle">Return: Item</div>
            <div class="bh-modal-sub" id="modalBorrowerText">
                Processing return for Student Name
            </div>

            <div class="bh-modal-section-label">Item Condition:</div>
            <div class="bh-condition-group">
                <button type="button" id="condGood" class="bh-condition-btn active">
                    Good Condition
                </button>
                <button type="button" id="condDamaged" class="bh-condition-btn">
                    Damaged
                </button>
            </div>

            <div class="bh-modal-section-label">Notes (Optional)</div>
            <textarea id="modalNotes" class="bh-modal-notes"
                      placeholder="Add any notes about the item condition or return process..."></textarea>

            <div class="bh-modal-actions">
                <button type="button" id="btnProcessReturn" class="bh-modal-primary">
                    Process Return
                </button>
                <button type="button" id="btnCancelReturn" class="bh-modal-secondary">
                    Cancel
                </button>
            </div>
        </div>
    </div>

    <!-- SINGLE server form -->
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
    <a class="bh-tab" href="AdminRequests.aspx">Requests</a>
    <a class="bh-tab bh-tab-active-admin" href="AdminReturns.aspx">Returns</a>
    <a class="bh-tab" href="AdminInventory.aspx">Inventory</a>
    <a class="bh-tab" href="#">History</a>
</div>
            <!-- RETURNS LIST -->
            <div class="bh-returns-wrapper">
                <div class="bh-returns-header">
                    Items Available for Return
                    <div class="bh-returns-header-sub">
                        Click on an item to process its return
                    </div>
                </div>

                <div class="bh-returns-body">

                    <!-- Card 1 -->
                    <div class="bh-return-card">
                        <div class="bh-return-main">
                            <div class="bh-return-title">
                                Chess board set
                                <span class="bh-overdue-badge">Overdue</span>
                            </div>
                            <div class="bh-return-meta">
                                Borrowed by: Renz Pangan<br />
                                Borrowed: 11/2/2025 | Due: 11/9/2025
                            </div>
                        </div>
                        <div class="bh-return-icon">
                            <i class='bx bx-error-circle'></i>
                        </div>
                    </div>

                    <!-- Card 2 -->
                    <div class="bh-return-card">
                        <div class="bh-return-main">
                            <div class="bh-return-title">
                                Chess board set
                                <span class="bh-overdue-badge">Overdue</span>
                            </div>
                            <div class="bh-return-meta">
                                Borrowed by: Rio Unjane Galura<br />
                                Borrowed: 1/2/2025 | Due: 1/9/2025
                            </div>
                        </div>
                        <div class="bh-return-icon">
                            <i class='bx bx-error-circle'></i>
                        </div>
                    </div>

                    <!-- Card 3 -->
                    <div class="bh-return-card">
                        <div class="bh-return-main">
                            <div class="bh-return-title">
                                Chess board set
                                <span class="bh-overdue-badge">Overdue</span>
                            </div>
                            <div class="bh-return-meta">
                                Borrowed by: Vivian Aira Dela Cruz<br />
                                Borrowed: 1/2/2025 | Due: 1/9/2025
                            </div>
                        </div>
                        <div class="bh-return-icon">
                            <i class='bx bx-error-circle'></i>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <!-- SCRIPTS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // ===== 1. Open modal when clicking a return card =====
                var modal = document.getElementById('returnModal');
                var modalItemTitle = document.getElementById('modalItemTitle');
                var modalBorrower = document.getElementById('modalBorrowerText');
                var modalNotes = document.getElementById('modalNotes');

                document.querySelectorAll('.bh-return-card').forEach(function (card) {
                    card.addEventListener('click', function () {
                        // get item name (text before the badge)
                        var titleEl = card.querySelector('.bh-return-title');
                        var rawTitle = titleEl ? titleEl.childNodes[0].textContent.trim() : 'Item';

                        // get borrower line
                        var metaEl = card.querySelector('.bh-return-meta');
                        var borrowerLine = metaEl ? metaEl.textContent.trim().split('\n')[0] : '';

                        // set modal texts
                        modalItemTitle.textContent = 'Return: ' + rawTitle;
                        modalBorrower.textContent = borrowerLine || 'Processing return';

                        // reset notes & condition
                        modalNotes.value = '';
                        setCondition('good');

                        // show modal
                        modal.classList.add('show');
                    });
                });

                // ===== 2. Condition buttons =====
                var condGoodBtn = document.getElementById('condGood');
                var condDamagedBtn = document.getElementById('condDamaged');
                var selectedCondition = 'Good Condition';

                function setCondition(type) {
                    if (type === 'good') {
                        selectedCondition = 'Good Condition';
                        condGoodBtn.classList.add('active');
                        condDamagedBtn.classList.remove('active');
                    } else {
                        selectedCondition = 'Damaged';
                        condDamagedBtn.classList.add('active');
                        condGoodBtn.classList.remove('active');
                    }
                }

                condGoodBtn.addEventListener('click', function (e) {
                    e.stopPropagation();
                    setCondition('good');
                });

                condDamagedBtn.addEventListener('click', function (e) {
                    e.stopPropagation();
                    setCondition('damaged');
                });

                // ===== 3. Process / Cancel buttons =====
                var btnProcess = document.getElementById('btnProcessReturn');
                var btnCancel = document.getElementById('btnCancelReturn');

                btnProcess.addEventListener('click', function (e) {
                    e.stopPropagation();

                    // for now just show an alert; later you can call server-side logic
                    alert('Return processed as: ' + selectedCondition +
                        '\n\nNotes:\n' + (modalNotes.value || '(none)'));

                    modal.classList.remove('show');
                });

                btnCancel.addEventListener('click', function (e) {
                    e.stopPropagation();
                    modal.classList.remove('show');
                });

                // optional: click outside dialog to close
                modal.addEventListener('click', function (e) {
                    if (e.target === modal) {
                        modal.classList.remove('show');
                    }
                });
            });
        </script>
    </form>
</body>
</html>
