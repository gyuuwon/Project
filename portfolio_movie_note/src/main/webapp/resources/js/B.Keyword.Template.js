this["B"] = this["B"] || {};
this["B"]["Templates"] = this["B"]["Templates"] || {};

this["B"]["Templates"]["alert.hbs"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1, helper;

  return "	<div class=\"alert-sub-title\">"
    + ((stack1 = ((helper = (helper = helpers.alertWrapSubTitle || (depth0 != null ? depth0.alertWrapSubTitle : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"alertWrapSubTitle","hash":{},"data":data}) : helper))) != null ? stack1 : "")
    + "</div>\n";
},"3":function(depth0,helpers,partials,data) {
    var helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "		<a href=\""
    + alias3(((helper = (helper = helpers.alertWrapButtonLink || (depth0 != null ? depth0.alertWrapButtonLink : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"alertWrapButtonLink","hash":{},"data":data}) : helper)))
    + "\" class=\"alert-button\">"
    + alias3(((helper = (helper = helpers.alertWrapButton || (depth0 != null ? depth0.alertWrapButton : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"alertWrapButton","hash":{},"data":data}) : helper)))
    + "</a>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1, helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "<div class=\"alert-wrap "
    + alias3(((helper = (helper = helpers.alertWrapClass || (depth0 != null ? depth0.alertWrapClass : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"alertWrapClass","hash":{},"data":data}) : helper)))
    + "\">\n	<img src=\"//t1.daumcdn.net/brunch/static/img/help/pc/img_logo_empty.png\" alt=\"brunch\"/>\n	<div class=\"alert-title\">"
    + alias3(((helper = (helper = helpers.alertWrapTitle || (depth0 != null ? depth0.alertWrapTitle : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"alertWrapTitle","hash":{},"data":data}) : helper)))
    + "</div>\n\n"
    + ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.alertWrapSubTitle : depth0),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.alertWrapButton : depth0),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "</div>\n";
},"useData":true});

