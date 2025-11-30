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
    <!-- Dashboard CSS -->
    <link rel="stylesheet" href="css/dashboard.css" />

    <!-- User Management styles (for this page) -->
    <style>
    /* ===== USER MANAGEMENT SECTION (Dashboard) ===== */

    .bh-users-wrapper {
        margin-top: 24px;
        background-color: var(--bh-card, #ffffff);
        border-radius: 18px;
        padding: 20px 22px 22px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.06);
        border: 1px solid #e5e7eb;
    }

    .bh-users-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 12px;
    }

    .bh-users-title {
        font-size: 18px;
        font-weight: 700;
        color: var(--bh-text-main, #111827);
    }

    .bh-users-sub {
        font-size: 12px;
        color: var(--bh-text-muted, #6b7280);
        margin-top: 2px;
    }

    .bh-users-add-btn {
        border-radius: 999px;
        padding: 8px 22px;
        border: none;
        background-color: #4f8dfd;
        color: #fff;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
        box-shadow: 0 8px 20px rgba(0,0,0,0.18);
    }

    .bh-users-add-btn:hover {
        filter: brightness(1.06);
    }

    .bh-users-body {
        margin-top: 6px;
        overflow-x: auto;
    }

    .bh-users-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 13px;
    }

    .bh-users-table thead tr {
        background-color: #f3f4ff;
    }

    .bh-users-table thead th {
        padding: 9px 14px;
        font-weight: 600;
        text-align: left;
        color: var(--bh-text-muted, #6b7280);
        border-bottom: 1px solid #e5e7eb;
        font-size: 12px;
    }

    .bh-users-table tbody td {
        padding: 10px 14px;
        border-bottom: 1px solid #f3f4f6;
        vertical-align: middle;
    }

    .bh-users-table tbody tr:last-child td {
        border-bottom: none;
    }

    /* align first + last col a bit */
    .bh-users-table tbody td:first-child {
        font-weight: 500;
        color: var(--bh-text-main, #111827);
    }

    .bh-users-table tbody td:last-child {
        text-align: right;
    }

    /* Role pill */
    .bh-role-pill {
        display: inline-block;
        padding: 3px 10px;
        border-radius: 999px;
        font-size: 11px;
        font-weight: 500;
    }

    .bh-role-admin {
        background-color: #e0f2ff;
        color: #0052b4;
    }

    .bh-role-student {
        background-color: #ecfdf5;
        color: #166534;
    }

    /* Status pill */
    .bh-user-status {
        display: inline-block;
        padding: 3px 10px;
        border-radius: 999px;
        font-size: 11px;
        font-weight: 600;
    }

    .bh-user-active {
        background-color: #dcfce7;
        color: #15803d;
    }

    .bh-user-disabled {
        background-color: #fee2e2;
        color: #b91c1c;
    }

    /* Action buttons */
    .bh-users-actions {
        display: inline-flex;
        gap: 6px;
    }

    .bh-users-action-btn {
        border-radius: 999px;
        padding: 4px 12px;
        border: 1px solid #d1d5db;
        background-color: #f9fafb;
        font-size: 11px;
        cursor: pointer;
        min-width: 56px;
    }

    .bh-users-action-btn:hover {
        background-color: #e5e7eb;
    }

    /* ===== USER MODAL ===== */

    .bh-user-modal {
        position: fixed;
        inset: 0;
        background: rgba(0,0,0,0.55);
        display: none;
        align-items: center;
        justify-content: center;
        z-index: 9999;
    }

    .bh-user-modal.show {
        display: flex;
    }

    .bh-user-modal-dialog {
        background: #f9fafb;
        border-radius: 18px;
        padding: 20px 24px 18px;
        max-width: 480px;
        width: 92%;
        box-shadow: 0 18px 50px rgba(0,0,0,0.35);
        font-size: 14px;
    }

    .bh-user-modal-title {
        font-weight: 700;
        font-size: 18px;
        margin-bottom: 4px;
        color: #111827;
    }

    .bh-user-modal-sub {
        font-size: 13px;
        color: #6b7280;
        margin-bottom: 14px;
    }

    .bh-user-form-group {
        margin-bottom: 10px;
    }

    .bh-user-form-group label {
        display: block;
        font-size: 13px;
        margin-bottom: 2px;
    }

    .bh-user-input,
    .bh-user-select {
        width: 100%;
        border-radius: 999px;
        border: 1px solid #d1d5db;
        padding: 7px 12px;
        font-size: 13px;
        background-color: #ffffff;
    }

    .bh-user-modal-actions {
        margin-top: 14px;
        display: flex;
        gap: 8px;
        justify-content: flex-end;
    }

    .bh-user-modal-primary {
        border-radius: 999px;
        padding: 6px 18px;
        border: none;
        background-color: #0046AD;
        color: #fff;
        font-size: 13px;
        cursor: pointer;
    }

    .bh-user-modal-secondary {
        border-radius: 999px;
        padding: 6px 18px;
        border: none;
        background-color: #e5e7eb;
        color: #374151;
        font-size: 13px;
        cursor: pointer;
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

            <!-- USER MANAGEMENT SECTION -->
            <div class="bh-users-wrapper">
                <div class="bh-users-header">
                    <div>
                        <div class="bh-users-title">User Management</div>
                        <div class="bh-users-sub">Manage admin and student accounts.</div>
                    </div>
                    <button type="button" class="bh-users-add-btn" id="btnAddUser">
                        Add user
                    </button>
                </div>

                <div class="bh-users-body">
                    <table class="bh-users-table" id="usersTable">
                        <thead>
                            <tr>
                                <th style="width: 22%;">Name</th>
                                <th style="width: 28%;">Email</th>
                                <th style="width: 15%;">Role</th>
                                <th style="width: 15%;">Status</th>
                                <th style="width: 20%;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Sample Admin -->
                            <tr>
                                <td>Admin User</td>
                                <td>admin@borrowhub.com</td>
                                <td>
                                    <span class="bh-role-pill bh-role-admin">Admin</span>
                                </td>
                                <td>
                                    <span class="bh-user-status bh-user-active">Active</span>
                                </td>
                                <td>
                                    <div class="bh-users-actions">
                                        <button type="button" class="bh-users-action-btn js-edit-user">Edit</button>
                                        <button type="button" class="bh-users-action-btn js-disable-user">Disable</button>
                                    </div>
                                </td>
                            </tr>

                            <!-- Sample Student -->
                            <tr>
                                <td>Renz Pangan</td>
                                <td>renz@sti.edu</td>
                                <td>
                                    <span class="bh-role-pill bh-role-student">Student</span>
                                </td>
                                <td>
                                    <span class="bh-user-status bh-user-active">Active</span>
                                </td>
                                <td>
                                    <div class="bh-users-actions">
                                        <button type="button" class="bh-users-action-btn js-edit-user">Edit</button>
                                        <button type="button" class="bh-users-action-btn js-disable-user">Disable</button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- USER MODAL -->
        <div class="bh-user-modal" id="userModal">
            <div class="bh-user-modal-dialog">
                <div class="bh-user-modal-title" id="userModalTitle">Add user</div>
                <div class="bh-user-modal-sub" id="userModalSub">
                    Create or update a user account.
                </div>

                <div class="bh-user-form-group">
                    <label for="umName">Full name</label>
                    <input type="text" id="umName" class="bh-user-input" />
                </div>

                <div class="bh-user-form-group">
                    <label for="umEmail">Email</label>
                    <input type="email" id="umEmail" class="bh-user-input" />
                </div>

                <div class="bh-user-form-group">
                    <label for="umRole">Role</label>
                    <select id="umRole" class="bh-user-select">
                        <option value="Admin">Admin</option>
                        <option value="Student">Student</option>
                    </select>
                </div>

                <div class="bh-user-form-group">
                    <label for="umStatus">Status</label>
                    <select id="umStatus" class="bh-user-select">
                        <option value="Active">Active</option>
                        <option value="Disabled">Disabled</option>
                    </select>
                </div>

                <div class="bh-user-modal-actions">
                    <button type="button" class="bh-user-modal-primary" id="btnSaveUser">Save</button>
                    <button type="button" class="bh-user-modal-secondary" id="btnCancelUser">Cancel</button>
                </div>
            </div>
        </div>

        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var addBtn = document.getElementById('btnAddUser');
                var userModal = document.getElementById('userModal');
                var modalTitle = document.getElementById('userModalTitle');

                var nameInput = document.getElementById('umName');
                var emailInput = document.getElementById('umEmail');
                var roleSelect = document.getElementById('umRole');
                var statusSelect = document.getElementById('umStatus');

                var saveBtn = document.getElementById('btnSaveUser');
                var cancelBtn = document.getElementById('btnCancelUser');
                var usersTable = document.getElementById('usersTable').querySelector('tbody');

                var editingRow = null; // null = add mode

                function openModal(mode, row) {
                    if (mode === 'add') {
                        editingRow = null;
                        modalTitle.textContent = 'Add user';
                        nameInput.value = '';
                        emailInput.value = '';
                        roleSelect.value = 'Student';
                        statusSelect.value = 'Active';
                    } else if (mode === 'edit' && row) {
                        editingRow = row;
                        modalTitle.textContent = 'Edit user';
                        nameInput.value = row.cells[0].textContent.trim();
                        emailInput.value = row.cells[1].textContent.trim();
                        // role from pill
                        var roleText = row.querySelector('.bh-role-pill').textContent.trim();
                        roleSelect.value = roleText;
                        // status from pill
                        var statusText = row.querySelector('.bh-user-status').textContent.trim();
                        statusSelect.value = statusText;
                    }
                    userModal.classList.add('show');
                }

                function closeModal() {
                    userModal.classList.remove('show');
                }

                // Add user button
                if (addBtn) {
                    addBtn.addEventListener('click', function () {
                        openModal('add');
                    });
                }

                // Edit buttons
                function attachEditHandlers() {
                    document.querySelectorAll('.js-edit-user').forEach(function (btn) {
                        btn.onclick = function () {
                            var row = btn.closest('tr');
                            openModal('edit', row);
                        };
                    });
                }

                // Disable buttons (just toggles pill UI)
                function attachDisableHandlers() {
                    document.querySelectorAll('.js-disable-user').forEach(function (btn) {
                        btn.onclick = function () {
                            var row = btn.closest('tr');
                            var statusSpan = row.querySelector('.bh-user-status');
                            if (statusSpan.textContent.trim() === 'Active') {
                                statusSpan.textContent = 'Disabled';
                                statusSpan.className = 'bh-user-status bh-user-disabled';
                            } else {
                                statusSpan.textContent = 'Active';
                                statusSpan.className = 'bh-user-status bh-user-active';
                            }
                        };
                    });
                }

                attachEditHandlers();
                attachDisableHandlers();

                // Save button
                saveBtn.addEventListener('click', function () {
                    var name = nameInput.value.trim();
                    var email = emailInput.value.trim();
                    var role = roleSelect.value;
                    var status = statusSelect.value;

                    if (!name || !email) {
                        alert('Please fill in name and email.');
                        return;
                    }

                    if (editingRow) {
                        // update existing row
                        editingRow.cells[0].textContent = name;
                        editingRow.cells[1].textContent = email;

                        var roleSpan = editingRow.querySelector('.bh-role-pill');
                        roleSpan.textContent = role;
                        roleSpan.className = 'bh-role-pill ' + (role === 'Admin' ? 'bh-role-admin' : 'bh-role-student');

                        var statusSpan = editingRow.querySelector('.bh-user-status');
                        statusSpan.textContent = status;
                        statusSpan.className = 'bh-user-status ' + (status === 'Active' ? 'bh-user-active' : 'bh-user-disabled');
                    } else {
                        // add new row
                        var newRow = document.createElement('tr');

                        var tdName = document.createElement('td');
                        tdName.textContent = name;

                        var tdEmail = document.createElement('td');
                        tdEmail.textContent = email;

                        var tdRole = document.createElement('td');
                        var roleSpanNew = document.createElement('span');
                        roleSpanNew.className = 'bh-role-pill ' + (role === 'Admin' ? 'bh-role-admin' : 'bh-role-student');
                        roleSpanNew.textContent = role;
                        tdRole.appendChild(roleSpanNew);

                        var tdStatus = document.createElement('td');
                        var statusSpanNew = document.createElement('span');
                        statusSpanNew.className = 'bh-user-status ' + (status === 'Active' ? 'bh-user-active' : 'bh-user-disabled');
                        statusSpanNew.textContent = status;
                        tdStatus.appendChild(statusSpanNew);

                        var tdActions = document.createElement('td');
                        var actionsDiv = document.createElement('div');
                        actionsDiv.className = 'bh-users-actions';

                        var editBtn = document.createElement('button');
                        editBtn.type = 'button';
                        editBtn.className = 'bh-users-action-btn js-edit-user';
                        editBtn.textContent = 'Edit';

                        var disableBtn = document.createElement('button');
                        disableBtn.type = 'button';
                        disableBtn.className = 'bh-users-action-btn js-disable-user';
                        disableBtn.textContent = 'Disable';

                        actionsDiv.appendChild(editBtn);
                        actionsDiv.appendChild(disableBtn);
                        tdActions.appendChild(actionsDiv);

                        newRow.appendChild(tdName);
                        newRow.appendChild(tdEmail);
                        newRow.appendChild(tdRole);
                        newRow.appendChild(tdStatus);
                        newRow.appendChild(tdActions);

                        usersTable.appendChild(newRow);

                        // reattach handlers for new buttons
                        attachEditHandlers();
                        attachDisableHandlers();
                    }

                    closeModal();
                });

                // Cancel & click outside
                cancelBtn.addEventListener('click', closeModal);
                userModal.addEventListener('click', function (e) {
                    if (e.target === userModal) {
                        closeModal();
                    }
                });
            });
        </script>
    </form>
</body>
</html>
