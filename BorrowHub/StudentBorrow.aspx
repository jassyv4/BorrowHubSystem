<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="StudentBorrow.aspx.cs"
    Inherits="BorrowHub.StudentBorrow" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Borrow Items - BorrowHub Student</title>

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
        .bh-addrequest-header {
            background-color: #f5dd3d;
            color: #1f2933;
            padding: 12px 18px;
            border-radius: 10px 10px 0 0;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
        }

        .bh-addrequest-header-sub {
            font-size: 12px;
            opacity: 0.9;
        }

        .bh-borrow-grid {
            background-color: #ffffff;
            border-radius: 0 0 10px 10px;
            padding: 16px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 12px;
        }

        .bh-borrow-card {
            background-color: #e5f1ff;
            border-radius: 10px;
            padding: 10px 12px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-height: 110px;
            cursor: pointer;
            transition: transform 0.1s ease, box-shadow 0.1s ease;
        }

        .bh-borrow-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.08);
        }

        .bh-borrow-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 6px;
        }

        .bh-borrow-name {
            font-size: 13px;
            font-weight: 600;
        }

        .bh-borrow-category {
            display: inline-block;
            margin-top: 4px;
            padding: 2px 8px;
            font-size: 11px;
            border-radius: 999px;
            background-color: #ffefc5;
            color: #7a4b00;
        }

        .bh-borrow-icon {
            font-size: 26px;
            color: #2563eb;
        }

        .bh-borrow-bottom {
            display: flex;
            justify-content: flex-end;
        }

        .bh-borrow-ok {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background-color: #22c55e;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 14px;
        }

        #studentBorrowFormWrapper {
            display: none;
            margin-top: 16px;
        }

        #studentBorrowFormWrapper.show {
            display: block;
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
                <a class="bh-tab bh-tab-active-student" href="StudentBorrow.aspx">Borrow</a>
                <a class="bh-tab" href="StudentPending.aspx">Pending Request</a>
                <a class="bh-tab" href="StudentHistory.aspx">History</a>
            </div>
            <!-- "+ Add Request" + BORROW GRID -->
            <div class="bh-returns-wrapper" style="margin-top:12px;">
                <div id="btnToggleBorrowForm" class="bh-addrequest-header">
                    + Add Request
                    <div class="bh-addrequest-header-sub">
                        Click here to add request
                    </div>
                </div>

                <div class="bh-borrow-grid">
                    <!-- Card 1 -->
                    <div class="bh-borrow-card" data-item="Chess Board Set" data-category="Board Game">
                        <div class="bh-borrow-top">
                            <div>
                                <div class="bh-borrow-name">Chess Board Set</div>
                                <div class="bh-borrow-category">Board Game</div>
                            </div>
                            <div class="bh-borrow-icon">
                                ♟️
                            </div>
                        </div>
                        <div class="bh-borrow-bottom">
                            <div class="bh-borrow-ok">
                                <i class='bx bx-check'></i>
                            </div>
                        </div>
                    </div>

                    <!-- Card 2 -->
                    <div class="bh-borrow-card" data-item="Microphone" data-category="Audio Visual">
                        <div class="bh-borrow-top">
                            <div>
                                <div class="bh-borrow-name">Microphone</div>
                                <div class="bh-borrow-category">Audio Visual</div>
                            </div>
                            <div class="bh-borrow-icon">
                                <i class='bx bx-microphone'></i>
                            </div>
                        </div>
                        <div class="bh-borrow-bottom">
                            <div class="bh-borrow-ok">
                                <i class='bx bx-check'></i>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3 -->
                    <div class="bh-borrow-card" data-item="Badminton" data-category="Sport">
                        <div class="bh-borrow-top">
                            <div>
                                <div class="bh-borrow-name">Badminton</div>
                                <div class="bh-borrow-category">Sport</div>
                            </div>
                            <div class="bh-borrow-icon">
                                🏸
                            </div>
                        </div>
                        <div class="bh-borrow-bottom">
                            <div class="bh-borrow-ok">
                                <i class='bx bx-check'></i>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4 -->
                    <div class="bh-borrow-card" data-item="Guitar" data-category="Instrument">
                        <div class="bh-borrow-top">
                            <div>
                                <div class="bh-borrow-name">Guitar</div>
                                <div class="bh-borrow-category">Instrument</div>
                            </div>
                            <div class="bh-borrow-icon">
                                🎸
                            </div>
                        </div>
                        <div class="bh-borrow-bottom">
                            <div class="bh-borrow-ok">
                                <i class='bx bx-check'></i>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5 -->
                    <div class="bh-borrow-card" data-item="Bluetooth Speaker" data-category="Audio Visual">
                        <div class="bh-borrow-top">
                            <div>
                                <div class="bh-borrow-name">Bluetooth Speaker</div>
                                <div class="bh-borrow-category">Audio Visual</div>
                            </div>
                            <div class="bh-borrow-icon">
                                🔊
                            </div>
                        </div>
                        <div class="bh-borrow-bottom">
                            <div class="bh-borrow-ok">
                                <i class='bx bx-check'></i>
                            </div>
                        </div>
                    </div>

                    <!-- Card 6 -->
                    <div class="bh-borrow-card" data-item="Volleyball" data-category="Sport">
                        <div class="bh-borrow-top">
                            <div>
                                <div class="bh-borrow-name">Volleyball</div>
                                <div class="bh-borrow-category">Sport</div>
                            </div>
                            <div class="bh-borrow-icon">
                                🏐
                            </div>
                        </div>
                        <div class="bh-borrow-bottom">
                            <div class="bh-borrow-ok">
                                <i class='bx bx-check'></i>
                            </div>
                        </div>
                    </div>

                    <!-- Card 7 -->
                    <div class="bh-borrow-card" data-item="Basketball" data-category="Sport">
                        <div class="bh-borrow-top">
                            <div>
                                <div class="bh-borrow-name">Basketball</div>
                                <div class="bh-borrow-category">Sport</div>
                            </div>
                            <div class="bh-borrow-icon">
                                🏀
                            </div>
                        </div>
                        <div class="bh-borrow-bottom">
                            <div class="bh-borrow-ok">
                                <i class='bx bx-check'></i>
                            </div>
                        </div>
                    </div>

                    <!-- Card 8 -->
                    <div class="bh-borrow-card" data-item="Scientific Calculator" data-category="Academic">
                        <div class="bh-borrow-top">
                            <div>
                                <div class="bh-borrow-name">Scientific Calculator</div>
                                <div class="bh-borrow-category">Academic</div>
                            </div>
                            <div class="bh-borrow-icon">
                                🧮
                            </div>
                        </div>
                        <div class="bh-borrow-bottom">
                            <div class="bh-borrow-ok">
                                <i class='bx bx-check'></i>
                            </div>
                        </div>
                    </div>

                    <!-- Card 9 -->
                    <div class="bh-borrow-card" data-item="Table Tennis" data-category="Sport">
                        <div class="bh-borrow-top">
                            <div>
                                <div class="bh-borrow-name">Table Tennis</div>
                                <div class="bh-borrow-category">Sport</div>
                            </div>
                            <div class="bh-borrow-icon">
                                🏓
                            </div>
                        </div>
                        <div class="bh-borrow-bottom">
                            <div class="bh-borrow-ok">
                                <i class='bx bx-check'></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- BORROW FORM (student) -->
            <div id="studentBorrowFormWrapper" class="bh-request-form-wrapper">
                <div class="bh-request-form-header">
                    Borrow an Item
                </div>
                <div class="bh-request-form-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div style="font-size:13px; font-weight:500;">
                            Fill out this form to send a borrow request.
                        </div>
                        <button type="button" class="bh-form-submit" id="btnFakeSubmit">
                            Submit Request
                        </button>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="bh-form-label">Full Name</label>
                            <input type="text" class="form-control bh-form-control" id="sbFullName" placeholder="Your full name" />
                        </div>
                        <div class="col-md-6">
                            <label class="bh-form-label">Section</label>
                            <input type="text" class="form-control bh-form-control" id="sbSection" placeholder="e.g. BSCS 3A" />
                        </div>

                        <div class="col-md-6">
                            <label class="bh-form-label">Item</label>
                            <input type="text" class="form-control bh-form-control" id="sbItem" placeholder="Select from cards above" />
                        </div>
                        <div class="col-md-6">
                            <label class="bh-form-label">Category</label>
                            <input type="text" class="form-control bh-form-control" id="sbCategory" placeholder="Auto-filled from selected item" />
                        </div>

                        <div class="col-md-6">
                            <label class="bh-form-label">Borrow Date</label>
                            <input type="date" class="form-control bh-form-control" id="sbBorrowDate" />
                        </div>
                        <div class="col-md-6">
                            <label class="bh-form-label">Return Date</label>
                            <input type="date" class="form-control bh-form-control" id="sbReturnDate" />
                        </div>

                        <div class="col-md-6">
                            <label class="bh-form-label">Borrow Time</label>
                            <input type="time" class="form-control bh-form-control" id="sbBorrowTime" />
                        </div>
                        <div class="col-md-6">
                            <label class="bh-form-label">Contact No.</label>
                            <input type="text" class="form-control bh-form-control" id="sbContact" />
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var toggleHeader = document.getElementById('btnToggleBorrowForm');
                var formWrapper = document.getElementById('studentBorrowFormWrapper');

                if (toggleHeader && formWrapper) {
                    toggleHeader.addEventListener('click', function () {
                        formWrapper.classList.toggle('show');
                        formWrapper.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    });
                }
                document.querySelectorAll('.bh-borrow-card').forEach(function (card) {
                    card.addEventListener('click', function () {
                        var item = card.getAttribute('data-item') || '';
                        var cat = card.getAttribute('data-category') || '';

                        var itemInput = document.getElementById('sbItem');
                        var catInput = document.getElementById('sbCategory');

                        if (itemInput) itemInput.value = item;
                        if (catInput) catInput.value = cat;

                        if (formWrapper && !formWrapper.classList.contains('show')) {
                            formWrapper.classList.add('show');
                        }
                        formWrapper.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    });
                });

                var btnFakeSubmit = document.getElementById('btnFakeSubmit');
                if (btnFakeSubmit) {
                    btnFakeSubmit.addEventListener('click', function () {
                        alert('Borrow request submitted (front-end only for now).');
                    });
                }
            });
        </script>
    </form>
</body>
</html>
