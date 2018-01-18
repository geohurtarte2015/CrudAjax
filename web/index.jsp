

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" media="screen" href="plantilla/bower_components/bootstrap/dist/css/bootstrap.min.css" />
        <link href="bootdate/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
        
        
        <script type="text/javascript" src="plantilla/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="plantilla/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="plantilla/js/moment.js"></script>
	<script src="bootdate/src/js/bootstrap-datetimepicker.js"></script>  
        
        <!-- Alert Bootbox -->
        <script src="bootbox/bootbox.min.js"></script> 
        
        <!-- DataTables JavaScript -->
        <script src="plantilla/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="plantilla/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
        
        <!-- DataTables CSS -->
        <link href="plantilla/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet"> 
    
        <!-- Bootstrap Core CSS -->
        <link href="plantilla/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="plantilla/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- DataTables CSS -->
        <link href="plantilla/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
        <script>
         
           
            $(document).ready(function() {
                
            var table= $('#table_analista').DataTable( {
                    "ajax" : {
                        "url": "Show",
                        "type": "GET",
                        "data" : function(d){
                            d.transaccion = "inicializar";
                            }
                    },
                    "global" : false,
                    "lengthMenu": [ 5, 5 ],
                    "dataType" : "json",
                     "columns" : [
                     {"title": "Id"},
                     {"title": "Nombre"},                     
                     {"title": "Apellido"},
                     {"title": "Usuario"},
                     {"title": "Password"},
                     {"title": ""}                 
                    ],
                  "columnDefs": [ 
                        {
                        "targets": 5,
                        "data": null,
                        "defaultContent": "<center><a href='#dialogAnalista2' id='EliminarAnalista'>"+                          
                                           "<img  src='img/eliminar.png' width='16' height='16'  border='0' />"+       
                                          "</a></center>"
                        }
                        ]
                    });
                    
             $('#table_analista tbody').on( 'click','#EliminarAnalista', function () {                  
                    var dataExample = table.row( $(this).parents('tr') ).data();
                    id=dataExample[0];
                    
                    $.ajax({
                    type: "GET",
                    url: "Delete",
                    global: false,
                    async : false,
                    data: {
                        id: id
                    }
                    });
                    //recarga los datos nuevamente en el dataTable por ajax
                     table.ajax.reload();
                     alert("Persona Eliminada");
                    
               } );           
              
             $("#save").click(function(){ 
                nombre=$('#txtnombre').val();
                apellido=$('#txtapellido').val();
                user=$('#txtuser').val();
                password=$('#txtpassword').val();
                 
                    $.ajax({
                    type: "GET",
                    url: "Save",
                    global: false,
                    async : false,
                    data: {
                        nombre: nombre,
                        apellido: apellido,
                        user: user,
                        password: password
                    }
                    });
                    
                    //recarga los datos nuevamente en el dataTable por ajax
                     table.ajax.reload();
                     alert("Persona Guardada");
                });
              
            } );
        </script>

    </head>
    <body>
        <h1>Tabla</h1>
        
        <div>
                First name: <input  name="txtnombre" id="txtnombre">
                <br>
                Last name: <input  name="txtapellido" id="txtapellido">
                <br>
                User: <input  name="txtuser" id="txtuser">
                <br>
                Password: <input  name="txtpassword" id="txtpassword">
                <br>
                <br>
                <button type="button" id="save"> save</button>
                <button type="button" id="delete">delete </button>
                <button type="button" id="update"> update </button>
             
        </div>    
        
        <br>
        
        <table id="table_analista" class="display" cellspacing="0" width="100%">
        <thead>
               <tr>
               <th>Id</th>
               <th>Nombre</th>
               <th>Apellido</th>
               <th>Usuario</th>
               <th>Password</th>             
               <th></th>
               </tr>
        </tbody>
    </table>
        
        
    </body>
</html>
