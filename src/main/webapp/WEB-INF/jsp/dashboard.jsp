<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>

  <!-- bootstrap 4 -->

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <!-- font awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- default css -->
  <link rel="stylesheet" href="/css/style.css">
</head>

<body class="backgrond-color-dark">

  <!-- section 1 -->
  <section>
    <nav class="navbar navbar-expand-sm ">

      <!-- left side -->
      <div class="navbar-nav  align-items-center">
        <h4 class="nav-item color-white size-large m-0 mr-4">
          Dashboard</h4>

        <h5 class="nav-item color-white m-0 mr-1 mb-1">
          <span><i class="fa fa-home fa-lg" aria-hidden="true"></i></span>
        </h5>

        <h5 class="nav-item color-white small m-0">Dashboard</h5>

      </div>

      <!-- right side -->
      <div class="ml-auto">
        <ul class="navbar-nav float-right align-items-center">
          <li class="nav-item color-white mr-3">
            <i class="fa fa-question-circle-o fa-lg" aria-hidden="true"></i>
          </li>

          <li class="nav-item navbar-brand" data-toggle="dropdown">
            <span class="position-relative">
              <img src="/icons/img_avatar.png" alt="logo" class="w-40 rounded-circle">
              <ul class="dropdown-menu text-center top-40 p-1 pl-2 pr-2 m-0 drp-border">
                <li class="divider border-bottom text-secondary p-2 font-weight-bold">Status :
                  <span class="color-blue font-weight-bold">Online</span>
                </li>
                <li class="divider border-bottom text-secondary p-2 font-weight-bold">Account Setting</li>
                <li class="divider border-bottom text-secondary p-2 font-weight-bold">Logout</li>
              </ul>
            </span>
          </li>
          <li class="nav-item color-white small">
            <p class="m-0">User_Name</p>
          </li>
        </ul>
      </div>

    </nav>
  </section>

  <!-- section 2 -->
  <section>
    <div class="container-fluid d-inline-block">
      <span class="color-white mr-5 ml-5 float-left size-large">Level 1</span>
      <div class="progress rounded mt-3 w-75">
        <div class="progress-bar bg-danger w-20"></div>
      </div>
    </div>
  </section>

  <!-- section 3 -->
  <section class="mt-5">
    <div class="container">
      <div class="row">
        <div class="col color-grey text-center border w-25 p-5 m-5">
          <h4>My Resources</h4>
        </div>
        <div class="col color-grey text-center border w-25 m-5 pl-5 pt-5 pr-5 pb-4">
          <h4>Empower The Collective</h4>
        </div>
        <div class="col color-grey text-center border w-25 p-5 m-5">
          <h4>Contribute</h4>
        </div>
        <!-- <div class="col color-grey text-center border w-25 h-25 m-5 pl-0 pr-0">
          <h4>My Resources</h4>
        </div>
        <div class="col color-grey text-center border w-25 m-5 pl-0 pr-0">
          <h4>My Resources</h4>
        </div>
        <div class="col color-grey text-center border w-25 m-5 pl-0 pr-0">
          <h4>My Resources</h4>
        </div> -->
        <!-- <div class="col color-grey p-5 text-center border m-2">
          <h4>Empower The Collective</h4>
        </div>
        <div class="col color-grey p-5 text-center border m-2">
          <h4>Contribute</h4>
        </div> -->
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col color-grey text-center border w-25 p-5 m-5">
          <h4>My Data</h4>
        </div>
        <div class="col color-grey text-center border w-25 p-5 m-5">
          <a href="/dashboard/connect"><h4>Connect</h4></a>
        </div>
        <div class="col color-grey text-center border w-25 p-5 m-5">
          <h4>My Wallet</h4>
        </div>
        <!-- <div class="col color-grey p-5 text-center border m-2">
          <h4>My Data</h4>
        </div>
        <div class="col color-grey p-5 text-center border m-2">
          <h4>Connect</h4>
        </div>
        <div class="col color-grey p-5 text-center border m-2">
          <h4>My Wallet</h4> -->
        </div>
      </div>
    </div>
  </section>

</body>

</html>