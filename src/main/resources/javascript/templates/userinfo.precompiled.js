(function () {
    var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
    templates['userinfo'] = template({
        "1": function (container, depth0, helpers, partials, data) {
            var helper, lookupProperty = container.lookupProperty || function (parent, propertyName) {
                if (Object.prototype.hasOwnProperty.call(parent, propertyName)) {
                    return parent[propertyName];
                }
                return undefined
            };


            return "            <img src='"
                + container.escapeExpression(((helper = (helper = helpers.profilePictureUrl || (depth0 != null ? depth0.profilePictureUrl : depth0)) != null ? helper : helpers.helperMissing), (typeof helper === "function" ? helper.call(depth0 != null ? depth0 : {}, {
                    "name": "profilePictureUrl",
                    "hash": {},
                    "data": data
                }) : helper)))
                + "' class='profile user-avatar img-fluid'/>\n";
        }, "3": function (container, depth0, helpers, partials, data) {
            return "            <img src='/modules/jexperience/images/default-profile.jpg' class='user-avatar img-fluid'/>\n";
        }, "compiler": [7, ">= 4.0.0"], "main": function (container, depth0, helpers, partials, data) {
            var stack1, helper;

            return "<div class=\"col\">\n    <div class=\"card profile-card-1\">\n\n        <img src=\"https://images.pexels.com/photos/946351/pexels-photo-946351.jpeg?w=500&h=650&auto=compress&cs=tinysrgb\" alt=\"profile-sample1\" class=\"background\"/>\n"
                + ((stack1 = helpers["if"].call(depth0 != null ? depth0 : {}, (depth0 != null ? depth0.profilePictureUrl : depth0), {
                    "name": "if",
                    "hash": {},
                    "fn": container.program(1, data, 0),
                    "inverse": container.program(3, data, 0),
                    "data": data
                })) != null ? stack1 : "")
                + "        <div class=\"card-content\">\n            <h2>"
                + container.escapeExpression(((helper = (helper = helpers.firstName || (depth0 != null ? depth0.firstName : depth0)) != null ? helper : helpers.helperMissing), (typeof helper === "function" ? helper.call(depth0 != null ? depth0 : {}, {
                    "name": "firstName",
                    "hash": {},
                    "data": data
                }) : helper)))
                + " "
                + container.escapeExpression(((helper = (helper = helpers.lastName || (depth0 != null ? depth0.lastName : depth0)) != null ? helper : helpers.helperMissing), (typeof helper === "function" ? helper.call(depth0 != null ? depth0 : {}, {
                    "name": "lastName",
                    "hash": {},
                    "data": data
                }) : helper)))
                + "<small>"
                + container.escapeExpression(((helper = (helper = helpers.jobTitle || (depth0 != null ? depth0.jobTitle : depth0)) != null ? helper : helpers.helperMissing), (typeof helper === "function" ? helper.call(depth0 != null ? depth0 : {}, {
                    "name": "jobTitle",
                    "hash": {},
                    "data": data
                }) : helper)))
                + "</small></h2>\n            <div class=\"icon-block\">"
                + container.escapeExpression(((helper = (helper = helpers.email || (depth0 != null ? depth0.email : depth0)) != null ? helper : helpers.helperMissing), (typeof helper === "function" ? helper.call(depth0 != null ? depth0 : {}, {
                    "name": "email",
                    "hash": {},
                    "data": data
                }) : helper)))
                + "</div>\n            <div class=\"icon-block\">Last visit: "
                + container.escapeExpression(((helper = (helper = helpers.lastVisit || (depth0 != null ? depth0.lastVisit : depth0)) != null ? helper : helpers.helperMissing), (typeof helper === "function" ? helper.call(depth0 != null ? depth0 : {}, {
                    "name": "lastVisit",
                    "hash": {},
                    "data": data
                }) : helper)))
                + "</div>\n            <div class=\"icon-block\"><a href=\"#\"><i class=\"fa fa-facebook\"></i></a><a href=\"#\"> <i class=\"fa fa-twitter\"></i></a><a href=\"#\"> <i class=\"fa fa-google-plus\"></i></a></div>\n        </div>\n    </div>\n</div>\n";
        }, "useData": true
    })
})();

