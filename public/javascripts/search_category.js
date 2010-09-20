var cities = new Array();
        districts = new Array();
        <% for district in @districts do%>
        districts.push(new Array(<%= district.city.id%>, '<%= district.name%>', <%= district.id%>));
        <%end%>