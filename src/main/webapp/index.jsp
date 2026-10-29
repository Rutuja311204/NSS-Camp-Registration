<!DOCTYPE html>
<html>
<head>
    <title>NSS Camp Registration</title>
    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }

        .box {
            width: 350px;
            margin: 40px auto;
            background: white;
            padding: 20px;
            border: 1px solid #ccc;
        }
        h2 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 12px;
        }

        input, select {
            width: 100%;
            padding: 7px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        button {
            margin-top: 18px;
            padding: 9px;
            width: 100%;
            background: purple;
            color: white;
            border: none;
        }
    </style>

    <script>
        function validateForm() {
            var mobile = document.getElementById("mobile").value;

            if (!/^[0-9]{10}$/.test(mobile)) {
                alert("Mobile number must be exactly 10 digits");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <div class="box">
        <h2>NSS Camp Registration</h2>
        <form action="result.jsp" method="post"
          onsubmit="return validateForm()">

          <label>Volunteer Name</label>
          <input type="text" name="volunteer" required >

        <label>Branch</label>
        <select name="branch" required>
            <option value="MCA">MCA</option>
            <option value="MBA">MBA</option>
            <option value="BCA">BCA</option>
            <option value="BBA">BBA</option>
        </select>
        
        <label>T-shirt Size</label>
        <input type="radio" name="tshirt" value="S" required> S
        <input type="radio" name="tshirt" value="M"> M
        <input type="radio" name="tshirt" value="L"> L
        <input type="radio" name="tshirt" value="XL"> XL

        <label>Mobile Number</label>
        <input type="text" id="mobile" name="mobile"
         maxlength="10" pattern="[0-9]{10}"
         inputmode="numeric" required>

        <button type="submit">Save Registration</button>
    </form>
</div>
</body>
</html>



