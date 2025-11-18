<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminInventory.aspx.cs"
    Inherits="BorrowHub.AdminInventory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory - BorrowHub Admin</title>

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
                <a class="bh-tab bh-tab-active-admin" href="AdminInventory.aspx">Inventory</a>
                <a class="bh-tab" href="AdminHistory.aspx">History</a>
            </div>

            <!-- SUMMARY CARDS -->
            <div class="row g-3 bh-cards-row">
                <div class="col-md-3 col-6">
                    <div class="bh-card bh-card-blue">
                        <div class="bh-card-label">Total Items</div>
                        <div class="bh-card-main">
                            <div class="bh-card-value">50</div>
                            <div class="bh-card-icon">
                                <i class='bx bx-cube-alt'></i>
                            </div>
                        </div>
                        <div class="bh-card-sub">In inventory</div>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="bh-card bh-card-green">
                        <div class="bh-card-label">Available</div>
                        <div class="bh-card-main">
                            <div class="bh-card-value">30</div>
                            <div class="bh-card-icon">
                                <i class='bx bx-check-circle'></i>
                            </div>
                        </div>
                        <div class="bh-card-sub">Ready to borrow</div>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="bh-card bh-card-orange">
                        <div class="bh-card-label">Borrowed</div>
                        <div class="bh-card-main">
                            <div class="bh-card-value">15</div>
                            <div class="bh-card-icon">
                                <i class='bx bx-export'></i>
                            </div>
                        </div>
                        <div class="bh-card-sub">Currently out</div>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="bh-card bh-card-red">
                        <div class="bh-card-label">Low Stock</div>
                        <div class="bh-card-main">
                            <div class="bh-card-value">1</div>
                            <div class="bh-card-icon">
                                <i class='bx bx-error-circle'></i>
                            </div>
                        </div>
                        <div class="bh-card-sub">Need attention</div>
                    </div>
                </div>
            </div>

            <!-- INVENTORY TABLE -->
            <div class="bh-inventory-wrapper">
                <div class="bh-inventory-header">
                    <div>
                        <div class="bh-inventory-title">Inventory Items</div>
                        <div class="bh-inventory-sub">Showing 4 of 9 items</div>
                    </div>
                    <button type="button" id="btnShowAddItem" class="bh-inventory-add-btn">
                        Add item
                    </button>
                </div>
                <div class="bh-inventory-body">
                    <table class="bh-inventory-table">
                        <thead>
                            <tr>
                                <th>Item Name</th>
                                <th>Category</th>
                                <th class="text-center">Available</th>
                                <th class="text-center">Total</th>
                                <th class="text-center">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Chess Board Set</td>
                                <td>
                                    <span class="bh-tag">Board Game</span>
                                </td>
                                <td class="text-center">
                                    <span class="bh-qty-ok">2</span>
                                </td>
                                <td class="text-center">2</td>
                                <td class="text-center">
                                    <span class="bh-status bh-status-instock">In Stock</span>
                                </td>
                            </tr>

                            <tr>
                                <td>Microphone</td>
                                <td>
                                    <span class="bh-tag">AVR</span>
                                </td>
                                <td class="text-center">
                                    <span class="bh-qty-zero">0</span>
                                </td>
                                <td class="text-center">3</td>
                                <td class="text-center">
                                    <span class="bh-status bh-status-out">Out of Stock</span>
                                </td>
                            </tr>

                            <tr>
                                <td>Badminton</td>
                                <td>
                                    <span class="bh-tag">Sport</span>
                                </td>
                                <td class="text-center">
                                    <span class="bh-qty-ok">4</span>
                                </td>
                                <td class="text-center">5</td>
                                <td class="text-center">
                                    <span class="bh-status bh-status-instock">In Stock</span>
                                </td>
                            </tr>

                            <tr>
                                <td>Guitar</td>
                                <td>
                                    <span class="bh-tag">Instrument</span>
                                </td>
                                <td class="text-center">
                                    <span class="bh-qty-ok">5</span>
                                </td>
                                <td class="text-center">7</td>
                                <td class="text-center">
                                    <span class="bh-status bh-status-instock">In Stock</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- ADD ITEM MODAL -->
        <div id="addItemModal" class="bh-modal">
            <div class="bh-modal-dialog">
                <div class="bh-modal-title">Add Item</div>
                <div class="bh-modal-sub">
                    Add new item to your inventory.
                </div>

                <div class="bh-modal-section-label">Item details</div>

                <div class="row g-3 mb-2">
                    <div class="col-md-6">
                        <label class="bh-form-label" for="txtNewItemName">Item Name</label>
                        <input type="text" id="txtNewItemName" class="form-control bh-form-control" />
                    </div>
                    <div class="col-md-6">
                        <label class="bh-form-label" for="txtNewItemCategory">Category</label>
                        <input type="text" id="txtNewItemCategory" class="form-control bh-form-control" />
                    </div>
                </div>

                <div class="row g-3 mb-2">
                    <div class="col-md-6">
                        <label class="bh-form-label" for="txtNewItemTotal">Total</label>
                        <input type="number" id="txtNewItemTotal" class="form-control bh-form-control" min="0" />
                    </div>
                    <div class="col-md-6">
                        <label class="bh-form-label" for="txtNewItemAvailable">Available now (optional)</label>
                        <input type="number" id="txtNewItemAvailable" class="form-control bh-form-control" min="0" />
                    </div>
                </div>

                <div class="bh-modal-actions">
                    <button type="button" id="btnSaveAddItem" class="bh-modal-primary">
                        Add Item
                    </button>
                    <button type="button" id="btnCancelAddItem" class="bh-modal-secondary">
                        Cancel
                    </button>
                </div>
            </div>
        </div>

        <!-- SCRIPTS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var addBtn = document.getElementById('btnShowAddItem');
                var modal = document.getElementById('addItemModal');
                var btnSave = document.getElementById('btnSaveAddItem');
                var btnCancel = document.getElementById('btnCancelAddItem');

                var txtName = document.getElementById('txtNewItemName');
                var txtCategory = document.getElementById('txtNewItemCategory');
                var txtTotal = document.getElementById('txtNewItemTotal');
                var txtAvailable = document.getElementById('txtNewItemAvailable');

                function openAddModal() {
                    txtName.value = '';
                    txtCategory.value = '';
                    txtTotal.value = '';
                    txtAvailable.value = '';
                    modal.classList.add('show');
                }

                function closeAddModal() {
                    modal.classList.remove('show');
                }

                if (addBtn) {
                    addBtn.addEventListener('click', function (e) {
                        e.preventDefault();
                        openAddModal();
                    });
                }

                if (btnCancel) {
                    btnCancel.addEventListener('click', function (e) {
                        e.stopPropagation();
                        closeAddModal();
                    });
                }

                if (modal) {
                    modal.addEventListener('click', function (e) {
                        if (e.target === modal) {
                            closeAddModal();
                        }
                    });
                }

                if (btnSave) {
                    btnSave.addEventListener('click', function (e) {
                        e.preventDefault();
                        e.stopPropagation();

                        var name = txtName.value.trim();
                        var cat = txtCategory.value.trim();
                        var total = txtTotal.value.trim();

                        if (!name || !cat || !total) {
                            alert('Please fill in Item Name, Category, and Total.');
                            return;
                        }

                        // For now just show confirmation.
                        alert(
                            'New item added (demo only):\n\n' +
                            'Name: ' + name + '\n' +
                            'Category: ' + cat + '\n' +
                            'Total: ' + total + '\n' +
                            'Available: ' + (txtAvailable.value || '(same as total)')
                        );

                        closeAddModal();
                    });
                }
            });
        </script>
    </form>
</body>
</html>