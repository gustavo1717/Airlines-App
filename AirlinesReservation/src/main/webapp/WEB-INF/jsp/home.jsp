<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8">

    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .box {
            width: 200px;
            margin: 20px;
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .box img {
            max-width: 100%;
            height: auto;
        }

        .link {
            text-decoration: none;
            color: #333;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-group b {
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 10px;
        }

        .form-group input {
            width: 200px;
        }

        .quote-container {
            margin-bottom: 20px;
            border: 2px solid #3498db;
            /* Change border color to blue (#3498db) */
            border-radius: 10px;
            /* Rounded corners for the container */
            padding: 20px;
            /* Padding inside the container */
            display: flex;
            /* Arrange elements in a row */
            justify-content: space-between;
            /* Space elements evenly */
            align-items: center;
            /* Center items vertically */
        }

        .quote-box {
            flex: 1;
            /* Take up available space within the container */
        }

        .flight-images-container {
            display: flex;
            align-items: center;
            margin-left: 50px;
        }

        .flight-image {
            width: 400px;
            /* Adjust the width of the car image */
            border-radius: 10px;
            /* Rounded corners for the image */
            margin: 0 10px;
        }

        footer {
            background-color: #f8f9fa;
            /* Background color for the footer */
            padding: 10px;
            /* Padding for the footer */
            text-align: center;
            font-size: 12px;
            color: #555;
        }

        th {
            white-space: nowrap;
        }
    </style>


</head>

<body>
    <input type="hidden" id="principalName" value="${principalName}">
    <script>
        $(document).ready(function() {
            if ("${principalName.equals('null')}" ){
                $('#ins').hide();
                $('#login').hide();
            }
            if (!"${principalName.equals('null')}" ){
                $('#logout').hide();
                $('#profile').hide();
                $('#book').hide();

            }
            if(!"${role.equals('admin')}" ){
				$('#box1').hide();
                $('#box2').hide();
                $('#box3').hide();
                $('#box4').hide();
                $('#box5').hide();
			}
            if("${role.equals('admin')}" ){
				$('#tableFlights').hide();
                $('#login').hide();
                $('#profile').hide();

                
			}
    
        })
    </script>
    <script>
        // JavaScript function to load the next set of flights
        let currentPage = 0; // Keep track of the current page
        const flightsPerPage = 4; // Number of flights to display per page

        function loadNextFlights() {
        currentPage++;
        showFlights();
    }

        function loadPreviousFlights() {
        currentPage--;
        showFlights();
    }
    
    function showFlights() {
        const startIndex = (currentPage - 1) * flightsPerPage;
        const endIndex = startIndex + flightsPerPage;
        const flights = document.querySelectorAll('.flight-row');

        for (let i = 0; i < flights.length; i++) {
            if (i >= startIndex && i < endIndex) {
                flights[i].style.display = 'table-row';
            } else {
                flights[i].style.display = 'none';
            }
        }

        const loadMoreButton = document.getElementById('loadMoreButton');
        const loadPreviousButton = document.getElementById('loadPreviousButton');

        if (endIndex >= flights.length) {
            loadMoreButton.style.display = 'none';
        } else {
            loadMoreButton.style.display = 'block';
        }

        if (startIndex === 0) {
            loadPreviousButton.style.display = 'none';
        } else {
            loadPreviousButton.style.display = 'block';
        }
    }
        // Initially load the first set of flights
        window.onload = loadNextFlights;
    </script>

    <jsp:include page="header.jsp" />

    <h1>Airlines Site</h1>

    <div class="quote-container" id="ins">
        <div class="flight-images-container">
            <img src="data:image/jpeg;base64,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"
                alt="Car Image" class="flight-image">
            <div class="quote-box">
                <h2>Log In</h2>
                <p>Before you can book a flight you need to log in.</p>
                <a class="btn btn-primary" href="/login" id="login" >Log In</a>
            </div>
            <img src="data:image/jpeg;base64,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" alt="Second Image" class="flight-image">
        </div>
    </div>

    <table class="table table-bordered" id="tableFlights">
        <tr>
            <th colspan="7" >
                <h2>All Flights</h2>
            </th>
        </tr>
        <tr>
            <th>Flight Number</th>
            <th>Departure City</th>
            <th>Arrival City</th>
            <th>Departure Date</th>
            <th>Ticket Price</th>
            <th>Operating Airline</th>
            <th>Available Seats</th>
        </tr>

        <c:forEach items="${flights}" var="flight" varStatus="status">
            <tr class="flight-row"  style="display: none;">
                <td>${flight.flightId}</td>
                <td>${flight.departureCity.airportCity}</td>
                <td>${flight.arrivalCity.airportCity}</td>
                <td>${flight.departureDate}</td>
                <td>${flight.ticketPrice}</td>
                <td><c:out value="${flight.operatingAirline.airlineName}" /></td>
                <td>${flight.capacity - flight.booked}</td>
            </tr>
        </c:forEach>
        <tr>
            <th colspan="7" style="text-align: center;">
                <button id="loadPreviousButton" class="btn btn-primary" onclick="loadPreviousFlights()">Load Previous</button>
                <button id="loadMoreButton" class="btn btn-primary" onclick="loadNextFlights()">Load More</button>
            </th>
        </tr>
    </table>




<div class="container">
    <div class="box" id="box1">
        <a href="userForm" class="link">
            <img src="data:image/jpeg;base64,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" alt="User Form">
            <p>User Form</p>
        </a>
    </div>
    <div class="box" id="box2">
        <a href="roleForm" class="link">
            <img src="https://t4.ftcdn.net/jpg/02/71/78/29/360_F_271782927_keMVFo9PnBwrMEmbiUGKRcDT2rzf85dj.jpg" alt="Role Form">
            <p>Role Form</p>
        </a>
    </div>
    <div class="box" id="box3">
        <a href="flightForm" class="link">
            <img src="https://media.cntraveler.com/photos/607f3c487774091e06dd5d21/16:9/w_2560%2Cc_limit/Breeze%2520Airways_166655077_303814634409055_8038496796049085212_n.jpeg" alt="Flight Form">
            <p>Flight Form</p>
        </a>
    </div>
    <div class="box" id="box4">
        <a href="airportForm" class="link">
            <img src="data:image/jpeg;base64,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" alt="Airport Form">
            <p>Airport Form</p>
        </a>
    </div>
    <div class="box" id="box5">
        <a href="airlineForm" class="link">
            <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHsAnAMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAFBgMEBwIBAAj/xABDEAABAwMCAwUFBQYEBAcAAAABAgMEAAUREiEGMUETIlFhcQcUgZGhFSMyscEzQlJicvBDU5LRFheC4SQlRGOi4vH/xAAZAQADAQEBAAAAAAAAAAAAAAABAgMEAAX/xAAnEQACAgICAQMDBQAAAAAAAAAAAQIRAyESMUEEE1EiYeEycaHB0f/aAAwDAQACEQMRAD8AJ/8Aiwe/MgNjHNLRV+Yr3L+kFy7JGDuER0/Q0BTKeIHdFeKlOA7rRgnqcGvO9+XhFW/sHCsHUV3aac8tCUpqE9htqk3BY65d2NCA485nszq8wSa6MWW6jIbUfRBo+9kYtMIkQicrS454do+Tj6VGHIIUhKYrSlA93OSSf1quxaZz7iW0tqQo9XFJQMepNeybFcIim1P6G9W7bgc2PoRkV3LKwpMsPOssqUl23sIWd9K2sH5GovtEJUlSGmkEfwMpFWpCHVxQ3dnpjcTKQmVOWyW0rI3LZUpK9P8AqHlmqdwsiLayiTIkK91cJ7N8NEJWB18vj60WpoaWNraejtN3d/AFqQPAAD8q5VdXFKJLq+X8VU1fZzOzjr5UADsjBIPLnXqJFvJShMZ5Sidio4/Wp1LyxOL+SU3JayRqWr/qNeolOLUEIJGds0QYgNvKV2MVKwOXZpWvP0FW0Wqal5H/AJQ6hvI1OdkkY8xvmkteCy9LN9i9768VY1bHpg12h19e4StXhpTTVpdbZWtu0u6UjKi2yNvrSvJu6nVOFhxtKAru9oo59MCkWReU0VXom+pB5HC14fjNyG0oCXBqDa3MLA8xjFV3LHdY4Pbx3VDfdCc7/Kl+JxFxBHKRHeZcQO6DqcZyT03TpPzo61x9doZAnQJQBONXZhxOfVO/0rYoYvJD25J0j2JFfW6AH+wdyEkqJTgnxOP1q/LmqscgxLu66peMocUydKvMKB3+VE5LUHiq15BCHynIWD/eR9aWnJV2szf2feEx5UBpeWy+1rOMbYJ2A/8AyrRxxh0C/DLzd7hupJblt+GlRA/OvnW2nl60sMqB6hKTmvI9zgIhGcLUy42BpWpppshBB6jmmqT3EkQOKxDiAZ2Bab5Uz4vsOy83CjpCSI7HLqgGpNKW8BKUj+lIGKcW7LbwAExs7fvLUf1qdy2QG8Yis5H8lLxR3ISwsFOc4+NfZJH7yvQE02vsMNp7jLYJ5EDFDpDrZdKVKSEp3NHoFihdLTNWXH35kaPHVgjt3lJCduoCT510LaGGgJsFtUR9WWWbS49IKwNivB7g35HY770awu4jTpZcBP7J1acKPgQSCfhQqIwLfKVFnIDMlagp6PY0P/dg8goglAV44+tT4LbLYvjf9ErfCnEFveD8JTKW1Du6oyXHAP4T3djgDlTG3O4iajhkxlvkDBUpstk/EJUPpQ2c1xPCiNakKltKAw0Uqe0HwUQQfjvVSFcuMg6tKLChDWMlaO2BUf6dt/jVYRSWjPOUm9htF64iZUoK4fkrzvq7bUBvnGNGfLlVmLfrw8pfb2CS3hOU4B38slA3+lAGb/xIX1NybZcEIQDhaYTqs49HPE868bv/ABO46+1J4eujkUt90tsqysHbBCiN8c96ohBjRdrncYyyuw3WCUKCsOutt5xvgFJPP+zQSXcJro2jMYSMrMy6hOMZ6pSduu9A58vjF5WmDwq4gKOCp9bh1JJ3BTjA+dVnIXF+jspsazQ0O98olv5BwTgkajk0Gcg1crxf7C6JjnDkJI7Psw81PWpASQP/AG8DOBvjPKlm58UP3N1YlQYSG1pw4Gl7/ElO/Lw60fgN8ZTkdn9r2hSsEqZYe1koBxyJOefwpKl2aTaQ/DkSG4wXgqQWVpVjc8+vP0qOSVdvRoxR5arf7hq3XZxceDAiOKSgJQzgKGVjlviuZNvu65j2qAXsnZa8EkeuaD2hcWC4l4NqefQUdmsOkcskZH6UZflvzbkUKW4Uqe06UKIAGcV5GWDjK1uz2sLtdVRTgzp9pnBxtDSWgQXGm1pG+c55860ODPt3EVv0KUlTpGElJ5eJHn5eVZkyu5ZDamZCV+BbPz5Vo8Th1ly1sKt0giYE5LwOO0PXPh5V6Ho5zf0mH1+OEaku2AbtFmWFxL0fIaG2tGSFj+YE4NVV3GE8rW57yws/iQgZTnxHh6VBebtdoCjClvTnSDkgqGlQ8+oP9iky4tXBx5C0x3QFIBGwV1NaJd6MsEmts/RzathkkeldPDAGRk/nVdhGQFHGByrtYBGTz6UbIsqyiDnoE0DuDiUsHf8AGrHp1P5fWicxtvlpG55+FAru/wC7NfcwWZa8ZDKwo7k42AOc0spUPCDk6QBuSYC2luzGHn0Ngq7NhwJUfjv6/CrUFM51hlqTIvFnaOC2me+2kjyCkrCyPIj5VXlT2yxrTBmWC4kY0qaWlt0fyqIyDtyI6VTZeU3LD0mwRLg+VAqlyZq1rx/TgDFJFq9GpqcI1N6+O/5DrvFdwtsVlEwr7JxOWVrUWy4nPirJ+e+9RN8dzUtqfZgPLbHdU8JqFJTjx1J255zijLvFdsnRAzcIMc+Jfa1NJPx/3qvE4i4UiSdbL/DTKdwoNuNIUfLIV+laFfyee+PwUP8Amboby4WE741CRrx/paKcVNd/aWxY5Pu9xLpdATlDZRlJO4yCEnHnRCRxBwJIUFyFcOOKJ3JdZJqRifwg4SYkGxuHxaShefkk02xdADiPj+2x1tBYkSJK2hpZYmgd0+IBxn60BHGl2mOameFpC9ewX704oEDlsEYrSzcrZFjuLt0WDHVthwsaUg9M7ChE3jSIyg+9Xm3N6PxhDpCgCcA4SvP99K52doUnb5xKw+1Kj8Lq95WA0HgXlqbR4fsxgcs454FWJ0/ia9NIjz7WFMgpUrXHd7uDnZSht8t6mXxnZFLV29+aWkjZLciSBnpnv79D8MVNA9oFsEdyEbj9pLdKlDUhZ0gjACRgnAxncnmaVpvRROK2Ltqt8ppTup5DPavdk41oViOMYTy5jzIpkY4Wehw5E+Dc0SHkFb/3P4CvnuVKxywNxilq4cQpRcn2rTGjQ4qihwJeK2gV4OrGRnmMY5UesslU2E661pEeSFB5pLikpKxkFQKcHc8xy50lJ6Y1tbQMtquKSygLkMNNFZU+qSprbJA0pKUnHLlsKKXKZOtUZtqwcRMNJdOVvvqQFBWdkpGhQwc/lS4qzTLbFcVJvCEMoJXobV4A8gSMnGKqWJpm6SSiXMlsRdOfeHWiRkb4Ayc+OaEYqLtBcnJbDduut5gyveX7xBlpVntW35KiFeeyRgjywKYmr7cpSA9HjRnkK/eaS6pIPUZCDn50i3lMucfspd0VLisoxEdS0ACobjcjI54O9EuH4DLVtR2ku4R3FHUtrssaT6EjHyqtknTNebCwBgDlXzzixthNTtnAPdBB5E1UeUFHPKpFAdLMla8ICMUr3KSFTlZfDKNQBdyQEgdfGmmYoNMOOk/hHI0pyX3mgv3HslPEclNBeoehB3qc3Q+OPKSRRtqRDUtUO736/SnVFS48Q62UpBxk60q35HOOZpkbsFw4ghmQ9D+yVdmUMMFsatWT3l7DIIxtgczS6/KuiIxReoNztQxlM+2pLQ9HEju/kamtM+daCpxF7kzdYGkS1lWBz+HyoxkpNcmXz43ii1GOvm7/AAdI4S4raUUe7NOAK/ddSAoeuQanf4Duc8hYQmOcbtSkocGfJYJyPUV0vjGQhGqS289yyGX0DVjPLVjxqr/zMTEBbRabyCTyT2SyT8yarGMfBibkROcF8Xs/dxodu0fxx3G2vySD9aor4O9oJR2IZiORuqJEtLuT45IyPhR2N7QZ0kfdcP8AEGMftXmW20jf+JWE1dd40fjR0vz2jFaVuFSJbWMeqAqnSpiuTYm2n2YcbME9nOgW4FZc1JfUpY/l2HKr73sfnuKL07iGMHM/4NvKiT488k0yMcb2y7R3UCczowUKSHdOR5FQT9PKlmbxhZYKi2mFcnnm8qb1gaFKHLCis7eYzRo62SL4BTF7rnEVw7pxlmxrV8iBX0LgqziYw4u+XFEpxQaaVPgKaStZ5AA6c+m9Ahx4284otcLNlQx3vfwkn/4109x3IbX9oDhpr3hKdKXjOLi0DHTu5HSkcU+x1NpdDBI4Uu1gl+9rSJzCSfvGo+nY9CkZwPOl77QhQ+JVEOyUqfb0mIP2C9XPfoo+nM1ZT7QL7Ia0pt7bKtOoKckOcwMjwHPHpQ2VMelxZC3EjtlvBxZRtjO50nodiR6UvGMehnKc9yGiZaZjkByLDeaaUpQ0ulGSE+BT6dc0KXwVr1KEmR2hT+89tnoAABgc/nXxtXFjStcXiFt1J3Sl5vxzjofKiFme4jadcTfVRFMBH3a2Mairz5efSjYqAkHhO8tTAhx3s4mclSXAspI6gKO+9fXO18SvzXHW31lClEpDzqSoDJwOZ5Cm9ueh0vaHMBpBKxz36VSeuslKyBbXsDkSCM/DFYM3ruEuKVm7F6KWRcmaZpJbA7Q4PPeqklpQxpUcnzog2ElGcVSlEKXyOOVbaMIv3grXoihRGrK1HyGwHxJ+lAlw1uOfcq0KO2s5Gnz2o6/okSXj2iGsq7NK3DgJCeeT03JFSt2xTsZ1cV2NK6KQw7qIGPWpyVvRWPQlptT1mlSLjceNpja8lCWILvbqc8NQUSOW2COmc9KLwZTXFEZVrgQXVrJSpcyVHQlSU5GcdmAAcHaoI1r+zFBy3Nxm32zlJkILmk+XeGD51ei3/iGO6FyZMdxrOcNDGR4b5oqTl+rRWTxQX0Jv9/8AAHevZ3eYbivcnH5Uf90toGrHgU/7VBbrHfIbTkeVbr2tC8YfiFTbzfoeRHkadf8Ajc/46FNDmFHOCfDIB2xQ5fHsRtxHaX5pGncpMlHe9R2O3wqvBeGZfcflC8v2YTbqkuNXKa4sbhu5xVoUk/1EnPwFBrhwDx7EkgtsuOsleQmO8FIH/SSPyrRx7SrKE73SAPAB4n9K8d9pVmAy3d4HnqWf0p+IrmzLGPZhxeqMmOqLIbZ16+z1DTqxjOM+FEIvsl4iewl9rSE7JLrwA/OtFje0KBJCSxIS+Sf8Fhxz8qItcSPODWGHkpG+p1pSAfD8WMUGvuBSrwZ4x7GJpR9/PhtK5kpUpWPpUf8AyshR9CpfFEBLeoZISScdcZVjNNq70mMpwzOI220FWUh19CSPLZVLszj60ocVHXf5qVsqwFNFagrc9Rsob+Ph4UOIymyP/gPhiKQWOL455gh1KV5HLklQq437MUS2u2td+iLKFA9yMojx/jODihzftBtLaXEJukxYWMfsVlQ8wamtXtAs9qccatzc16VIXqcLqFqcdPQknJ5UFBeRnNVorXKbdLA4W7mX0ZJ0KktpbSR4DAOfnQZ7ix9bS1uPEtZ2KWufptvzFPEzjcXWCuHOtXboWnBalNo0Z6Z5nPypCmWmXLnd8tNlSQgBGNJwBjbJ8KhLHG9ybNUM2lxgkeRLsmR7w5qIBRpVnbrR1U97SjRIe06RjSs4pNlsyLNgxQ4lxzKVKSk6RyxjHM0NMy5N/sHJGlXeIQkkA9ahP0fN2maY+ujBfUj9SiSQ0cY2FDJUzsWlOFOUoBUolWNhuaIOHuBOPOg98V9wzH/z3Qg4/hHeP0Tj41rZ5tAN1K0sIaePeO7gI/ETur6mgv2KiG61Oa4pt1tkn8IceKFg5xg+oHWmGS32j+ACSTsao36xcJz3WF3i4KQtCcPxE51uY3TjAyBz+dT4wbuRpxZssE44t34qzycxxHKSXH4zMkhOoSoGFJeHj3eZ+A/SlefLu8Nfu8uDIZcABwrqPKjEB+JEfK+FeDnSw3sh9ZdWFH+kbZ28TThb+Hn7uHp19D4elNpCGCdo+OekchnniuUU3UdjZoyjHlNKP2/Bkrlwl6f2T5xyBGPrVJy5LWnTKirUnGARgkfOtOncEXhtShHjsvt9FhaUnHmCRQpXAvEKSlQtbLmNyFvIx8e8Kbi0ZrixCalWBLI7a0S5Lp2KT2TKD8QCqvhe4zTiFQ+HbREbB3deZMhSR497r8K1eDwUxOR2N64RTDWf/URZyVD1xryPrQ66+xmO9n7OuMhkZ5O4WP0NVViXERZftAcmM+6OqlRBkJD8CStgAZAzoAwfHp4daXonE0+El8olS3JC19x5bx/DncEHJOfA7U9O+xi9tO/dOxX09Fe8afoRU7XspviEYMeASOWqQDn6Uzl9gJL5M8kXOVdgpb0KMqTqSe3Sw2k7ZzkJSM5yOfhU0ddzZbw0AhJ54QAPyrR2PZpxEhJSlNub3/zv9k1M37L7+4vD0mAhJO57RSvpppG5MZcUZgqXd1K09usZ22VXLTM9T/bKcV2gP4ye9861xv2XtRPvbpeCpH8MaIpRB9cn8qhXw7wXEWEzbjdHiQdkQnQPoig7oeK5fpQkQ+30pU9clAjoU7g+p51cXeUxkalSwtxsBSUlvIUBvgkDbf8AOnaHw5wPMdbbjSZqS4oIR7ww4kKUeQGtIGT0FeX7gSZCTqsTHvDKTqUlLLLagccwRur5VJ8ltKyqUb4ydAa43hmbCZ+xoQEleh1bqEAAA5zuogZ8qWFRLihSgzOdQkqUrs0KUAgkkkd1WOvSrspMsumOteqRqCAy6tQVqzsMEbV8iPDCB2ks6sbhKArSeoznxpXkyPpUVWLBHuVmz61HJJO/KhEuRquigQSlhnGc/vKO4+QHzq8mRrOwOTyyf+9LheL6npKc/fuFQ/pGyfoBTt6MaRcDoVIBIBCcqxk/70KnQIz9yEhUFClrICluLUU7DHIKHQVyJKmtS0jVgYxQyZeVJUCrzBpG0ysJShuLoMvzLy0tAhvQG0JI0oCHQE9Bga8D02orF4ouMRKvtBaXSP8ALSAkD5mkBV9JcAS5gA7jNQSr2FgpDvPxOP1qsZtEpQ5Glr4zYeaA99ZirSrq4lJIz/Mk1y5xShaT2d5jJ5HaS2SMDH+X471lEu76shTqSPA7/qaGuNw5AyY8dw9SlAz8xVPd+RPafg3McXxtIzIhKAGMmV/9aiPGkDUQZ0Ed3pIBGd/L0rJLXwcbkjU1aO6eS1r7MfNRH0rqXwXw5AcJvPEECJtvGiKVJdH+nOKZSTFcGaseNoKVYM+3Y6/+IqA8dW9zupnw1KyNmXdRxSTw5A4EaQ8bdb5lyfYTq7SS0VZOdu6kEj/TVC6+0KVABPD8CyNx083GWXFLTuOYWE46funmKYSqNSF5cuUdxqKXgHElIcZQUrTnqD4jffHhVX3G+Jjr1TZOk79o86QoDyBUM/2KQLb7QlzbFKVd7yhmSBlppPaoU55YY06fDJPWs/u12XdHe1SZeTzQ5KcdA9Co5+tcwpGtvcXWsBUeZxE8h5k6TpeUkBQWo7jmeZHwHhUbPGtrakBz/iPWQoK+9WtYPqM4/vx3rGCg8vd0emKlaWsbCGyr+pvJpbQ6gzWZXFHCblzauFwuplyGl629ZedbaV0UlGSBijcP2o290/czFud7ZLUJ1Xx5YrGEyndKk+5MNak6SptlOR6Uas99kxOwYLbioqCEqZaSlJx/KTsDmi8gfavs0Piq/R7s3HdENtyWy6hxDziQ2oAHOnrnPnypDe1l1RUkJJOcb7VakXFbsnXDiPsIVnUJC0rJPlp2ArtwCQrtXOySojfBO/0rNOTvZoxpJaNUubKYttccbUsPKwhGVHZSjgdfOhExlLSENt5CEABI8qPXpI129ONu2zjzCF4obNQkLwANq5k4ggw9UfUrOpXLehjllZJUTuop65p1Sy37s13ByFD1MtkKykc6Wg2JL/DrOoZxgg5AG+fnVF2wgZARlI5ECnt1pGfwiqzjTekfdp5+HnXBsTVWVCE4UnGOYUneoVWpnRnITnpinB9KdGdIz6UIfSFIUCkEY8K46xUftcYqUo9mSepSKoyY7Mc6UYx/KaPzW0BZAG1U2o7SlnUgHamTYaATFxnwQ4m3ypEZLmywy4U6vlVZmAp7OVK355POmox2Qk4bTtV5MdoJHc+tN7jBwQtR+H2VpBU5zHjRKJZYzJ76s+p/7UYZaQGwQnf1rstIz+H60HJs5RSBL8GMVfdgnB+dQLhNhWrsz60Y7NGsbfvVy6hIJAGN6WyiQJDSOoNcKHdwKIuDuJ8xVVDaCVZTQsaipqVjGeXhXmpY/fxVlTaAsYTUklpsPKAQMA4FdYKP/9k=" alt="Airline Form">
            <p>Airline Form</p>
        </a>
    </div>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>
