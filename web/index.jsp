

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
        <div class="container">
            <div class="row">
                <div class='col-lg-4'>
                   
                        <div class="panel-heading">
                            Creacion Analistas
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Button trigger modal -->
                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
                                Launch Demo Modal
                            </button>
                            <!-- Modal -->
                             <div style="display: none;" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                 <div class="modal-dialog modal-lg">
                   <div class="modal-content">
                        <div class="modal-header">                                           
                            <h4 class="modal-title" id="myModalLabel">Mantenimiento Ticket</h4>
                        </div>
                   <div class="modal-body">
                                          
                    <div class="modal-body">
                                          
                        <div class="panel panel-default">
                                     
                          <!-- /.panel-body -->
                          <div class="panel-body">
                            
                            <div class="row">                            
                                <div class="col-xs-6">
                                    <div class="form-group">
                                            <label>Nombre</label>
                                            <input class="form-control" name="txtnombre" id="txtnombre" placeholder="Nombre">
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                            <label>Apellido</label>
                                            <input class="form-control" name="txtapellido" id="txtapellido" placeholder="Apellido">
                                    </div>
                                </div>
                            </div><!-- /.Nombre Apellido -->  
                            
                            <div class="row">                            
                                <div class="col-xs-6">
                                    <div class="form-group">
                                            <label>Usuario</label>
                                            <input class="form-control" name="txtuser" id="txtuser" placeholder="Usuario">
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                            <label>Password</label>
                                            <input class="form-control" name="txtpassword" id="txtpassword" placeholder="Password">
                                    </div>
                                </div>
                            </div><!-- /.Usuario Contraseña -->  
                             
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button id="save" type="button" class="btn btn-primary">Guardar</button>                             
                                <button type="button" class="btn btn-primary " id="myBtnAnalistaShow" >Crear</button>
                            </div>
                            <div class="modal-footer">
                                <table id="table_analista" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">  
                                          
                                             <thead>
                                                <tr>
                                                <th>Id</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Usuario</th>
                                                <th>Password</th>             
                                                <th></th>
                                                </tr>
                                             
                                </table>
                            </div>
                     </div>
                                            
                    </div>   
                        
               
                                            
                    </div>
                         
                               
                        
                                <!-- /.modal-dialog -->
                            </div>
                                <!-- /.modal-dialog -->
                            
                                <!-- /.modal-dialog -->
                            
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                        </div>
                        <!-- .panel-body -->
                    
                </div>
              
            </div>
        
        
    </body>
</html>