this["B"]["Templates"]["keyword-article-item.hbs"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    return "list_has_image";
},"3":function(depth0,helpers,partials,data) {
    return " has_image";
},"5":function(depth0,helpers,partials,data) {
    return "				<span class=\"pick_ico\"></span>\n";
},"7":function(depth0,helpers,partials,data) {
    return "<span class=\"ico_bar\"></span>";
},"9":function(depth0,helpers,partials,data) {
    var stack1;

  return "			<img src=\"//i1.daumcdn.net/thumb/C120x120/?fname="
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = ((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.articleImageListForHome : stack1)) != null ? stack1['0'] : stack1)) != null ? stack1.url : stack1), depth0))
    + "\" width=\"120\" height=\"120\" class=\"img_thumb\" alt=\"\">\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1, alias1=this.lambda, alias2=this.escapeExpression, alias3=helpers.helperMissing;

  return "<li data-articleuid=\""
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.userId : stack1), depth0))
    + "_"
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.no : stack1), depth0))
    + "\" class=\""
    + ((stack1 = (helpers.if_all || (depth0 && depth0.if_all) || alias3).call(depth0,((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.articleImageListForHome : stack1),((stack1 = ((stack1 = ((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.articleImageListForHome : stack1)) != null ? stack1['0'] : stack1)) != null ? stack1.url : stack1),{"name":"if_all","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " animation_up\">\n	<a href=\"/@@"
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.userId : stack1), depth0))
    + "/"
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.no : stack1), depth0))
    + "\" class=\"link_post\">\n		<div class=\"post_title"
    + ((stack1 = (helpers.if_all || (depth0 && depth0.if_all) || alias3).call(depth0,((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.articleImageListForHome : stack1),((stack1 = ((stack1 = ((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.articleImageListForHome : stack1)) != null ? stack1['0'] : stack1)) != null ? stack1.url : stack1),{"name":"if_all","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\">\n			<strong class=\"tit_subject\">"
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.title : stack1), depth0))
    + "</strong>\n"
    + ((stack1 = (helpers.isPickContents || (depth0 && depth0.isPickContents) || alias3).call(depth0,(depth0 != null ? depth0.pickContentId : depth0),((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.userId : stack1),((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.no : stack1),{"name":"isPickContents","hash":{},"fn":this.program(5, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "			<div class=\"wrap_sub_content\">\n				<em class=\"tit_sub\">"
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.subTitle : stack1), depth0))
    + "</em> "
    + ((stack1 = (helpers.if_all || (depth0 && depth0.if_all) || alias3).call(depth0,((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.subTitle : stack1),((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.contentSummary : stack1),{"name":"if_all","hash":{},"fn":this.program(7, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\n				<span class=\"article_content\">"
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.contentSummary : stack1), depth0))
    + "</span>\n			</div>\n			<span class=\"mobile_d_n post_append\">\n				<span class=\"name_txt\">공유</span>\n				<span class=\"num_txt\">"
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.socialShareTotalCount : stack1), depth0))
    + "</span>\n				<span class=\"ico_dot\"></span>\n				<span class=\"name_txt\">댓글</span>\n				<span class=\"num_txt\">"
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.commentCount : stack1), depth0))
    + "</span>\n				<span class=\"ico_dot\"></span>\n				<span class=\"publish_time\">"
    + alias2((helpers.brunchDate || (depth0 && depth0.brunchDate) || alias3).call(depth0,((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.publishTime : stack1),{"name":"brunchDate","hash":{},"data":data}))
    + "</span>\n				<span class=\"ico_dot\"></span>\n				<span class=\"ico_by\">by</span>\n				<span class=\"name_txt\">"
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.profile : depth0)) != null ? stack1.userName : stack1), depth0))
    + "</span>\n			</span>\n		</div>\n		<div class=\"post_thumb\">\n"
    + ((stack1 = (helpers.if_all || (depth0 && depth0.if_all) || alias3).call(depth0,((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.articleImageListForHome : stack1),((stack1 = ((stack1 = ((stack1 = (depth0 != null ? depth0.article : depth0)) != null ? stack1.articleImageListForHome : stack1)) != null ? stack1['0'] : stack1)) != null ? stack1.url : stack1),{"name":"if_all","hash":{},"fn":this.program(9, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "		</div>\n	</a>\n</li>\n";
},"useData":true});

this["B"]["Templates"]["search-user-item.hbs"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    return "single_line";
},"3":function(depth0,helpers,partials,data) {
    return "writer_type";
},"5":function(depth0,helpers,partials,data) {
    return "";
},"7":function(depth0,helpers,partials,data) {
    var stack1, helper, options, alias1=helpers.helperMissing, alias2="function", buffer = 
  "        <div class=\"wrap_keywords\">\n            <div class=\"keyword_list\" data-u=\""
    + this.escapeExpression(((helper = (helper = helpers.profileId || (depth0 != null ? depth0.profileId : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"profileId","hash":{},"data":data}) : helper)))
    + "\">\n                <div class=\"tab_keywords\" id=\"keywordItemListBlock\">\n";
  stack1 = ((helper = (helper = helpers.keywordsHighlight || (depth0 != null ? depth0.keywordsHighlight : depth0)) != null ? helper : alias1),(options={"name":"keywordsHighlight","hash":{},"fn":this.program(8, data, 0),"inverse":this.noop,"data":data}),(typeof helper === alias2 ? helper.call(depth0,options) : helper));
  if (!helpers.keywordsHighlight) { stack1 = helpers.blockHelperMissing.call(depth0,stack1,options)}
  if (stack1 != null) { buffer += stack1; }
  return buffer + "                </div>\n            </div>\n        </div>\n";
},"8":function(depth0,helpers,partials,data) {
    var alias1=this.lambda, alias2=this.escapeExpression;

  return "                        <a class=\"keyword_elem #profile_keyword\" href=\"/keyword/profile/"
    + alias2(alias1(depth0, depth0))
    + "\">"
    + alias2(alias1(depth0, depth0))
    + "</a>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1, helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "<div class=\"search_writer_item animation_up_late "
    + ((stack1 = helpers.unless.call(depth0,(depth0 != null ? depth0.description : depth0),{"name":"unless","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " "
    + ((stack1 = helpers.unless.call(depth0,(depth0 != null ? depth0.viewKeywords : depth0),{"name":"unless","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\">\n    <div class=\"search_writer_info\">\n        <a href=\"/@"
    + alias3(((helper = (helper = helpers.profileId || (depth0 != null ? depth0.profileId : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"profileId","hash":{},"data":data}) : helper)))
    + "\" class=\"ico_brunch bloger_thumb\">\n            <img src=\"//img1.daumcdn.net/thumb/C80x80/?fname="
    + ((stack1 = ((helper = (helper = helpers.userImage || (depth0 != null ? depth0.userImage : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"userImage","hash":{},"data":data}) : helper))) != null ? stack1 : "")
    + "\" width=\"80\" height=\"80\" class=\"img_thumb\" alt=\""
    + alias3(((helper = (helper = helpers.title || (depth0 != null ? depth0.title : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"title","hash":{},"data":data}) : helper)))
    + "\">\n            <span class=\"frame_g\"></span>\n        </a>\n        <a href=\"/@"
    + alias3(((helper = (helper = helpers.profileId || (depth0 != null ? depth0.profileId : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"profileId","hash":{},"data":data}) : helper)))
    + "\" class=\"link_follow\">\n        <span class=\"cont_follow\">\n            <strong class=\"tit_subject\">"
    + ((stack1 = ((helper = (helper = helpers.userNameHighlight || (depth0 != null ? depth0.userNameHighlight : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"userNameHighlight","hash":{},"data":data}) : helper))) != null ? stack1 : "")
    + "</strong>\n            <span class=\"desc_follow\">"
    + ((stack1 = ((helper = (helper = helpers.descriptionHighlight || (depth0 != null ? depth0.descriptionHighlight : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"descriptionHighlight","hash":{},"data":data}) : helper))) != null ? stack1 : "")
    + "</span>\n        </span>\n        </a>\n\n        <div class=\"info_append\">\n            <em>글 수 </em>"
    + ((stack1 = (helpers.numberFormat || (depth0 && depth0.numberFormat) || alias1).call(depth0,(depth0 != null ? depth0.articleCount : depth0),{"name":"numberFormat","hash":{},"fn":this.program(5, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "<span class=\"ico_dot\"></span><em>구독자 수 </em>"
    + ((stack1 = (helpers.numberFormat || (depth0 && depth0.numberFormat) || alias1).call(depth0,(depth0 != null ? depth0.followerCount : depth0),{"name":"numberFormat","hash":{},"fn":this.program(5, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\n        </div>\n    </div>\n\n"
    + ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.viewKeywords : depth0),{"name":"if","hash":{},"fn":this.program(7, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "</div>";
},"useData":true});