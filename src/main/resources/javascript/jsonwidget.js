//callback function that configures and initializes DataTables
function renderTable(xhrdata, targetTable) {
    var cols = [];
    var table;
    var exampleRecord = JSON.parse(xhrdata);
    var keys = Object.keys(exampleRecord.items[0]);
    keys.forEach(function (k) {
        cols.push({
            title: k,
            data: k
            //optionally do some type detection here for render function
        });
    });
    if ($.fn.dataTable.isDataTable(targetTable)) {

        table = $(targetTable).DataTable();

    } else {
        table = $(targetTable).DataTable({
            columns: cols,
            paging: true,
            searching: false,
            "pageLength": 3,
            "lengthChange": false
        });
    }

    table.rows.add(exampleRecord.items).draw();
}