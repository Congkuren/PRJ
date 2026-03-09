<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, 
                         initial-scale=1.0">
    
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    
    <header>
        
        <h3 class="title">Sliding Login & Registration Form</h3>
    </header>
    
    <div class="container">
        
        <div class="slider"></div>
        <div class="btn">
            <button class="login">Login</button>
            <button class="signup">Signup</button>
        </div>
        
        <div class="form-section">
            <form action="Login" >           
            <div class="login-box">
                <input type="text" 
                       class="email ele" 
                       placeholder="youremail@email.com" name = "email" >
                <input type="password"
                       class="password ele" 
                       placeholder="password" name = "password">
                <button class="clkbtn">Login</button>
            </div>
                </form>
            
            <div class="signup-box">
                <input type="text" 
                       class="name ele" 
                       placeholder="Enter your name">
                <input type="email" 
                       class="email ele" 
                       placeholder="youremail@email.com">
                <input type="password" 
                       class="password ele" 
                       placeholder="password">
                <input type="password" 
                       class="password ele" 
                       placeholder="Confirm password">
                <button class="clkbtn">Signup</button>
            </div>
        </div>
    </div>
    <script src="index.js"></script>
</body>
</html>