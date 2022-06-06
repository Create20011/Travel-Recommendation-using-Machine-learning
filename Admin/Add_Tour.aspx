<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Tour.aspx.cs" Inherits="Buyer_Add_Property" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>ToursTravels Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->

    <script type="text/javascript">
        var chkvalue = "";


        function showimg() {
            
            var showimage = document.querySelector('#<%=showimge.ClientID %>');
            var file = document.querySelector('#<%=fileuplogo.ClientID%>').files[0];

            var reader = new window.FileReader();

            reader.onload = function () {
                showimage.src = reader.result;

            }
            if (file) {
                //reader.readasdataurl(file);
                reader.readAsDataURL(file);

            }
            else {
                showimage.src = "";
            }
        }

    </script>
</head>

<body>
  
  <div class="click-closed"></div>


  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a class="navbar-brand text-brand" href="index.html">Tours & Travel<span class="color-b"></span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
         <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link " href="Home.aspx">Home</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="Manage_Tours.aspx">Manage Tours</a>
          
          <li class="nav-item">
            <a class="nav-link " href="about.html">About</a>
          </li>
          
          <li class="nav-item">
         <%--   <a class="nav-link" href="contact.html">Contact</a>
          </li>
               <li class="nav-item">--%>
            <a class="nav-link" href="logout.aspx">Logout</a>
          </li>
        </ul>
      </div>
      
    </div>
  </nav>
  <!--/ Nav End /-->


  <!--/ Intro Single End /-->

  <!--/ Contact Star /-->
  <section class="contact">
    <div class="container">
      <div class="row">
       
        <div class="col-sm-12 section-t8">
          <div class="row">
            <div class="col-md-7">
                <form if="form1" runat="server">
                <div id="sendmessage">Add Tour Details!</div>
                <div id="errormessage"></div>
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                      <input type="text" name="name" class="form-control form-control-lg form-control-a"  placeholder="Tour Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required="required" value="<%=_name %>">
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                      <input name="location" type="text" class="form-control form-control-lg form-control-a" placeholder="Location"   data-msg="Please enter a valid area" required="required"value="<%=_area %>">
                      <div class="validation"></div>
                    </div>
                  </div>
                  
                
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                      <textarea name="discription" class="form-control"  cols="45" rows="8" data-rule="required" data-msg="Please write something for us" placeholder="Discription" required="required" ><%=_addr %></textarea>
                      <div class="validation"></div>
                    </div>
                  </div>
                <div class="col-md-12 mb-3">
                    <label for="fileuplogo">Image</label>
                    <div class="form-group">
                      <asp:FileUpload ID="fileuplogo" runat="server" onchange="showimg()" class="form-control form-control-lg form-control-a" />
                      <div class="validation"></div>
                    </div>
                  </div>
                <div class="col-md-12 mb-3">
                     <label  for="FileUpload1">Document</label>
                    <div class="form-group">
                      <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control form-control-lg form-control-a" />
                      <div class="validation"></div>
                    </div>
                  </div>

                    <div class="col-md-12">
                    <div class="form-group">
                     <label for="bathrooms">Price</label>
                      <input name="price" type="text" class="form-control form-control-lg form-control-a" placeholder="Price"  data-msg="Please enter a valid prie" required="required" value="<%=_price %>">
                      <div class="validation"></div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <%--<button type="submit" class="btn btn-a">Send Message</button>--%>
                      <asp:Button ID="Button1" runat="server" Text="Submit"  class="btn btn-a" OnClick="Button1_Click"/>
                  </div>
                </div>
              </form>
            </div>
            <div class="col-md-5 section-md-t3">
              <div class="icon-box section-b2">
                   <div class="icon-box-icon">
                         <span > Location Image</span>
                    </div>
                     <div class="form-group">              
                         <asp:Image ID="showimge" runat="server" Height="250" Width="500" />                            
		            </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Contact End /-->
  <!--/ footer Star /-->
  <section class="section-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-4">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">Tours & Travels</h3>
            </div>
            <div class="w-body-a">
              <p class="w-text-a color-text-a">
               Journey ofOur Tours compiles the glorious 20 years in Tourism Industry.
Journey started with a dream by our Director. He dreamt to reach to each & every corner of this World, by doing this he wanted to sell his experience to the customers. He had a different concept of doing customized/tailor made tours.
              </p>
            </div>
            <div class="w-footer-a">
              <ul class="list-unstyled">
                <li class="color-a">
                  <span class="color-text-a">Phone .</span> contact@example.com</li>
                <li class="color-a">
                  <span class="color-text-a">Email .</span> +54 356 945234</li>
              </ul>
            </div>
          </div>
        </div>
        
        <div class="col-sm-12 col-md-4 section-md-t3">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">Office Locations</h3>
            </div>
            <div class="w-body-a">
              <ul class="list-unstyled">
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Mumbai</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Delhi</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">New Mumbai</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Thane</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Chennai</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Banglore</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav class="nav-footer">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">Home</a>
              </li>
              <li class="list-inline-item">
                <a href="#">About</a>
              </li>
             
              <li class="list-inline-item">
                <a href="#">Contact</a>
              </li>
            </ul>
          </nav>
         
         
      </div>
    </div>
  </footer>
  <!--/ Footer End /-->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/popper/popper.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>

</body>
</html>

