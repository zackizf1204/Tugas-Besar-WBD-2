<head>
    <link rel="stylesheet" type="text/css" href="../style/style_header.css">
    <link href="https://fonts.googleapis.com/css?family=Slabo+27px" rel="stylesheet">
</head>
<body>
<%
    String current_step = request.getParameter("current_step");
    final String cs = "id=\"step-current\"";
%>
<div id="step-holder">
    <div class="step-container">
        <div class="step" <% if (current_step.equals("1")) out.print(cs); %>>
            <div class="step-number">1</div>
            <div class="step-text">Select <br> Destination</div>
        </div>
    </div>
    <div class="step-container center">
        <div class="step" <% if (current_step.equals("2")) out.print(cs); %>>
            <div class="step-number">2</div>
            <div class="step-text">Select a <br> Driver</div>
        </div>
    </div>
    <div class="step-container last">
        <div class="step" <% if (current_step.equals("3")) out.print(cs); %>>
            <div class="step-number">3</div>
            <div class="step-text">Complete <br> Your Order</div>
        </div>
    </div>
</div>
</body>