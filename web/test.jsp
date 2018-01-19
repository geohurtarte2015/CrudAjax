<%@page import="pojo.Analista"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" media="screen" href="plantilla/bower_components/bootstrap/dist/css/bootstrap.min.css" />
        <link href="bootdate/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
        
        
        <script type="text/javascript" src="plantilla/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="plantilla/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="plantilla/js/moment.js"></script>
	<script src="bootdate/src/js/bootstrap-datetimepicker.js"></script>  
        
         
        <!-- DataTables JavaScript -->
        <script src="plantilla/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="plantilla/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
        
        <!-- DataTables CSS -->
        <link href="plantilla/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
       

    </head>
<body>
        <div class="container">
            <div class="row">
                <div class='col-lg-4'>
                   
                        <div class="panel-heading">
                            Modals
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
                                            <input class="form-control" name="AnalistaNombreTxt" id="AnalistaNombreTxt" placeholder="Nombre">
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                            <label>Apellido</label>
                                            <input class="form-control" name="AnalistaApellidoTxt" id="AnalistaApellidoTxt" placeholder="Apellido">
                                    </div>
                                </div>
                            </div><!-- /.Nombre Apellido -->  
                            
                            <div class="row">                            
                                <div class="col-xs-6">
                                    <div class="form-group">
                                            <label>Usuario</label>
                                            <input class="form-control" name="AnalistaUsuarioTxt" id="AnalistaUsuarioTxt" placeholder="Usuario">
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                            <label>Password</label>
                                            <input class="form-control" name="AnalistaPasswordTxt" id="AnalistaPasswordTxt" placeholder="Password">
                                    </div>
                                </div>
                            </div><!-- /.Usuario Contraseña -->  
                             
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button id="save" type="button" class="btn btn-primary">Guardar</button>                             
                                <button type="button" class="btn btn-primary " id="myBtnAnalistaShow" >Crear</button>
                            </div>
                            <div class="modal-footer">
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
        
  <script type="text/javascript">
            
                    $(document).ready(function() {
                    $('#example2').DataTable( {
                     "ajax": "ServletVerTicket"
                     
                    });
                    });
             
                    $(function () {
                    $('#fechainicio').datetimepicker({
                        format: "DD-MM-YYYY hh:mm:ss a"                      
                        });
                    });
                    
                    $(function () {
                    $('#fechafinal').datetimepicker({
                        format: "DD-MM-YYYY hh:mm:ss a"                      
                        });
                    });
                    
                    $(document).ready(function(){
                        $("#myBtnSeguimientoShow").click(function(){
                            
                            $("#myModalSeguimiento").modal();
                          
                        });
                    });
                    
                    $(document).ready(function(){
                        $("#myBtnSeguimientoHide").click(function(){
                            $("#myModalSeguimiento").modal("hide");
                        });
                    });
                    
                    $(document).ready(function(){
                        $("#myBtnSeguimientoHide2").click(function(){
                            $("#myModalSeguimiento").modal("hide");
                        });
                    });
                   
   </script>
</body>
</html>
