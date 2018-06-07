<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!--Bootstrap Table Sample [ SAMPLE ]-->
    <script src="<c:url value='/resources/js/demo/tables-bs-table.js'/>"></script>

    <!--X-editable [ OPTIONAL ]-->
    <script src="<c:url value='/resources/plugins/x-editable/js/bootstrap-editable.min.js'/>"></script>

    <!--Bootstrap Table [ OPTIONAL ]-->
    <script src="<c:url value='/resources/plugins/bootstrap-table/bootstrap-table.min.js'/>"></script>

    <!--Bootstrap Table Extension [ OPTIONAL ]-->
    <script src="<c:url value='/resources/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js'/>"></script>

 	<div id="page-head">
		<div class="pad-all text-center">
		    <h3>Welcome back to the Dashboard.</h3>
		    <p1>Scroll down to see quick links and overviews of your Server, To do list, Order status or get some Help using Nifty.</p>
		</div>
	</div>
    
	<!--Page content-->
	<!--===================================================-->
	<div id="page-content"> 
	
		<!--Basic Columns-->
		<!--===================================================-->
		<div class="panel">
		    <div class="panel-heading">
		        <h3 class="panel-title">Basic Columns</h3>
		    </div>
		    
		    <div class="panel-body">
		        <table data-toggle="table"
		               data-url="<c:url value='/list.do'/>"
		               data-show-columns="true"
		               data-page-list="[5, 10, 20]"
		               data-page-size="5"
		               data-pagination="true" data-show-pagination-switch="true">
		            <thead>
		                <tr>
		                    <th data-field="seq" data-switchable="false">seq</th>
		                    <th data-field="fullName">Name</th>
		                    <th data-field="lastLogin">Last Login</th>
		                    <th data-field="reserve">Point</th>
		                    <th data-field="userName" data-visible="false">username</th>
		                </tr>
		            </thead>
		        </table>
		    </div>
		</div>
		
		<!--===================================================-->
		
		
		<!--Checkbox Select-->
		<!--===================================================-->
		<div class="row">
		    <div class="col-md-6">
		        <div class="panel">
		            <div class="panel-heading">
		                <h3 class="panel-title">Checkbox Select</h3>
		            </div>
		            <div class="panel-body">
		                <table class="demo-add-niftycheck" data-toggle="table"
		                       data-url="<c:url value='/resources/data/bs-table-simple.json'/>"
		                       data-page-size="10"
		                       data-pagination="true">
		                    <thead>
		                        <tr>
		                            <th data-field="state" data-checkbox="true"></th>
		                            <th data-field="id" data-switchable="false">ID</th>
		                            <th data-field="name">Name</th>
		                            <th data-field="date">Last Login</th>
		                            <th data-field="amount">Balance</th>
		                            <th data-field="user-status" data-visible="false">Status</th>
		                        </tr>
		                    </thead>
		                </table>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-6">
		        <div class="panel">
		            <div class="panel-heading">
		                <h3 class="panel-title">Radio Select</h3>
		            </div>
		            <div class="panel-body">
		                <table class="demo-add-niftyradio" data-toggle="table"
		                       data-url="<c:url value='/resources/data/bs-table-simple.json'/>"
		                       data-page-size="10"
		                       data-pagination="true">
		                    <thead>
		                        <tr>
		                            <th data-field="state" data-radio="true"></th>
		                            <th data-field="id" data-switchable="false">ID</th>
		                            <th data-field="name">Name</th>
		                            <th data-field="date">Last Login</th>
		                            <th data-field="amount">Balance</th>
		                            <th data-field="user-status" data-visible="false">Status</th>
		                        </tr>
		                    </thead>
		                </table>
		            </div>
		        </div>
		    </div>
		</div>
		<!--===================================================-->
		
		
		<!--Sort & Format Column-->
		<!--===================================================-->
		<div class="panel">
		    <div class="panel-heading">
		        <h3 class="panel-title">Sort &amp; Format Column</h3>
		    </div>
		    <div class="panel-body">
		        <table data-toggle="table"
		               data-url="<c:url value='/resources/data/bs-table.json'/>"
		               data-sort-name="id"
		               data-page-list="[5, 10, 20]"
		               data-page-size="5"
		               data-pagination="true" data-show-pagination-switch="true">
		            <thead>
		                <tr>
		                    <th data-field="id" data-sortable="true" data-formatter="invoiceFormatter">ID</th>
		                    <th data-field="name" data-sortable="true">Name</th>
		                    <th data-field="date" data-sortable="true" data-formatter="dateFormatter">Order date</th>
		                    <th data-field="amount" data-align="center" data-sortable="true" data-sorter="priceSorter">Balance</th>
		                    <th data-field="status" data-align="center" data-sortable="true" data-formatter="statusFormatter">Status</th>
		                    <th data-field="track" data-align="center" data-sortable="true" data-formatter="trackFormatter">Tracking Number</th>
		                </tr>
		            </thead>
		        </table>
		    </div>
		</div>
		<!--===================================================-->
		
		
		<!--Basic Toolbar-->
		<!--===================================================-->
		<div class="panel">
		    <div class="panel-heading">
		        <h3 class="panel-title">Basic Toolbar</h3>
		    </div>
		    <div class="panel-body">
		        <table data-toggle="table"
		               data-url="<c:url value='/list.do'/>"
		               data-search="true"
		               data-show-refresh="true"
		               data-show-toggle="true"
		               data-show-columns="true"
		               data-sort-name="id"
		               data-page-list="[5, 10, 20]"
		               data-page-size="5"
		               data-pagination="true" data-show-pagination-switch="true">
		            <thead>
		                <tr>
		                    <th data-field="seq" data-sortable="true" >seq</th>
		                    <th data-field="fullName" data-sortable="true">Name</th>
		                    <th data-field="userName" data-sortable="true" data-formatter="dateFormatter">username</th>
		                    <th data-field="createDate" data-align="center" data-sortable="true" >create_Date</th>
		                    <th data-field="lastLogin" data-align="center" data-sortable="true" data-formatter="trackFormatter">last_login</th>
		           		    <th data-field="reserve" data-align="center" data-sortable="true" data-formatter="trackFormatter">reserve</th>
		                </tr>
		            </thead>
		        </table>
		    </div>
		</div>
		<!--===================================================-->
		
		
		<!--Custom Toolbar-->
		<!--===================================================-->
		<div class="panel">
		    <div class="panel-heading">
		        <h3 class="panel-title">Custom Toolbar</h3>
		    </div>
		    <div class="panel-body">
		        <button id="demo-delete-row" class="btn btn-danger" disabled><i class="demo-pli-cross"></i> Delete</button>
		        <table id="demo-custom-toolbar" class="demo-add-niftycheck" data-toggle="table"
		               data-url="<c:url value='/resources/data/bs-table.json'/>"
		               data-toolbar="#demo-delete-row"
		               data-search="true"
		               data-show-refresh="true"
		               data-show-toggle="true"
		               data-show-columns="true"
		               data-sort-name="id"
		               data-page-list="[5, 10, 20]"
		               data-page-size="5"
		               data-pagination="true" data-show-pagination-switch="true">
		            <thead>
		                <tr>
		                    <th data-field="state" data-checkbox="true">ID</th>
		                    <th data-field="id" data-sortable="true" data-formatter="invoiceFormatter">ID</th>
		                    <th data-field="name" data-sortable="true">Name</th>
		                    <th data-field="date" data-sortable="true" data-formatter="dateFormatter">Order date</th>
		                    <th data-field="amount" data-align="center" data-sortable="true" data-sorter="priceSorter">Balance</th>
		                    <th data-field="status" data-align="center" data-sortable="true" data-formatter="statusFormatter">Status</th>
		                    <th data-field="track" data-align="center" data-sortable="true" data-formatter="trackFormatter">Tracking Number</th>
		                </tr>
		            </thead>
		        </table>
		    </div>
		</div>
		<!--===================================================-->
	
	</div>
	<!--===================================================-->
	<!--End page content-->
