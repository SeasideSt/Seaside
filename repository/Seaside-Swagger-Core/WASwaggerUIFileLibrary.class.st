"
WASwaggerUIFileLibrary 
	addAllFilesIn: '/Users/jbrichau/github/swagger-ui/dist/css';
	addAllFilesIn: '/Users/jbrichau/github/swagger-ui/dist/lib';
	addAllFilesIn: '/Users/jbrichau/github/swagger-ui/dist/images';
	addFileAt: '/Users/jbrichau/github/swagger-ui/dist/swagger-ui.min.js'
"
Class {
	#name : #WASwaggerUIFileLibrary,
	#superclass : #WAFileLibrary,
	#category : 'Seaside-Swagger-Core'
}

{ #category : #uploaded }
WASwaggerUIFileLibrary >> apikeyJpeg [
	^ #[]
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> backboneminJs [
	^ '// Backbone.js 1.1.2

(function(t,e){if(typeof define==="function"&&define.amd){define(["underscore","jquery","exports"],function(i,r,s){t.Backbone=e(t,s,i,r)})}else if(typeof exports!=="undefined"){var i=require("underscore");e(t,exports,i)}else{t.Backbone=e(t,{},t._,t.jQuery||t.Zepto||t.ender||t.$)}})(this,function(t,e,i,r){var s=t.Backbone;var n=[];var a=n.push;var o=n.slice;var h=n.splice;e.VERSION="1.1.2";e.$=r;e.noConflict=function(){t.Backbone=s;return this};e.emulateHTTP=false;e.emulateJSON=false;var u=e.Events={on:function(t,e,i){if(!c(this,"on",t,[e,i])||!e)return this;this._events||(this._events={});var r=this._events[t]||(this._events[t]=[]);r.push({callback:e,context:i,ctx:i||this});return this},once:function(t,e,r){if(!c(this,"once",t,[e,r])||!e)return this;var s=this;var n=i.once(function(){s.off(t,n);e.apply(this,arguments)});n._callback=e;return this.on(t,n,r)},off:function(t,e,r){var s,n,a,o,h,u,l,f;if(!this._events||!c(this,"off",t,[e,r]))return this;if(!t&&!e&&!r){this._events=void 0;return this}o=t?[t]:i.keys(this._events);for(h=0,u=o.length;h<u;h++){t=o[h];if(a=this._events[t]){this._events[t]=s=[];if(e||r){for(l=0,f=a.length;l<f;l++){n=a[l];if(e&&e!==n.callback&&e!==n.callback._callback||r&&r!==n.context){s.push(n)}}}if(!s.length)delete this._events[t]}}return this},trigger:function(t){if(!this._events)return this;var e=o.call(arguments,1);if(!c(this,"trigger",t,e))return this;var i=this._events[t];var r=this._events.all;if(i)f(i,e);if(r)f(r,arguments);return this},stopListening:function(t,e,r){var s=this._listeningTo;if(!s)return this;var n=!e&&!r;if(!r&&typeof e==="object")r=this;if(t)(s={})[t._listenId]=t;for(var a in s){t=s[a];t.off(e,r,this);if(n||i.isEmpty(t._events))delete this._listeningTo[a]}return this}};var l=/\s+/;var c=function(t,e,i,r){if(!i)return true;if(typeof i==="object"){for(var s in i){t[e].apply(t,[s,i[s]].concat(r))}return false}if(l.test(i)){var n=i.split(l);for(var a=0,o=n.length;a<o;a++){t[e].apply(t,[n[a]].concat(r))}return false}return true};var f=function(t,e){var i,r=-1,s=t.length,n=e[0],a=e[1],o=e[2];switch(e.length){case 0:while(++r<s)(i=t[r]).callback.call(i.ctx);return;case 1:while(++r<s)(i=t[r]).callback.call(i.ctx,n);return;case 2:while(++r<s)(i=t[r]).callback.call(i.ctx,n,a);return;case 3:while(++r<s)(i=t[r]).callback.call(i.ctx,n,a,o);return;default:while(++r<s)(i=t[r]).callback.apply(i.ctx,e);return}};var d={listenTo:"on",listenToOnce:"once"};i.each(d,function(t,e){u[e]=function(e,r,s){var n=this._listeningTo||(this._listeningTo={});var a=e._listenId||(e._listenId=i.uniqueId("l"));n[a]=e;if(!s&&typeof r==="object")s=this;e[t](r,s,this);return this}});u.bind=u.on;u.unbind=u.off;i.extend(e,u);var p=e.Model=function(t,e){var r=t||{};e||(e={});this.cid=i.uniqueId("c");this.attributes={};if(e.collection)this.collection=e.collection;if(e.parse)r=this.parse(r,e)||{};r=i.defaults({},r,i.result(this,"defaults"));this.set(r,e);this.changed={};this.initialize.apply(this,arguments)};i.extend(p.prototype,u,{changed:null,validationError:null,idAttribute:"id",initialize:function(){},toJSON:function(t){return i.clone(this.attributes)},sync:function(){return e.sync.apply(this,arguments)},get:function(t){return this.attributes[t]},escape:function(t){return i.escape(this.get(t))},has:function(t){return this.get(t)!=null},set:function(t,e,r){var s,n,a,o,h,u,l,c;if(t==null)return this;if(typeof t==="object"){n=t;r=e}else{(n={})[t]=e}r||(r={});if(!this._validate(n,r))return false;a=r.unset;h=r.silent;o=[];u=this._changing;this._changing=true;if(!u){this._previousAttributes=i.clone(this.attributes);this.changed={}}c=this.attributes,l=this._previousAttributes;if(this.idAttribute in n)this.id=n[this.idAttribute];for(s in n){e=n[s];if(!i.isEqual(c[s],e))o.push(s);if(!i.isEqual(l[s],e)){this.changed[s]=e}else{delete this.changed[s]}a?delete c[s]:c[s]=e}if(!h){if(o.length)this._pending=r;for(var f=0,d=o.length;f<d;f++){this.trigger("change:"+o[f],this,c[o[f]],r)}}if(u)return this;if(!h){while(this._pending){r=this._pending;this._pending=false;this.trigger("change",this,r)}}this._pending=false;this._changing=false;return this},unset:function(t,e){return this.set(t,void 0,i.extend({},e,{unset:true}))},clear:function(t){var e={};for(var r in this.attributes)e[r]=void 0;return this.set(e,i.extend({},t,{unset:true}))},hasChanged:function(t){if(t==null)return!i.isEmpty(this.changed);return i.has(this.changed,t)},changedAttributes:function(t){if(!t)return this.hasChanged()?i.clone(this.changed):false;var e,r=false;var s=this._changing?this._previousAttributes:this.attributes;for(var n in t){if(i.isEqual(s[n],e=t[n]))continue;(r||(r={}))[n]=e}return r},previous:function(t){if(t==null||!this._previousAttributes)return null;return this._previousAttributes[t]},previousAttributes:function(){return i.clone(this._previousAttributes)},fetch:function(t){t=t?i.clone(t):{};if(t.parse===void 0)t.parse=true;var e=this;var r=t.success;t.success=function(i){if(!e.set(e.parse(i,t),t))return false;if(r)r(e,i,t);e.trigger("sync",e,i,t)};q(this,t);return this.sync("read",this,t)},save:function(t,e,r){var s,n,a,o=this.attributes;if(t==null||typeof t==="object"){s=t;r=e}else{(s={})[t]=e}r=i.extend({validate:true},r);if(s&&!r.wait){if(!this.set(s,r))return false}else{if(!this._validate(s,r))return false}if(s&&r.wait){this.attributes=i.extend({},o,s)}if(r.parse===void 0)r.parse=true;var h=this;var u=r.success;r.success=function(t){h.attributes=o;var e=h.parse(t,r);if(r.wait)e=i.extend(s||{},e);if(i.isObject(e)&&!h.set(e,r)){return false}if(u)u(h,t,r);h.trigger("sync",h,t,r)};q(this,r);n=this.isNew()?"create":r.patch?"patch":"update";if(n==="patch")r.attrs=s;a=this.sync(n,this,r);if(s&&r.wait)this.attributes=o;return a},destroy:function(t){t=t?i.clone(t):{};var e=this;var r=t.success;var s=function(){e.trigger("destroy",e,e.collection,t)};t.success=function(i){if(t.wait||e.isNew())s();if(r)r(e,i,t);if(!e.isNew())e.trigger("sync",e,i,t)};if(this.isNew()){t.success();return false}q(this,t);var n=this.sync("delete",this,t);if(!t.wait)s();return n},url:function(){var t=i.result(this,"urlRoot")||i.result(this.collection,"url")||M();if(this.isNew())return t;return t.replace(/([^\/])$/,"$1/")+encodeURIComponent(this.id)},parse:function(t,e){return t},clone:function(){return new this.constructor(this.attributes)},isNew:function(){return!this.has(this.idAttribute)},isValid:function(t){return this._validate({},i.extend(t||{},{validate:true}))},_validate:function(t,e){if(!e.validate||!this.validate)return true;t=i.extend({},this.attributes,t);var r=this.validationError=this.validate(t,e)||null;if(!r)return true;this.trigger("invalid",this,r,i.extend(e,{validationError:r}));return false}});var v=["keys","values","pairs","invert","pick","omit"];i.each(v,function(t){p.prototype[t]=function(){var e=o.call(arguments);e.unshift(this.attributes);return i[t].apply(i,e)}});var g=e.Collection=function(t,e){e||(e={});if(e.model)this.model=e.model;if(e.comparator!==void 0)this.comparator=e.comparator;this._reset();this.initialize.apply(this,arguments);if(t)this.reset(t,i.extend({silent:true},e))};var m={add:true,remove:true,merge:true};var y={add:true,remove:false};i.extend(g.prototype,u,{model:p,initialize:function(){},toJSON:function(t){return this.map(function(e){return e.toJSON(t)})},sync:function(){return e.sync.apply(this,arguments)},add:function(t,e){return this.set(t,i.extend({merge:false},e,y))},remove:function(t,e){var r=!i.isArray(t);t=r?[t]:i.clone(t);e||(e={});var s,n,a,o;for(s=0,n=t.length;s<n;s++){o=t[s]=this.get(t[s]);if(!o)continue;delete this._byId[o.id];delete this._byId[o.cid];a=this.indexOf(o);this.models.splice(a,1);this.length--;if(!e.silent){e.index=a;o.trigger("remove",o,this,e)}this._removeReference(o,e)}return r?t[0]:t},set:function(t,e){e=i.defaults({},e,m);if(e.parse)t=this.parse(t,e);var r=!i.isArray(t);t=r?t?[t]:[]:i.clone(t);var s,n,a,o,h,u,l;var c=e.at;var f=this.model;var d=this.comparator&&c==null&&e.sort!==false;var v=i.isString(this.comparator)?this.comparator:null;var g=[],y=[],_={};var b=e.add,w=e.merge,x=e.remove;var E=!d&&b&&x?[]:false;for(s=0,n=t.length;s<n;s++){h=t[s]||{};if(h instanceof p){a=o=h}else{a=h[f.prototype.idAttribute||"id"]}if(u=this.get(a)){if(x)_[u.cid]=true;if(w){h=h===o?o.attributes:h;if(e.parse)h=u.parse(h,e);u.set(h,e);if(d&&!l&&u.hasChanged(v))l=true}t[s]=u}else if(b){o=t[s]=this._prepareModel(h,e);if(!o)continue;g.push(o);this._addReference(o,e)}o=u||o;if(E&&(o.isNew()||!_[o.id]))E.push(o);_[o.id]=true}if(x){for(s=0,n=this.length;s<n;++s){if(!_[(o=this.models[s]).cid])y.push(o)}if(y.length)this.remove(y,e)}if(g.length||E&&E.length){if(d)l=true;this.length+=g.length;if(c!=null){for(s=0,n=g.length;s<n;s++){this.models.splice(c+s,0,g[s])}}else{if(E)this.models.length=0;var k=E||g;for(s=0,n=k.length;s<n;s++){this.models.push(k[s])}}}if(l)this.sort({silent:true});if(!e.silent){for(s=0,n=g.length;s<n;s++){(o=g[s]).trigger("add",o,this,e)}if(l||E&&E.length)this.trigger("sort",this,e)}return r?t[0]:t},reset:function(t,e){e||(e={});for(var r=0,s=this.models.length;r<s;r++){this._removeReference(this.models[r],e)}e.previousModels=this.models;this._reset();t=this.add(t,i.extend({silent:true},e));if(!e.silent)this.trigger("reset",this,e);return t},push:function(t,e){return this.add(t,i.extend({at:this.length},e))},pop:function(t){var e=this.at(this.length-1);this.remove(e,t);return e},unshift:function(t,e){return this.add(t,i.extend({at:0},e))},shift:function(t){var e=this.at(0);this.remove(e,t);return e},slice:function(){return o.apply(this.models,arguments)},get:function(t){if(t==null)return void 0;return this._byId[t]||this._byId[t.id]||this._byId[t.cid]},at:function(t){return this.models[t]},where:function(t,e){if(i.isEmpty(t))return e?void 0:[];return this[e?"find":"filter"](function(e){for(var i in t){if(t[i]!==e.get(i))return false}return true})},findWhere:function(t){return this.where(t,true)},sort:function(t){if(!this.comparator)throw new Error("Cannot sort a set without a comparator");t||(t={});if(i.isString(this.comparator)||this.comparator.length===1){this.models=this.sortBy(this.comparator,this)}else{this.models.sort(i.bind(this.comparator,this))}if(!t.silent)this.trigger("sort",this,t);return this},pluck:function(t){return i.invoke(this.models,"get",t)},fetch:function(t){t=t?i.clone(t):{};if(t.parse===void 0)t.parse=true;var e=t.success;var r=this;t.success=function(i){var s=t.reset?"reset":"set";r[s](i,t);if(e)e(r,i,t);r.trigger("sync",r,i,t)};q(this,t);return this.sync("read",this,t)},create:function(t,e){e=e?i.clone(e):{};if(!(t=this._prepareModel(t,e)))return false;if(!e.wait)this.add(t,e);var r=this;var s=e.success;e.success=function(t,i){if(e.wait)r.add(t,e);if(s)s(t,i,e)};t.save(null,e);return t},parse:function(t,e){return t},clone:function(){return new this.constructor(this.models)},_reset:function(){this.length=0;this.models=[];this._byId={}},_prepareModel:function(t,e){if(t instanceof p)return t;e=e?i.clone(e):{};e.collection=this;var r=new this.model(t,e);if(!r.validationError)return r;this.trigger("invalid",this,r.validationError,e);return false},_addReference:function(t,e){this._byId[t.cid]=t;if(t.id!=null)this._byId[t.id]=t;if(!t.collection)t.collection=this;t.on("all",this._onModelEvent,this)},_removeReference:function(t,e){if(this===t.collection)delete t.collection;t.off("all",this._onModelEvent,this)},_onModelEvent:function(t,e,i,r){if((t==="add"||t==="remove")&&i!==this)return;if(t==="destroy")this.remove(e,r);if(e&&t==="change:"+e.idAttribute){delete this._byId[e.previous(e.idAttribute)];if(e.id!=null)this._byId[e.id]=e}this.trigger.apply(this,arguments)}});var _=["forEach","each","map","collect","reduce","foldl","inject","reduceRight","foldr","find","detect","filter","select","reject","every","all","some","any","include","contains","invoke","max","min","toArray","size","first","head","take","initial","rest","tail","drop","last","without","difference","indexOf","shuffle","lastIndexOf","isEmpty","chain","sample"];i.each(_,function(t){g.prototype[t]=function(){var e=o.call(arguments);e.unshift(this.models);return i[t].apply(i,e)}});var b=["groupBy","countBy","sortBy","indexBy"];i.each(b,function(t){g.prototype[t]=function(e,r){var s=i.isFunction(e)?e:function(t){return t.get(e)};return i[t](this.models,s,r)}});var w=e.View=function(t){this.cid=i.uniqueId("view");t||(t={});i.extend(this,i.pick(t,E));this._ensureElement();this.initialize.apply(this,arguments);this.delegateEvents()};var x=/^(\S+)\s*(.*)$/;var E=["model","collection","el","id","attributes","className","tagName","events"];i.extend(w.prototype,u,{tagName:"div",$:function(t){return this.$el.find(t)},initialize:function(){},render:function(){return this},remove:function(){this.$el.remove();this.stopListening();return this},setElement:function(t,i){if(this.$el)this.undelegateEvents();this.$el=t instanceof e.$?t:e.$(t);this.el=this.$el[0];if(i!==false)this.delegateEvents();return this},delegateEvents:function(t){if(!(t||(t=i.result(this,"events"))))return this;this.undelegateEvents();for(var e in t){var r=t[e];if(!i.isFunction(r))r=this[t[e]];if(!r)continue;var s=e.match(x);var n=s[1],a=s[2];r=i.bind(r,this);n+=".delegateEvents"+this.cid;if(a===""){this.$el.on(n,r)}else{this.$el.on(n,a,r)}}return this},undelegateEvents:function(){this.$el.off(".delegateEvents"+this.cid);return this},_ensureElement:function(){if(!this.el){var t=i.extend({},i.result(this,"attributes"));if(this.id)t.id=i.result(this,"id");if(this.className)t["class"]=i.result(this,"className");var r=e.$("<"+i.result(this,"tagName")+">").attr(t);this.setElement(r,false)}else{this.setElement(i.result(this,"el"),false)}}});e.sync=function(t,r,s){var n=T[t];i.defaults(s||(s={}),{emulateHTTP:e.emulateHTTP,emulateJSON:e.emulateJSON});var a={type:n,dataType:"json"};if(!s.url){a.url=i.result(r,"url")||M()}if(s.data==null&&r&&(t==="create"||t==="update"||t==="patch")){a.contentType="application/json";a.data=JSON.stringify(s.attrs||r.toJSON(s))}if(s.emulateJSON){a.contentType="application/x-www-form-urlencoded";a.data=a.data?{model:a.data}:{}}if(s.emulateHTTP&&(n==="PUT"||n==="DELETE"||n==="PATCH")){a.type="POST";if(s.emulateJSON)a.data._method=n;var o=s.beforeSend;s.beforeSend=function(t){t.setRequestHeader("X-HTTP-Method-Override",n);if(o)return o.apply(this,arguments)}}if(a.type!=="GET"&&!s.emulateJSON){a.processData=false}if(a.type==="PATCH"&&k){a.xhr=function(){return new ActiveXObject("Microsoft.XMLHTTP")}}var h=s.xhr=e.ajax(i.extend(a,s));r.trigger("request",r,h,s);return h};var k=typeof window!=="undefined"&&!!window.ActiveXObject&&!(window.XMLHttpRequest&&(new XMLHttpRequest).dispatchEvent);var T={create:"POST",update:"PUT",patch:"PATCH","delete":"DELETE",read:"GET"};e.ajax=function(){return e.$.ajax.apply(e.$,arguments)};var $=e.Router=function(t){t||(t={});if(t.routes)this.routes=t.routes;this._bindRoutes();this.initialize.apply(this,arguments)};var S=/\((.*?)\)/g;var H=/(\(\?)?:\w+/g;var A=/\*\w+/g;var I=/[\-{}\[\]+?.,\\\^$|#\s]/g;i.extend($.prototype,u,{initialize:function(){},route:function(t,r,s){if(!i.isRegExp(t))t=this._routeToRegExp(t);if(i.isFunction(r)){s=r;r=""}if(!s)s=this[r];var n=this;e.history.route(t,function(i){var a=n._extractParameters(t,i);n.execute(s,a);n.trigger.apply(n,["route:"+r].concat(a));n.trigger("route",r,a);e.history.trigger("route",n,r,a)});return this},execute:function(t,e){if(t)t.apply(this,e)},navigate:function(t,i){e.history.navigate(t,i);return this},_bindRoutes:function(){if(!this.routes)return;this.routes=i.result(this,"routes");var t,e=i.keys(this.routes);while((t=e.pop())!=null){this.route(t,this.routes[t])}},_routeToRegExp:function(t){t=t.replace(I,"\\$&").replace(S,"(?:$1)?").replace(H,function(t,e){return e?t:"([^/?]+)"}).replace(A,"([^?]*?)");return new RegExp("^"+t+"(?:\\?([\\s\\S]*))?$")},_extractParameters:function(t,e){var r=t.exec(e).slice(1);return i.map(r,function(t,e){if(e===r.length-1)return t||null;return t?decodeURIComponent(t):null})}});var N=e.History=function(){this.handlers=[];i.bindAll(this,"checkUrl");if(typeof window!=="undefined"){this.location=window.location;this.history=window.history}};var R=/^[#\/]|\s+$/g;var O=/^\/+|\/+$/g;var P=/msie [\w.]+/;var C=/\/$/;var j=/#.*$/;N.started=false;i.extend(N.prototype,u,{interval:50,atRoot:function(){return this.location.pathname.replace(/[^\/]$/,"$&/")===this.root},getHash:function(t){var e=(t||this).location.href.match(/#(.*)$/);return e?e[1]:""},getFragment:function(t,e){if(t==null){if(this._hasPushState||!this._wantsHashChange||e){t=decodeURI(this.location.pathname+this.location.search);var i=this.root.replace(C,"");if(!t.indexOf(i))t=t.slice(i.length)}else{t=this.getHash()}}return t.replace(R,"")},start:function(t){if(N.started)throw new Error("Backbone.history has already been started");N.started=true;this.options=i.extend({root:"/"},this.options,t);this.root=this.options.root;this._wantsHashChange=this.options.hashChange!==false;this._wantsPushState=!!this.options.pushState;this._hasPushState=!!(this.options.pushState&&this.history&&this.history.pushState);var r=this.getFragment();var s=document.documentMode;var n=P.exec(navigator.userAgent.toLowerCase())&&(!s||s<=7);this.root=("/"+this.root+"/").replace(O,"/");if(n&&this._wantsHashChange){var a=e.$(''<iframe src="javascript:0" tabindex="-1">'');this.iframe=a.hide().appendTo("body")[0].contentWindow;this.navigate(r)}if(this._hasPushState){e.$(window).on("popstate",this.checkUrl)}else if(this._wantsHashChange&&"onhashchange"in window&&!n){e.$(window).on("hashchange",this.checkUrl)}else if(this._wantsHashChange){this._checkUrlInterval=setInterval(this.checkUrl,this.interval)}this.fragment=r;var o=this.location;if(this._wantsHashChange&&this._wantsPushState){if(!this._hasPushState&&!this.atRoot()){this.fragment=this.getFragment(null,true);this.location.replace(this.root+"#"+this.fragment);return true}else if(this._hasPushState&&this.atRoot()&&o.hash){this.fragment=this.getHash().replace(R,"");this.history.replaceState({},document.title,this.root+this.fragment)}}if(!this.options.silent)return this.loadUrl()},stop:function(){e.$(window).off("popstate",this.checkUrl).off("hashchange",this.checkUrl);if(this._checkUrlInterval)clearInterval(this._checkUrlInterval);N.started=false},route:function(t,e){this.handlers.unshift({route:t,callback:e})},checkUrl:function(t){var e=this.getFragment();if(e===this.fragment&&this.iframe){e=this.getFragment(this.getHash(this.iframe))}if(e===this.fragment)return false;if(this.iframe)this.navigate(e);this.loadUrl()},loadUrl:function(t){t=this.fragment=this.getFragment(t);return i.any(this.handlers,function(e){if(e.route.test(t)){e.callback(t);return true}})},navigate:function(t,e){if(!N.started)return false;if(!e||e===true)e={trigger:!!e};var i=this.root+(t=this.getFragment(t||""));t=t.replace(j,"");if(this.fragment===t)return;this.fragment=t;if(t===""&&i!=="/")i=i.slice(0,-1);if(this._hasPushState){this.history[e.replace?"replaceState":"pushState"]({},document.title,i)}else if(this._wantsHashChange){this._updateHash(this.location,t,e.replace);if(this.iframe&&t!==this.getFragment(this.getHash(this.iframe))){if(!e.replace)this.iframe.document.open().close();this._updateHash(this.iframe.location,t,e.replace)}}else{return this.location.assign(i)}if(e.trigger)return this.loadUrl(t)},_updateHash:function(t,e,i){if(i){var r=t.href.replace(/(javascript:|#).*$/,"");t.replace(r+"#"+e)}else{t.hash="#"+e}}});e.history=new N;var U=function(t,e){var r=this;var s;if(t&&i.has(t,"constructor")){s=t.constructor}else{s=function(){return r.apply(this,arguments)}}i.extend(s,r,e);var n=function(){this.constructor=s};n.prototype=r.prototype;s.prototype=new n;if(t)i.extend(s.prototype,t);s.__super__=r.prototype;return s};p.extend=g.extend=$.extend=w.extend=N.extend=U;var M=function(){throw new Error(''A "url" property or function must be specified'')};var q=function(t,e){var i=e.error;e.error=function(r){if(i)i(t,r,e);t.trigger("error",t,r,e)}};return e});

// From http://stackoverflow.com/a/19431552
// Compatibility override - Backbone 1.1 got rid of the ''options'' binding
// automatically to views in the constructor - we need to keep that.
Backbone.View = (function(View) {
   return View.extend({
        constructor: function(options) {
            this.options = options || {};
            View.apply(this, arguments);
        }
    });
})(Backbone.View);'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> explorericonsPng [
	^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 1 44 0 0 0 50 8 6 0 0 0 230 214 230 42 0 0 0 9 112 72 89 115 0 0 11 19 0 0 11 19 1 0 154 156 24 0 0 10 79 105 67 67 80 80 104 111 116 111 115 104 111 112 32 73 67 67 32 112 114 111 102 105 108 101 0 0 120 218 157 83 103 84 83 233 22 61 247 222 244 66 75 136 128 148 75 111 82 21 8 32 82 66 139 128 20 145 38 42 33 9 16 74 136 33 161 217 21 81 193 17 69 69 4 27 200 160 136 3 142 142 128 140 21 81 44 12 138 10 216 7 228 33 162 142 131 163 136 138 202 251 225 123 163 107 214 188 247 230 205 254 181 215 62 231 172 243 157 179 207 7 192 8 12 150 72 51 81 53 128 12 169 66 30 17 224 131 199 196 198 225 228 46 64 129 10 36 112 0 16 8 179 100 33 115 253 35 1 0 248 126 60 60 43 34 192 7 190 0 1 120 211 11 8 0 192 77 155 192 48 28 135 255 15 234 66 153 92 1 128 132 1 192 116 145 56 75 8 128 20 0 64 122 142 66 166 0 64 70 1 128 157 152 38 83 0 160 4 0 96 203 99 98 227 0 80 45 0 96 39 127 230 211 0 128 157 248 153 123 1 0 91 148 33 21 1 160 145 0 32 19 101 136 68 0 104 59 0 172 207 86 138 69 0 88 48 0 20 102 75 196 57 0 216 45 0 48 73 87 102 72 0 176 183 0 192 206 16 11 178 0 8 12 0 48 81 136 133 41 0 4 123 0 96 200 35 35 120 0 132 153 0 20 70 242 87 60 241 43 174 16 231 42 0 0 120 153 178 60 185 36 57 69 129 91 8 45 113 7 87 87 46 30 40 206 73 23 43 20 54 97 2 97 154 64 46 194 121 153 25 50 129 52 15 224 243 204 0 0 160 145 21 17 224 131 243 253 120 206 14 174 206 206 54 142 182 14 95 45 234 191 6 255 34 98 98 227 254 229 207 171 112 64 0 0 225 116 126 209 254 44 47 179 26 128 59 6 128 109 254 162 37 238 4 104 94 11 160 117 247 139 102 178 15 64 181 0 160 233 218 87 243 112 248 126 60 60 69 161 144 185 217 217 229 228 228 216 74 196 66 91 97 202 87 125 254 103 194 95 192 87 253 108 249 126 60 252 247 245 224 190 226 36 129 50 93 129 71 4 248 224 194 204 244 76 165 28 207 146 9 132 98 220 230 143 71 252 183 11 255 252 29 211 34 196 73 98 185 88 42 20 227 81 18 113 142 68 154 140 243 50 165 34 137 66 146 41 197 37 210 255 100 226 223 44 251 3 62 223 53 0 176 106 62 1 123 145 45 168 93 99 3 246 75 39 16 88 116 192 226 247 0 0 242 187 111 193 212 40 8 3 128 104 131 225 207 119 255 239 63 253 71 160 37 0 128 102 73 146 113 0 0 94 68 36 46 84 202 179 63 199 8 0 0 68 160 129 42 176 65 27 244 193 24 44 192 6 28 193 5 220 193 11 252 96 54 132 66 36 196 194 66 16 66 10 100 128 28 114 96 41 172 130 66 40 134 205 176 29 42 96 47 212 64 29 52 192 81 104 134 147 112 14 46 194 85 184 14 61 112 15 250 97 8 158 193 40 188 129 9 4 65 200 8 19 97 33 218 136 1 98 138 88 35 142 8 23 153 133 248 33 193 72 4 18 139 36 32 201 136 20 81 34 75 145 53 72 49 82 138 84 32 85 72 29 242 61 114 2 57 135 92 70 186 145 59 200 0 50 130 252 134 188 71 49 148 129 178 81 61 212 12 181 67 185 168 55 26 132 70 162 11 208 100 116 49 154 143 22 160 155 208 114 180 26 61 140 54 161 231 208 171 104 15 218 143 62 67 199 48 192 232 24 7 51 196 108 48 46 198 195 66 177 56 44 9 147 99 203 177 34 172 12 171 198 26 176 86 172 3 187 137 245 99 207 177 119 4 18 129 69 192 9 54 4 119 66 32 97 30 65 72 88 76 88 78 216 72 168 32 28 36 52 17 218 9 55 9 3 132 81 194 39 34 147 168 75 180 38 186 17 249 196 24 98 50 49 135 88 72 44 35 214 18 143 19 47 16 123 136 67 196 55 36 18 137 67 50 39 185 144 2 73 177 164 84 210 18 210 70 210 110 82 35 233 44 169 155 52 72 26 35 147 201 218 100 107 178 7 57 148 44 32 43 200 133 228 157 228 195 228 51 228 27 228 33 242 91 10 157 98 64 113 164 248 83 226 40 82 202 106 74 25 229 16 229 52 229 6 101 152 50 65 85 163 154 82 221 168 161 84 17 53 143 90 66 173 161 182 82 175 81 135 168 19 52 117 154 57 205 131 22 73 75 165 173 162 149 211 26 104 23 104 247 105 175 232 116 186 17 221 149 30 78 151 208 87 210 203 233 71 232 151 232 3 244 119 12 13 134 21 131 199 136 103 40 25 155 24 7 24 103 25 119 24 175 152 76 166 25 211 139 25 199 84 48 55 49 235 152 231 153 15 153 111 85 88 42 182 42 124 21 145 202 10 149 74 149 38 149 27 42 47 84 169 170 166 170 222 170 11 85 243 85 203 84 143 169 94 83 125 174 70 85 51 83 227 169 9 212 150 171 85 170 157 80 235 83 27 83 103 169 59 168 135 170 103 168 111 84 63 164 126 89 253 137 6 89 195 76 195 79 67 164 81 160 177 95 227 188 198 32 11 99 25 179 120 44 33 107 13 171 134 117 129 53 196 38 177 205 217 124 118 42 187 152 253 29 187 139 61 170 169 161 57 67 51 74 51 87 179 82 243 148 102 63 7 227 152 113 248 156 116 78 9 231 40 167 151 243 126 138 222 20 239 41 226 41 27 166 52 76 185 49 101 92 107 170 150 151 150 88 171 72 171 81 171 71 235 189 54 174 237 167 157 166 189 69 187 89 251 129 14 65 199 74 39 92 39 71 103 143 206 5 157 231 83 217 83 221 167 10 167 22 77 61 58 245 174 46 170 107 165 27 161 187 68 119 191 110 167 238 152 158 190 94 128 158 76 111 167 222 121 189 231 250 28 125 47 253 84 253 109 250 167 245 71 12 88 6 179 12 36 6 219 12 206 24 60 197 53 113 111 60 29 47 199 219 241 81 67 93 195 64 67 165 97 149 97 151 225 132 145 185 209 60 163 213 70 141 70 15 140 105 198 92 227 36 227 109 198 109 198 163 38 6 38 33 38 75 77 234 77 238 154 82 77 185 166 41 166 59 76 59 76 199 205 204 205 162 205 214 153 53 155 61 49 215 50 231 155 231 155 215 155 223 183 96 90 120 90 44 182 168 182 184 101 73 178 228 90 166 89 238 182 188 110 133 90 57 89 165 88 85 90 93 179 70 173 157 173 37 214 187 173 187 167 17 167 185 78 147 78 171 158 214 103 195 176 241 182 201 182 169 183 25 176 229 216 6 219 174 182 109 182 125 97 103 98 23 103 183 197 174 195 238 147 189 147 125 186 125 141 253 61 7 13 135 217 14 171 29 90 29 126 115 180 114 20 58 86 58 222 154 206 156 238 63 125 197 244 150 233 47 103 88 207 16 207 216 51 227 182 19 203 41 196 105 157 83 155 211 71 103 23 103 185 115 131 243 136 139 137 75 130 203 46 151 62 46 155 27 198 221 200 189 228 74 116 245 113 93 225 122 210 245 157 155 179 155 194 237 168 219 175 238 54 238 105 238 135 220 159 204 52 159 41 158 89 51 115 208 195 200 67 224 81 229 209 63 11 159 149 48 107 223 172 126 79 67 79 129 103 181 231 35 47 99 47 145 87 173 215 176 183 165 119 170 247 97 239 23 62 246 62 114 159 227 62 227 60 55 222 50 222 89 95 204 55 192 183 200 183 203 79 195 111 158 95 133 223 67 127 35 255 100 255 122 255 209 0 167 128 37 1 103 3 137 129 65 129 91 2 251 248 122 124 33 191 142 63 58 219 101 246 178 217 237 65 140 160 185 65 21 65 143 130 173 130 229 193 173 33 104 200 236 144 173 33 247 231 152 206 145 206 105 14 133 80 126 232 214 208 7 97 230 97 139 195 126 12 39 133 135 133 87 134 63 142 112 136 88 26 209 49 151 53 119 209 220 67 115 223 68 250 68 150 68 222 155 103 49 79 57 175 45 74 53 42 62 170 46 106 60 218 55 186 52 186 63 198 46 102 89 204 213 88 157 88 73 108 75 28 57 46 42 174 54 110 108 190 223 252 237 243 135 226 157 226 11 227 123 23 152 47 200 93 112 121 161 206 194 244 133 167 22 169 46 18 44 58 150 64 76 136 78 56 148 240 65 16 42 168 22 140 37 242 19 119 37 142 10 121 194 29 194 103 34 47 209 54 209 136 216 67 92 42 30 78 242 72 42 77 122 146 236 145 188 53 121 36 197 51 165 44 229 185 132 39 169 144 188 76 13 76 221 155 58 158 22 154 118 32 109 50 61 58 189 49 131 146 145 144 113 66 170 33 77 147 182 103 234 103 230 102 118 203 172 101 133 178 254 197 110 139 183 47 30 149 7 201 107 179 144 172 5 89 45 10 182 66 166 232 84 90 40 215 42 7 178 103 101 87 102 191 205 137 202 57 150 171 158 43 205 237 204 179 202 219 144 55 156 239 159 255 237 18 194 18 225 146 182 165 134 75 87 45 29 88 230 189 172 106 57 178 60 113 121 219 10 227 21 5 43 134 86 6 172 60 184 138 182 42 109 213 79 171 237 87 151 174 126 189 38 122 77 107 129 94 193 202 130 193 181 1 107 235 11 85 10 229 133 125 235 220 215 237 93 79 88 47 89 223 181 97 250 134 157 27 62 21 137 138 174 20 219 23 151 21 127 216 40 220 120 229 27 135 111 202 191 153 220 148 180 169 171 196 185 100 207 102 210 102 233 230 222 45 158 91 14 150 170 151 230 151 14 110 13 217 218 180 13 223 86 180 237 245 246 69 219 47 151 205 40 219 187 131 182 67 185 163 191 60 184 188 101 167 201 206 205 59 63 84 164 84 244 84 250 84 54 238 210 221 181 97 215 248 110 209 238 27 123 188 246 52 236 213 219 91 188 247 253 62 201 190 219 85 1 85 77 213 102 213 101 251 73 251 179 247 63 174 137 170 233 248 150 251 109 93 173 78 109 113 237 199 3 210 3 253 7 35 14 182 215 185 212 213 29 210 61 84 82 143 214 43 235 71 14 199 31 190 254 157 239 119 45 13 54 13 85 141 156 198 226 35 112 68 121 228 233 247 9 223 247 30 13 58 218 118 140 123 172 225 7 211 31 118 29 103 29 47 106 66 154 242 154 70 155 83 154 251 91 98 91 186 79 204 62 209 214 234 222 122 252 71 219 31 15 156 52 60 89 121 74 243 84 201 105 218 233 130 211 147 103 242 207 140 157 149 157 125 126 46 249 220 96 219 162 182 123 231 99 206 223 106 15 111 239 186 16 116 225 210 69 255 139 231 59 188 59 206 92 242 184 116 242 178 219 229 19 87 184 87 154 175 58 95 109 234 116 234 60 254 147 211 79 199 187 156 187 154 174 185 92 107 185 238 122 189 181 123 102 247 233 27 158 55 206 221 244 189 121 241 22 255 214 213 158 57 61 221 189 243 122 111 247 197 247 245 223 22 221 126 114 39 253 206 203 187 217 119 39 238 173 188 79 188 95 244 64 237 65 217 67 221 135 213 63 91 254 220 216 239 220 127 106 192 119 160 243 209 220 71 247 6 133 131 207 254 145 245 143 15 67 5 143 153 143 203 134 13 134 235 158 56 62 57 57 226 63 114 253 233 252 167 67 207 100 207 38 158 23 254 162 254 203 174 23 22 47 126 248 213 235 215 206 209 152 209 161 151 242 151 147 191 109 124 165 253 234 192 235 25 175 219 198 194 198 30 190 201 120 51 49 94 244 86 251 237 193 119 220 119 29 239 163 223 15 79 228 124 32 127 40 255 104 249 177 245 83 208 167 251 147 25 147 147 255 4 3 152 243 252 99 51 45 219 0 0 0 32 99 72 82 77 0 0 122 37 0 0 128 131 0 0 249 255 0 0 128 233 0 0 117 48 0 0 234 96 0 0 58 152 0 0 23 111 146 95 197 70 0 0 11 174 73 68 65 84 120 218 236 156 109 112 84 213 25 199 127 231 238 75 178 121 1 36 138 54 64 165 181 34 72 170 65 137 66 3 217 240 18 44 144 136 166 82 180 211 193 140 173 248 165 173 76 237 88 28 58 5 102 68 116 90 167 226 7 105 153 169 3 12 51 202 232 40 66 128 118 120 25 146 64 45 6 146 72 17 166 40 72 208 82 80 9 145 100 179 73 246 222 123 250 97 201 37 36 187 33 123 119 33 216 121 126 51 119 216 236 217 189 255 123 238 185 231 191 207 243 220 115 81 196 97 222 82 77 83 26 105 104 51 3 195 219 105 249 8 239 249 141 178 227 125 94 107 77 34 40 165 98 190 127 120 222 157 100 183 230 164 105 195 200 48 44 58 189 62 21 206 221 178 231 170 235 234 195 243 128 206 52 208 25 160 59 105 39 172 38 108 73 153 174 32 8 201 211 107 246 78 127 65 167 41 101 87 104 88 2 140 236 214 100 163 245 58 96 197 228 14 207 241 229 203 85 74 141 163 113 214 148 52 173 140 10 98 232 42 88 103 43 189 98 212 132 234 227 106 121 106 13 75 31 158 155 134 101 87 160 244 18 80 151 247 87 177 14 91 173 224 174 241 199 85 15 97 23 134 165 223 123 239 61 62 250 232 35 34 145 72 82 131 166 181 198 182 109 148 82 206 54 80 228 230 230 82 80 80 64 126 126 126 204 235 169 191 93 106 104 104 160 182 182 150 211 167 79 15 88 95 180 214 206 102 24 70 210 231 213 231 243 49 110 220 56 230 206 157 155 204 185 17 98 26 150 214 76 123 209 46 84 176 19 72 239 251 75 250 117 219 242 44 220 253 59 101 37 107 28 26 104 156 83 84 136 86 87 212 5 253 186 199 240 46 28 89 185 59 121 93 13 28 42 43 68 209 47 93 108 22 170 252 74 215 186 235 214 173 211 166 105 82 84 84 196 45 183 220 146 212 160 157 57 115 134 234 234 106 103 66 120 60 158 1 187 128 206 159 63 207 145 35 71 200 203 203 35 24 12 186 154 148 85 85 85 250 149 134 177 156 107 177 48 237 129 155 12 166 13 131 3 138 71 111 220 154 210 113 242 122 189 60 254 248 227 98 88 41 192 219 245 98 218 74 251 17 165 120 171 123 99 193 119 21 195 6 69 95 239 62 162 9 119 94 156 172 168 39 148 199 30 87 252 146 46 220 243 219 75 166 229 134 198 89 193 71 208 151 235 6 238 189 15 207 77 55 3 16 170 218 137 14 135 187 236 230 9 219 182 198 125 62 171 184 112 196 246 61 73 233 242 175 178 71 232 209 95 178 239 1 223 77 209 215 205 85 96 183 59 186 24 140 211 31 206 42 84 119 111 119 165 123 242 228 73 42 42 42 104 107 107 227 147 79 62 73 234 208 211 211 211 153 49 99 6 111 188 241 6 147 39 79 38 16 8 12 200 197 19 137 68 240 249 124 100 100 100 80 83 83 67 48 24 116 181 159 218 218 90 206 182 141 6 32 205 119 229 121 109 89 26 91 131 173 193 80 209 205 227 81 151 181 245 124 15 46 253 29 119 50 88 154 252 246 151 153 49 227 23 41 29 167 181 107 215 138 211 164 210 176 102 188 104 222 166 123 152 6 192 67 247 194 253 183 69 7 185 246 196 37 195 186 200 253 30 219 90 189 116 169 94 216 51 61 236 191 89 21 221 166 85 111 221 236 178 114 2 5 19 1 104 63 248 1 166 99 88 160 225 126 19 189 90 47 101 97 207 244 176 223 161 255 135 165 183 65 111 93 114 74 33 123 66 244 117 75 93 55 195 138 246 23 229 93 173 245 210 133 202 165 112 107 107 43 150 101 37 29 17 69 34 17 90 91 91 233 232 232 192 182 7 46 36 241 249 124 12 25 50 132 72 36 66 40 20 114 189 159 80 40 4 170 127 102 21 49 53 157 22 88 118 212 132 12 21 141 154 253 90 99 40 104 55 163 109 30 67 145 78 244 51 225 72 244 223 64 63 76 43 139 172 148 143 147 144 66 195 154 249 7 141 101 218 111 187 204 40 159 172 73 179 94 4 78 36 28 46 207 156 73 187 234 112 167 171 120 242 84 109 240 69 168 58 145 184 89 205 4 165 92 246 151 39 57 92 231 170 191 93 164 58 125 235 43 53 173 171 171 99 239 222 189 52 53 53 1 144 151 151 71 105 105 41 233 233 233 28 61 122 148 141 27 55 246 250 206 252 249 243 57 125 250 52 53 53 53 189 218 22 47 94 76 122 250 229 217 179 97 24 215 236 98 181 44 77 135 169 153 119 95 38 139 30 24 228 188 255 202 223 47 240 214 7 33 124 30 69 197 148 44 126 30 204 98 245 174 22 54 238 15 97 40 88 93 145 195 183 115 188 148 175 250 2 207 0 141 147 144 34 195 178 76 107 20 168 252 88 141 155 14 194 63 62 142 78 136 150 246 216 59 48 20 75 128 159 37 42 220 238 105 143 171 219 175 137 138 118 165 139 242 143 2 242 147 112 8 119 186 128 215 235 189 102 3 91 95 95 207 230 205 155 153 61 123 54 197 197 197 132 195 97 214 172 89 195 154 53 107 88 180 104 145 99 52 115 230 204 33 24 12 58 197 102 219 182 57 115 230 12 0 79 63 253 52 195 135 15 119 222 55 77 19 203 178 6 236 98 53 109 88 244 192 32 74 242 2 252 254 157 102 246 31 239 96 228 80 15 127 124 108 40 227 134 251 88 190 233 107 231 179 143 77 202 228 157 3 109 68 172 104 228 213 175 75 227 98 125 243 90 142 147 144 24 134 214 106 78 188 198 227 103 53 117 39 163 91 167 25 207 56 212 130 233 47 232 196 115 66 21 95 183 159 59 88 240 249 195 211 93 228 162 201 235 234 163 15 187 202 129 125 62 95 74 183 184 131 106 24 212 212 212 48 98 196 8 130 193 32 166 105 226 247 251 153 61 123 54 77 77 77 212 213 213 57 134 165 181 198 52 77 103 211 90 119 187 49 161 137 68 34 142 81 13 100 250 9 48 36 195 96 222 125 153 108 58 216 198 254 227 29 0 124 214 100 177 97 95 43 37 121 1 6 7 148 19 113 158 58 103 242 216 164 76 76 59 90 235 234 74 31 175 167 113 18 92 252 232 43 165 243 227 221 113 125 102 182 114 106 88 63 121 205 230 139 11 177 247 97 120 200 0 18 45 98 228 39 123 236 118 135 53 32 186 152 174 116 175 217 47 119 71 71 7 77 77 77 140 30 61 218 49 34 165 20 185 185 185 0 52 55 55 147 153 153 9 192 182 109 219 216 182 109 155 147 50 206 159 63 223 217 207 171 175 190 234 188 46 41 41 161 176 176 112 64 47 214 113 195 163 147 255 63 231 47 143 242 186 254 190 115 184 191 91 118 208 198 175 102 14 98 253 222 196 107 72 18 97 93 199 134 5 106 104 210 181 5 219 244 131 55 161 9 172 97 104 178 247 121 109 109 251 19 55 14 61 52 233 37 49 182 118 161 123 117 38 130 223 239 199 239 247 199 76 109 148 82 120 60 158 203 34 166 174 8 172 235 88 202 202 202 152 58 117 42 90 107 44 203 114 214 32 1 60 243 204 51 228 230 230 58 109 182 109 199 172 153 165 34 138 240 26 209 173 207 200 199 171 122 125 199 180 47 69 78 126 15 248 46 22 213 79 124 97 210 208 216 201 79 11 179 186 213 165 84 159 26 166 24 214 55 194 176 62 129 228 86 109 123 181 55 225 201 171 32 238 61 227 206 19 31 163 46 78 2 29 233 140 111 61 94 195 205 173 169 248 247 170 195 39 64 93 156 124 186 179 175 131 119 117 75 236 106 164 7 177 12 43 16 8 144 147 147 195 177 99 199 240 251 253 78 42 247 217 103 159 1 48 108 216 48 199 148 186 47 60 237 50 183 238 109 134 97 56 105 98 188 2 127 42 250 165 148 114 204 38 246 111 4 156 252 50 106 41 99 115 125 236 56 28 198 246 40 34 150 230 230 193 209 2 249 201 175 76 110 191 37 122 44 94 15 108 220 31 98 229 143 111 160 185 237 82 42 219 183 134 190 106 227 36 164 200 176 180 214 187 149 226 89 247 87 26 141 231 134 210 153 248 215 244 110 141 138 169 219 188 254 175 253 217 69 227 185 211 45 157 163 18 63 224 221 16 167 191 103 55 244 75 151 206 111 117 186 58 217 215 232 151 91 107 77 73 73 9 111 190 249 38 91 183 110 101 214 172 89 52 53 53 81 89 89 73 78 78 14 147 38 77 162 161 161 193 249 108 188 200 201 182 237 184 109 87 3 251 10 50 95 182 88 108 253 48 76 249 132 12 14 126 218 65 205 177 14 166 140 78 227 137 162 44 170 255 221 78 83 200 118 34 40 165 20 167 206 69 163 172 226 177 233 142 105 245 165 209 213 38 17 214 117 93 195 50 246 66 18 197 84 205 243 7 159 82 176 48 193 21 231 182 218 171 227 132 231 105 99 243 24 250 212 47 105 63 84 207 249 215 255 28 251 251 90 61 63 225 224 193 196 99 67 131 189 113 187 155 49 6 114 23 66 235 33 56 179 54 222 30 158 87 19 214 160 245 95 174 139 8 43 158 97 77 156 24 93 199 182 99 199 14 118 237 218 5 192 248 241 227 41 43 43 187 166 38 148 200 49 91 253 184 12 95 219 121 129 255 54 91 172 152 119 131 243 222 27 255 12 177 97 95 235 101 139 69 211 46 166 143 111 215 182 81 60 54 221 73 57 45 91 95 55 227 36 184 48 172 93 207 169 208 244 149 246 50 208 203 122 54 214 158 128 175 90 46 46 190 139 29 83 180 25 30 99 157 27 225 111 255 173 42 116 114 118 209 50 80 189 116 7 205 253 17 254 219 239 192 127 251 29 92 120 103 35 86 243 249 24 186 182 43 93 149 183 37 164 15 149 45 3 122 233 114 227 131 16 248 94 116 251 106 19 152 205 189 116 177 244 58 215 39 251 42 252 114 199 122 222 173 43 106 154 56 113 34 147 38 77 138 25 53 221 125 247 221 172 90 181 202 169 79 117 167 180 180 212 49 182 129 92 198 16 143 119 15 132 120 247 64 236 172 124 195 190 86 54 236 187 84 104 255 244 203 8 115 94 62 123 93 70 194 130 171 26 22 88 168 21 6 250 81 5 99 186 55 110 58 168 175 20 93 77 219 241 172 114 253 36 175 182 141 21 202 208 143 210 67 55 180 103 39 233 247 20 208 222 80 135 245 245 215 49 162 43 166 141 172 172 118 255 4 177 229 89 129 199 234 165 75 115 21 100 141 135 214 15 193 252 58 150 61 76 83 227 183 68 220 26 75 91 91 27 217 217 217 41 25 184 150 150 22 2 129 64 220 133 155 93 81 84 119 67 235 138 170 186 167 129 93 219 101 145 142 101 245 89 179 234 73 56 28 78 170 95 217 217 217 168 240 245 241 168 221 5 46 164 124 156 6 242 225 244 255 55 156 51 57 237 37 157 137 109 31 232 105 90 125 80 190 235 57 207 187 61 39 67 162 145 193 137 210 41 153 134 109 28 160 159 186 26 85 254 157 109 123 146 214 213 13 165 153 24 170 223 186 40 93 174 190 95 233 90 119 253 250 245 218 48 12 30 124 240 65 178 178 178 146 26 180 214 214 86 54 111 222 204 224 193 131 41 44 44 28 208 20 166 165 165 133 202 202 74 198 140 25 67 81 81 145 171 153 89 93 93 173 255 84 63 134 11 97 187 223 107 165 174 6 166 13 153 126 197 163 55 239 72 233 56 217 182 205 130 5 11 196 181 82 105 88 0 197 43 181 215 131 94 18 43 61 236 70 189 82 186 124 231 98 239 201 158 105 136 219 84 230 211 31 22 123 149 97 47 137 149 30 118 115 170 122 148 46 31 181 173 58 101 186 186 254 33 47 30 107 73 204 244 176 91 127 129 114 117 215 150 164 116 1 189 118 237 90 26 27 27 83 82 239 233 186 243 151 138 255 6 37 25 50 51 51 41 40 40 232 122 240 217 245 127 47 83 85 85 69 109 109 109 82 207 36 94 143 231 245 214 91 111 165 162 162 34 153 115 35 196 51 172 46 166 174 212 25 74 219 83 12 165 130 54 122 172 66 159 85 168 122 173 244 246 54 191 231 212 251 191 142 93 55 73 182 246 210 56 103 106 6 218 154 2 42 168 97 44 112 22 168 215 74 109 247 102 116 156 26 249 214 251 87 69 87 31 154 147 1 198 20 32 8 140 5 125 22 173 234 65 109 39 148 118 74 253 224 173 164 117 5 65 72 129 97 201 196 19 4 225 155 130 33 167 64 16 4 49 44 65 16 4 49 44 65 16 196 176 4 65 16 196 176 4 65 16 196 176 4 65 16 195 18 4 65 16 195 18 4 65 16 195 18 4 65 12 75 16 4 65 12 75 16 4 65 12 75 16 4 49 44 65 16 4 49 44 65 16 4 49 44 65 16 196 176 4 65 16 196 176 4 65 16 196 176 4 65 16 195 18 4 65 16 195 18 4 65 16 195 18 4 65 12 75 16 4 65 12 75 16 4 65 12 75 16 4 49 44 65 16 4 49 44 65 16 4 49 44 65 16 196 176 4 65 16 196 176 4 65 16 195 18 4 65 16 195 18 4 65 72 45 255 27 0 135 184 3 145 171 121 197 166 0 0 0 0 73 69 78 68 174 66 96 130]
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> handlebars200Js [
	^ '/*!

 handlebars v2.0.0

Copyright (C) 2011-2014 by Yehuda Katz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

@license
*/
!function(a,b){"function"==typeof define&&define.amd?define([],b):"object"==typeof exports?module.exports=b():a.Handlebars=a.Handlebars||b()}(this,function(){var a=function(){"use strict";function a(a){this.string=a}var b;return a.prototype.toString=function(){return""+this.string},b=a}(),b=function(a){"use strict";function b(a){return i[a]}function c(a){for(var b=1;b<arguments.length;b++)for(var c in arguments[b])Object.prototype.hasOwnProperty.call(arguments[b],c)&&(a[c]=arguments[b][c]);return a}function d(a){return a instanceof h?a.toString():null==a?"":a?(a=""+a,k.test(a)?a.replace(j,b):a):a+""}function e(a){return a||0===a?n(a)&&0===a.length?!0:!1:!0}function f(a,b){return(a?a+".":"")+b}var g={},h=a,i={"&":"&amp;","<":"&lt;",">":"&gt;",''"'':"&quot;","''":"&#x27;","`":"&#x60;"},j=/[&<>"''`]/g,k=/[&<>"''`]/;g.extend=c;var l=Object.prototype.toString;g.toString=l;var m=function(a){return"function"==typeof a};m(/x/)&&(m=function(a){return"function"==typeof a&&"[object Function]"===l.call(a)});var m;g.isFunction=m;var n=Array.isArray||function(a){return a&&"object"==typeof a?"[object Array]"===l.call(a):!1};return g.isArray=n,g.escapeExpression=d,g.isEmpty=e,g.appendContextPath=f,g}(a),c=function(){"use strict";function a(a,b){var d;b&&b.firstLine&&(d=b.firstLine,a+=" - "+d+":"+b.firstColumn);for(var e=Error.prototype.constructor.call(this,a),f=0;f<c.length;f++)this[c[f]]=e[c[f]];d&&(this.lineNumber=d,this.column=b.firstColumn)}var b,c=["description","fileName","lineNumber","message","name","number","stack"];return a.prototype=new Error,b=a}(),d=function(a,b){"use strict";function c(a,b){this.helpers=a||{},this.partials=b||{},d(this)}function d(a){a.registerHelper("helperMissing",function(){if(1===arguments.length)return void 0;throw new g("Missing helper: ''"+arguments[arguments.length-1].name+"''")}),a.registerHelper("blockHelperMissing",function(b,c){var d=c.inverse,e=c.fn;if(b===!0)return e(this);if(b===!1||null==b)return d(this);if(k(b))return b.length>0?(c.ids&&(c.ids=[c.name]),a.helpers.each(b,c)):d(this);if(c.data&&c.ids){var g=q(c.data);g.contextPath=f.appendContextPath(c.data.contextPath,c.name),c={data:g}}return e(b,c)}),a.registerHelper("each",function(a,b){if(!b)throw new g("Must pass iterator to #each");var c,d,e=b.fn,h=b.inverse,i=0,j="";if(b.data&&b.ids&&(d=f.appendContextPath(b.data.contextPath,b.ids[0])+"."),l(a)&&(a=a.call(this)),b.data&&(c=q(b.data)),a&&"object"==typeof a)if(k(a))for(var m=a.length;m>i;i++)c&&(c.index=i,c.first=0===i,c.last=i===a.length-1,d&&(c.contextPath=d+i)),j+=e(a[i],{data:c});else for(var n in a)a.hasOwnProperty(n)&&(c&&(c.key=n,c.index=i,c.first=0===i,d&&(c.contextPath=d+n)),j+=e(a[n],{data:c}),i++);return 0===i&&(j=h(this)),j}),a.registerHelper("if",function(a,b){return l(a)&&(a=a.call(this)),!b.hash.includeZero&&!a||f.isEmpty(a)?b.inverse(this):b.fn(this)}),a.registerHelper("unless",function(b,c){return a.helpers["if"].call(this,b,{fn:c.inverse,inverse:c.fn,hash:c.hash})}),a.registerHelper("with",function(a,b){l(a)&&(a=a.call(this));var c=b.fn;if(f.isEmpty(a))return b.inverse(this);if(b.data&&b.ids){var d=q(b.data);d.contextPath=f.appendContextPath(b.data.contextPath,b.ids[0]),b={data:d}}return c(a,b)}),a.registerHelper("log",function(b,c){var d=c.data&&null!=c.data.level?parseInt(c.data.level,10):1;a.log(d,b)}),a.registerHelper("lookup",function(a,b){return a&&a[b]})}var e={},f=a,g=b,h="2.0.0";e.VERSION=h;var i=6;e.COMPILER_REVISION=i;var j={1:"<= 1.0.rc.2",2:"== 1.0.0-rc.3",3:"== 1.0.0-rc.4",4:"== 1.x.x",5:"== 2.0.0-alpha.x",6:">= 2.0.0-beta.1"};e.REVISION_CHANGES=j;var k=f.isArray,l=f.isFunction,m=f.toString,n="[object Object]";e.HandlebarsEnvironment=c,c.prototype={constructor:c,logger:o,log:p,registerHelper:function(a,b){if(m.call(a)===n){if(b)throw new g("Arg not supported with multiple helpers");f.extend(this.helpers,a)}else this.helpers[a]=b},unregisterHelper:function(a){delete this.helpers[a]},registerPartial:function(a,b){m.call(a)===n?f.extend(this.partials,a):this.partials[a]=b},unregisterPartial:function(a){delete this.partials[a]}};var o={methodMap:{0:"debug",1:"info",2:"warn",3:"error"},DEBUG:0,INFO:1,WARN:2,ERROR:3,level:3,log:function(a,b){if(o.level<=a){var c=o.methodMap[a];"undefined"!=typeof console&&console[c]&&console[c].call(console,b)}}};e.logger=o;var p=o.log;e.log=p;var q=function(a){var b=f.extend({},a);return b._parent=a,b};return e.createFrame=q,e}(b,c),e=function(a,b,c){"use strict";function d(a){var b=a&&a[0]||1,c=m;if(b!==c){if(c>b){var d=n[c],e=n[b];throw new l("Template was precompiled with an older version of Handlebars than the current runtime. Please update your precompiler to a newer version ("+d+") or downgrade your runtime to an older version ("+e+").")}throw new l("Template was precompiled with a newer version of Handlebars than the current runtime. Please update your runtime to a newer version ("+a[1]+").")}}function e(a,b){if(!b)throw new l("No environment passed to template");if(!a||!a.main)throw new l("Unknown template object: "+typeof a);b.VM.checkRevision(a.compiler);var c=function(c,d,e,f,g,h,i,j,m){g&&(f=k.extend({},f,g));var n=b.VM.invokePartial.call(this,c,e,f,h,i,j,m);if(null==n&&b.compile){var o={helpers:h,partials:i,data:j,depths:m};i[e]=b.compile(c,{data:void 0!==j,compat:a.compat},b),n=i[e](f,o)}if(null!=n){if(d){for(var p=n.split("\n"),q=0,r=p.length;r>q&&(p[q]||q+1!==r);q++)p[q]=d+p[q];n=p.join("\n")}return n}throw new l("The partial "+e+" could not be compiled when running in runtime-only mode")},d={lookup:function(a,b){for(var c=a.length,d=0;c>d;d++)if(a[d]&&null!=a[d][b])return a[d][b]},lambda:function(a,b){return"function"==typeof a?a.call(b):a},escapeExpression:k.escapeExpression,invokePartial:c,fn:function(b){return a[b]},programs:[],program:function(a,b,c){var d=this.programs[a],e=this.fn(a);return b||c?d=f(this,a,e,b,c):d||(d=this.programs[a]=f(this,a,e)),d},data:function(a,b){for(;a&&b--;)a=a._parent;return a},merge:function(a,b){var c=a||b;return a&&b&&a!==b&&(c=k.extend({},b,a)),c},noop:b.VM.noop,compilerInfo:a.compiler},e=function(b,c){c=c||{};var f=c.data;e._setup(c),!c.partial&&a.useData&&(f=i(b,f));var g;return a.useDepths&&(g=c.depths?[b].concat(c.depths):[b]),a.main.call(d,b,d.helpers,d.partials,f,g)};return e.isTop=!0,e._setup=function(c){c.partial?(d.helpers=c.helpers,d.partials=c.partials):(d.helpers=d.merge(c.helpers,b.helpers),a.usePartial&&(d.partials=d.merge(c.partials,b.partials)))},e._child=function(b,c,e){if(a.useDepths&&!e)throw new l("must pass parent depths");return f(d,b,a[b],c,e)},e}function f(a,b,c,d,e){var f=function(b,f){return f=f||{},c.call(a,b,a.helpers,a.partials,f.data||d,e&&[b].concat(e))};return f.program=b,f.depth=e?e.length:0,f}function g(a,b,c,d,e,f,g){var h={partial:!0,helpers:d,partials:e,data:f,depths:g};if(void 0===a)throw new l("The partial "+b+" could not be found");return a instanceof Function?a(c,h):void 0}function h(){return""}function i(a,b){return b&&"root"in b||(b=b?o(b):{},b.root=a),b}var j={},k=a,l=b,m=c.COMPILER_REVISION,n=c.REVISION_CHANGES,o=c.createFrame;return j.checkRevision=d,j.template=e,j.program=f,j.invokePartial=g,j.noop=h,j}(b,c,d),f=function(a,b,c,d,e){"use strict";var f,g=a,h=b,i=c,j=d,k=e,l=function(){var a=new g.HandlebarsEnvironment;return j.extend(a,g),a.SafeString=h,a.Exception=i,a.Utils=j,a.escapeExpression=j.escapeExpression,a.VM=k,a.template=function(b){return k.template(b,a)},a},m=l();return m.create=l,m["default"]=m,f=m}(d,a,c,b,e),g=function(a){"use strict";function b(a){a=a||{},this.firstLine=a.first_line,this.firstColumn=a.first_column,this.lastColumn=a.last_column,this.lastLine=a.last_line}var c,d=a,e={ProgramNode:function(a,c,d){b.call(this,d),this.type="program",this.statements=a,this.strip=c},MustacheNode:function(a,c,d,f,g){if(b.call(this,g),this.type="mustache",this.strip=f,null!=d&&d.charAt){var h=d.charAt(3)||d.charAt(2);this.escaped="{"!==h&&"&"!==h}else this.escaped=!!d;this.sexpr=a instanceof e.SexprNode?a:new e.SexprNode(a,c),this.id=this.sexpr.id,this.params=this.sexpr.params,this.hash=this.sexpr.hash,this.eligibleHelper=this.sexpr.eligibleHelper,this.isHelper=this.sexpr.isHelper},SexprNode:function(a,c,d){b.call(this,d),this.type="sexpr",this.hash=c;var e=this.id=a[0],f=this.params=a.slice(1);this.isHelper=!(!f.length&&!c),this.eligibleHelper=this.isHelper||e.isSimple},PartialNode:function(a,c,d,e,f){b.call(this,f),this.type="partial",this.partialName=a,this.context=c,this.hash=d,this.strip=e,this.strip.inlineStandalone=!0},BlockNode:function(a,c,d,e,f){b.call(this,f),this.type="block",this.mustache=a,this.program=c,this.inverse=d,this.strip=e,d&&!c&&(this.isInverse=!0)},RawBlockNode:function(a,c,f,g){if(b.call(this,g),a.sexpr.id.original!==f)throw new d(a.sexpr.id.original+" doesn''t match "+f,this);c=new e.ContentNode(c,g),this.type="block",this.mustache=a,this.program=new e.ProgramNode([c],{},g)},ContentNode:function(a,c){b.call(this,c),this.type="content",this.original=this.string=a},HashNode:function(a,c){b.call(this,c),this.type="hash",this.pairs=a},IdNode:function(a,c){b.call(this,c),this.type="ID";for(var e="",f=[],g=0,h="",i=0,j=a.length;j>i;i++){var k=a[i].part;if(e+=(a[i].separator||"")+k,".."===k||"."===k||"this"===k){if(f.length>0)throw new d("Invalid path: "+e,this);".."===k?(g++,h+="../"):this.isScoped=!0}else f.push(k)}this.original=e,this.parts=f,this.string=f.join("."),this.depth=g,this.idName=h+this.string,this.isSimple=1===a.length&&!this.isScoped&&0===g,this.stringModeValue=this.string},PartialNameNode:function(a,c){b.call(this,c),this.type="PARTIAL_NAME",this.name=a.original},DataNode:function(a,c){b.call(this,c),this.type="DATA",this.id=a,this.stringModeValue=a.stringModeValue,this.idName="@"+a.stringModeValue},StringNode:function(a,c){b.call(this,c),this.type="STRING",this.original=this.string=this.stringModeValue=a},NumberNode:function(a,c){b.call(this,c),this.type="NUMBER",this.original=this.number=a,this.stringModeValue=Number(a)},BooleanNode:function(a,c){b.call(this,c),this.type="BOOLEAN",this.bool=a,this.stringModeValue="true"===a},CommentNode:function(a,c){b.call(this,c),this.type="comment",this.comment=a,this.strip={inlineStandalone:!0}}};return c=e}(c),h=function(){"use strict";var a,b=function(){function a(){this.yy={}}var b={trace:function(){},yy:{},symbols_:{error:2,root:3,program:4,EOF:5,program_repetition0:6,statement:7,mustache:8,block:9,rawBlock:10,partial:11,CONTENT:12,COMMENT:13,openRawBlock:14,END_RAW_BLOCK:15,OPEN_RAW_BLOCK:16,sexpr:17,CLOSE_RAW_BLOCK:18,openBlock:19,block_option0:20,closeBlock:21,openInverse:22,block_option1:23,OPEN_BLOCK:24,CLOSE:25,OPEN_INVERSE:26,inverseAndProgram:27,INVERSE:28,OPEN_ENDBLOCK:29,path:30,OPEN:31,OPEN_UNESCAPED:32,CLOSE_UNESCAPED:33,OPEN_PARTIAL:34,partialName:35,param:36,partial_option0:37,partial_option1:38,sexpr_repetition0:39,sexpr_option0:40,dataName:41,STRING:42,NUMBER:43,BOOLEAN:44,OPEN_SEXPR:45,CLOSE_SEXPR:46,hash:47,hash_repetition_plus0:48,hashSegment:49,ID:50,EQUALS:51,DATA:52,pathSegments:53,SEP:54,$accept:0,$end:1},terminals_:{2:"error",5:"EOF",12:"CONTENT",13:"COMMENT",15:"END_RAW_BLOCK",16:"OPEN_RAW_BLOCK",18:"CLOSE_RAW_BLOCK",24:"OPEN_BLOCK",25:"CLOSE",26:"OPEN_INVERSE",28:"INVERSE",29:"OPEN_ENDBLOCK",31:"OPEN",32:"OPEN_UNESCAPED",33:"CLOSE_UNESCAPED",34:"OPEN_PARTIAL",42:"STRING",43:"NUMBER",44:"BOOLEAN",45:"OPEN_SEXPR",46:"CLOSE_SEXPR",50:"ID",51:"EQUALS",52:"DATA",54:"SEP"},productions_:[0,[3,2],[4,1],[7,1],[7,1],[7,1],[7,1],[7,1],[7,1],[10,3],[14,3],[9,4],[9,4],[19,3],[22,3],[27,2],[21,3],[8,3],[8,3],[11,5],[11,4],[17,3],[17,1],[36,1],[36,1],[36,1],[36,1],[36,1],[36,3],[47,1],[49,3],[35,1],[35,1],[35,1],[41,2],[30,1],[53,3],[53,1],[6,0],[6,2],[20,0],[20,1],[23,0],[23,1],[37,0],[37,1],[38,0],[38,1],[39,0],[39,2],[40,0],[40,1],[48,1],[48,2]],performAction:function(a,b,c,d,e,f){var g=f.length-1;switch(e){case 1:return d.prepareProgram(f[g-1].statements,!0),f[g-1];case 2:this.$=new d.ProgramNode(d.prepareProgram(f[g]),{},this._$);break;case 3:this.$=f[g];break;case 4:this.$=f[g];break;case 5:this.$=f[g];break;case 6:this.$=f[g];break;case 7:this.$=new d.ContentNode(f[g],this._$);break;case 8:this.$=new d.CommentNode(f[g],this._$);break;case 9:this.$=new d.RawBlockNode(f[g-2],f[g-1],f[g],this._$);break;case 10:this.$=new d.MustacheNode(f[g-1],null,"","",this._$);break;case 11:this.$=d.prepareBlock(f[g-3],f[g-2],f[g-1],f[g],!1,this._$);break;case 12:this.$=d.prepareBlock(f[g-3],f[g-2],f[g-1],f[g],!0,this._$);break;case 13:this.$=new d.MustacheNode(f[g-1],null,f[g-2],d.stripFlags(f[g-2],f[g]),this._$);break;case 14:this.$=new d.MustacheNode(f[g-1],null,f[g-2],d.stripFlags(f[g-2],f[g]),this._$);break;case 15:this.$={strip:d.stripFlags(f[g-1],f[g-1]),program:f[g]};break;case 16:this.$={path:f[g-1],strip:d.stripFlags(f[g-2],f[g])};break;case 17:this.$=new d.MustacheNode(f[g-1],null,f[g-2],d.stripFlags(f[g-2],f[g]),this._$);break;case 18:this.$=new d.MustacheNode(f[g-1],null,f[g-2],d.stripFlags(f[g-2],f[g]),this._$);break;case 19:this.$=new d.PartialNode(f[g-3],f[g-2],f[g-1],d.stripFlags(f[g-4],f[g]),this._$);break;case 20:this.$=new d.PartialNode(f[g-2],void 0,f[g-1],d.stripFlags(f[g-3],f[g]),this._$);break;case 21:this.$=new d.SexprNode([f[g-2]].concat(f[g-1]),f[g],this._$);break;case 22:this.$=new d.SexprNode([f[g]],null,this._$);break;case 23:this.$=f[g];break;case 24:this.$=new d.StringNode(f[g],this._$);break;case 25:this.$=new d.NumberNode(f[g],this._$);break;case 26:this.$=new d.BooleanNode(f[g],this._$);break;case 27:this.$=f[g];break;case 28:f[g-1].isHelper=!0,this.$=f[g-1];break;case 29:this.$=new d.HashNode(f[g],this._$);break;case 30:this.$=[f[g-2],f[g]];break;case 31:this.$=new d.PartialNameNode(f[g],this._$);break;case 32:this.$=new d.PartialNameNode(new d.StringNode(f[g],this._$),this._$);break;case 33:this.$=new d.PartialNameNode(new d.NumberNode(f[g],this._$));break;case 34:this.$=new d.DataNode(f[g],this._$);break;case 35:this.$=new d.IdNode(f[g],this._$);break;case 36:f[g-2].push({part:f[g],separator:f[g-1]}),this.$=f[g-2];break;case 37:this.$=[{part:f[g]}];break;case 38:this.$=[];break;case 39:f[g-1].push(f[g]);break;case 48:this.$=[];break;case 49:f[g-1].push(f[g]);break;case 52:this.$=[f[g]];break;case 53:f[g-1].push(f[g])}},table:[{3:1,4:2,5:[2,38],6:3,12:[2,38],13:[2,38],16:[2,38],24:[2,38],26:[2,38],31:[2,38],32:[2,38],34:[2,38]},{1:[3]},{5:[1,4]},{5:[2,2],7:5,8:6,9:7,10:8,11:9,12:[1,10],13:[1,11],14:16,16:[1,20],19:14,22:15,24:[1,18],26:[1,19],28:[2,2],29:[2,2],31:[1,12],32:[1,13],34:[1,17]},{1:[2,1]},{5:[2,39],12:[2,39],13:[2,39],16:[2,39],24:[2,39],26:[2,39],28:[2,39],29:[2,39],31:[2,39],32:[2,39],34:[2,39]},{5:[2,3],12:[2,3],13:[2,3],16:[2,3],24:[2,3],26:[2,3],28:[2,3],29:[2,3],31:[2,3],32:[2,3],34:[2,3]},{5:[2,4],12:[2,4],13:[2,4],16:[2,4],24:[2,4],26:[2,4],28:[2,4],29:[2,4],31:[2,4],32:[2,4],34:[2,4]},{5:[2,5],12:[2,5],13:[2,5],16:[2,5],24:[2,5],26:[2,5],28:[2,5],29:[2,5],31:[2,5],32:[2,5],34:[2,5]},{5:[2,6],12:[2,6],13:[2,6],16:[2,6],24:[2,6],26:[2,6],28:[2,6],29:[2,6],31:[2,6],32:[2,6],34:[2,6]},{5:[2,7],12:[2,7],13:[2,7],16:[2,7],24:[2,7],26:[2,7],28:[2,7],29:[2,7],31:[2,7],32:[2,7],34:[2,7]},{5:[2,8],12:[2,8],13:[2,8],16:[2,8],24:[2,8],26:[2,8],28:[2,8],29:[2,8],31:[2,8],32:[2,8],34:[2,8]},{17:21,30:22,41:23,50:[1,26],52:[1,25],53:24},{17:27,30:22,41:23,50:[1,26],52:[1,25],53:24},{4:28,6:3,12:[2,38],13:[2,38],16:[2,38],24:[2,38],26:[2,38],28:[2,38],29:[2,38],31:[2,38],32:[2,38],34:[2,38]},{4:29,6:3,12:[2,38],13:[2,38],16:[2,38],24:[2,38],26:[2,38],28:[2,38],29:[2,38],31:[2,38],32:[2,38],34:[2,38]},{12:[1,30]},{30:32,35:31,42:[1,33],43:[1,34],50:[1,26],53:24},{17:35,30:22,41:23,50:[1,26],52:[1,25],53:24},{17:36,30:22,41:23,50:[1,26],52:[1,25],53:24},{17:37,30:22,41:23,50:[1,26],52:[1,25],53:24},{25:[1,38]},{18:[2,48],25:[2,48],33:[2,48],39:39,42:[2,48],43:[2,48],44:[2,48],45:[2,48],46:[2,48],50:[2,48],52:[2,48]},{18:[2,22],25:[2,22],33:[2,22],46:[2,22]},{18:[2,35],25:[2,35],33:[2,35],42:[2,35],43:[2,35],44:[2,35],45:[2,35],46:[2,35],50:[2,35],52:[2,35],54:[1,40]},{30:41,50:[1,26],53:24},{18:[2,37],25:[2,37],33:[2,37],42:[2,37],43:[2,37],44:[2,37],45:[2,37],46:[2,37],50:[2,37],52:[2,37],54:[2,37]},{33:[1,42]},{20:43,27:44,28:[1,45],29:[2,40]},{23:46,27:47,28:[1,45],29:[2,42]},{15:[1,48]},{25:[2,46],30:51,36:49,38:50,41:55,42:[1,52],43:[1,53],44:[1,54],45:[1,56],47:57,48:58,49:60,50:[1,59],52:[1,25],53:24},{25:[2,31],42:[2,31],43:[2,31],44:[2,31],45:[2,31],50:[2,31],52:[2,31]},{25:[2,32],42:[2,32],43:[2,32],44:[2,32],45:[2,32],50:[2,32],52:[2,32]},{25:[2,33],42:[2,33],43:[2,33],44:[2,33],45:[2,33],50:[2,33],52:[2,33]},{25:[1,61]},{25:[1,62]},{18:[1,63]},{5:[2,17],12:[2,17],13:[2,17],16:[2,17],24:[2,17],26:[2,17],28:[2,17],29:[2,17],31:[2,17],32:[2,17],34:[2,17]},{18:[2,50],25:[2,50],30:51,33:[2,50],36:65,40:64,41:55,42:[1,52],43:[1,53],44:[1,54],45:[1,56],46:[2,50],47:66,48:58,49:60,50:[1,59],52:[1,25],53:24},{50:[1,67]},{18:[2,34],25:[2,34],33:[2,34],42:[2,34],43:[2,34],44:[2,34],45:[2,34],46:[2,34],50:[2,34],52:[2,34]},{5:[2,18],12:[2,18],13:[2,18],16:[2,18],24:[2,18],26:[2,18],28:[2,18],29:[2,18],31:[2,18],32:[2,18],34:[2,18]},{21:68,29:[1,69]},{29:[2,41]},{4:70,6:3,12:[2,38],13:[2,38],16:[2,38],24:[2,38],26:[2,38],29:[2,38],31:[2,38],32:[2,38],34:[2,38]},{21:71,29:[1,69]},{29:[2,43]},{5:[2,9],12:[2,9],13:[2,9],16:[2,9],24:[2,9],26:[2,9],28:[2,9],29:[2,9],31:[2,9],32:[2,9],34:[2,9]},{25:[2,44],37:72,47:73,48:58,49:60,50:[1,74]},{25:[1,75]},{18:[2,23],25:[2,23],33:[2,23],42:[2,23],43:[2,23],44:[2,23],45:[2,23],46:[2,23],50:[2,23],52:[2,23]},{18:[2,24],25:[2,24],33:[2,24],42:[2,24],43:[2,24],44:[2,24],45:[2,24],46:[2,24],50:[2,24],52:[2,24]},{18:[2,25],25:[2,25],33:[2,25],42:[2,25],43:[2,25],44:[2,25],45:[2,25],46:[2,25],50:[2,25],52:[2,25]},{18:[2,26],25:[2,26],33:[2,26],42:[2,26],43:[2,26],44:[2,26],45:[2,26],46:[2,26],50:[2,26],52:[2,26]},{18:[2,27],25:[2,27],33:[2,27],42:[2,27],43:[2,27],44:[2,27],45:[2,27],46:[2,27],50:[2,27],52:[2,27]},{17:76,30:22,41:23,50:[1,26],52:[1,25],53:24},{25:[2,47]},{18:[2,29],25:[2,29],33:[2,29],46:[2,29],49:77,50:[1,74]},{18:[2,37],25:[2,37],33:[2,37],42:[2,37],43:[2,37],44:[2,37],45:[2,37],46:[2,37],50:[2,37],51:[1,78],52:[2,37],54:[2,37]},{18:[2,52],25:[2,52],33:[2,52],46:[2,52],50:[2,52]},{12:[2,13],13:[2,13],16:[2,13],24:[2,13],26:[2,13],28:[2,13],29:[2,13],31:[2,13],32:[2,13],34:[2,13]},{12:[2,14],13:[2,14],16:[2,14],24:[2,14],26:[2,14],28:[2,14],29:[2,14],31:[2,14],32:[2,14],34:[2,14]},{12:[2,10]},{18:[2,21],25:[2,21],33:[2,21],46:[2,21]},{18:[2,49],25:[2,49],33:[2,49],42:[2,49],43:[2,49],44:[2,49],45:[2,49],46:[2,49],50:[2,49],52:[2,49]},{18:[2,51],25:[2,51],33:[2,51],46:[2,51]},{18:[2,36],25:[2,36],33:[2,36],42:[2,36],43:[2,36],44:[2,36],45:[2,36],46:[2,36],50:[2,36],52:[2,36],54:[2,36]},{5:[2,11],12:[2,11],13:[2,11],16:[2,11],24:[2,11],26:[2,11],28:[2,11],29:[2,11],31:[2,11],32:[2,11],34:[2,11]},{30:79,50:[1,26],53:24},{29:[2,15]},{5:[2,12],12:[2,12],13:[2,12],16:[2,12],24:[2,12],26:[2,12],28:[2,12],29:[2,12],31:[2,12],32:[2,12],34:[2,12]},{25:[1,80]},{25:[2,45]},{51:[1,78]},{5:[2,20],12:[2,20],13:[2,20],16:[2,20],24:[2,20],26:[2,20],28:[2,20],29:[2,20],31:[2,20],32:[2,20],34:[2,20]},{46:[1,81]},{18:[2,53],25:[2,53],33:[2,53],46:[2,53],50:[2,53]},{30:51,36:82,41:55,42:[1,52],43:[1,53],44:[1,54],45:[1,56],50:[1,26],52:[1,25],53:24},{25:[1,83]},{5:[2,19],12:[2,19],13:[2,19],16:[2,19],24:[2,19],26:[2,19],28:[2,19],29:[2,19],31:[2,19],32:[2,19],34:[2,19]},{18:[2,28],25:[2,28],33:[2,28],42:[2,28],43:[2,28],44:[2,28],45:[2,28],46:[2,28],50:[2,28],52:[2,28]},{18:[2,30],25:[2,30],33:[2,30],46:[2,30],50:[2,30]},{5:[2,16],12:[2,16],13:[2,16],16:[2,16],24:[2,16],26:[2,16],28:[2,16],29:[2,16],31:[2,16],32:[2,16],34:[2,16]}],defaultActions:{4:[2,1],44:[2,41],47:[2,43],57:[2,47],63:[2,10],70:[2,15],73:[2,45]},parseError:function(a){throw new Error(a)},parse:function(a){function b(){var a;return a=c.lexer.lex()||1,"number"!=typeof a&&(a=c.symbols_[a]||a),a}var c=this,d=[0],e=[null],f=[],g=this.table,h="",i=0,j=0,k=0;this.lexer.setInput(a),this.lexer.yy=this.yy,this.yy.lexer=this.lexer,this.yy.parser=this,"undefined"==typeof this.lexer.yylloc&&(this.lexer.yylloc={});var l=this.lexer.yylloc;f.push(l);var m=this.lexer.options&&this.lexer.options.ranges;"function"==typeof this.yy.parseError&&(this.parseError=this.yy.parseError);for(var n,o,p,q,r,s,t,u,v,w={};;){if(p=d[d.length-1],this.defaultActions[p]?q=this.defaultActions[p]:((null===n||"undefined"==typeof n)&&(n=b()),q=g[p]&&g[p][n]),"undefined"==typeof q||!q.length||!q[0]){var x="";if(!k){v=[];for(s in g[p])this.terminals_[s]&&s>2&&v.push("''"+this.terminals_[s]+"''");x=this.lexer.showPosition?"Parse error on line "+(i+1)+":\n"+this.lexer.showPosition()+"\nExpecting "+v.join(", ")+", got ''"+(this.terminals_[n]||n)+"''":"Parse error on line "+(i+1)+": Unexpected "+(1==n?"end of input":"''"+(this.terminals_[n]||n)+"''"),this.parseError(x,{text:this.lexer.match,token:this.terminals_[n]||n,line:this.lexer.yylineno,loc:l,expected:v})}}if(q[0]instanceof Array&&q.length>1)throw new Error("Parse Error: multiple actions possible at state: "+p+", token: "+n);switch(q[0]){case 1:d.push(n),e.push(this.lexer.yytext),f.push(this.lexer.yylloc),d.push(q[1]),n=null,o?(n=o,o=null):(j=this.lexer.yyleng,h=this.lexer.yytext,i=this.lexer.yylineno,l=this.lexer.yylloc,k>0&&k--);break;case 2:if(t=this.productions_[q[1]][1],w.$=e[e.length-t],w._$={first_line:f[f.length-(t||1)].first_line,last_line:f[f.length-1].last_line,first_column:f[f.length-(t||1)].first_column,last_column:f[f.length-1].last_column},m&&(w._$.range=[f[f.length-(t||1)].range[0],f[f.length-1].range[1]]),r=this.performAction.call(w,h,j,i,this.yy,q[1],e,f),"undefined"!=typeof r)return r;t&&(d=d.slice(0,-1*t*2),e=e.slice(0,-1*t),f=f.slice(0,-1*t)),d.push(this.productions_[q[1]][0]),e.push(w.$),f.push(w._$),u=g[d[d.length-2]][d[d.length-1]],d.push(u);break;case 3:return!0}}return!0}},c=function(){var a={EOF:1,parseError:function(a,b){if(!this.yy.parser)throw new Error(a);this.yy.parser.parseError(a,b)},setInput:function(a){return this._input=a,this._more=this._less=this.done=!1,this.yylineno=this.yyleng=0,this.yytext=this.matched=this.match="",this.conditionStack=["INITIAL"],this.yylloc={first_line:1,first_column:0,last_line:1,last_column:0},this.options.ranges&&(this.yylloc.range=[0,0]),this.offset=0,this},input:function(){var a=this._input[0];this.yytext+=a,this.yyleng++,this.offset++,this.match+=a,this.matched+=a;var b=a.match(/(?:\r\n?|\n).*/g);return b?(this.yylineno++,this.yylloc.last_line++):this.yylloc.last_column++,this.options.ranges&&this.yylloc.range[1]++,this._input=this._input.slice(1),a},unput:function(a){var b=a.length,c=a.split(/(?:\r\n?|\n)/g);this._input=a+this._input,this.yytext=this.yytext.substr(0,this.yytext.length-b-1),this.offset-=b;var d=this.match.split(/(?:\r\n?|\n)/g);this.match=this.match.substr(0,this.match.length-1),this.matched=this.matched.substr(0,this.matched.length-1),c.length-1&&(this.yylineno-=c.length-1);var e=this.yylloc.range;return this.yylloc={first_line:this.yylloc.first_line,last_line:this.yylineno+1,first_column:this.yylloc.first_column,last_column:c?(c.length===d.length?this.yylloc.first_column:0)+d[d.length-c.length].length-c[0].length:this.yylloc.first_column-b},this.options.ranges&&(this.yylloc.range=[e[0],e[0]+this.yyleng-b]),this},more:function(){return this._more=!0,this},less:function(a){this.unput(this.match.slice(a))},pastInput:function(){var a=this.matched.substr(0,this.matched.length-this.match.length);return(a.length>20?"...":"")+a.substr(-20).replace(/\n/g,"")},upcomingInput:function(){var a=this.match;return a.length<20&&(a+=this._input.substr(0,20-a.length)),(a.substr(0,20)+(a.length>20?"...":"")).replace(/\n/g,"")},showPosition:function(){var a=this.pastInput(),b=new Array(a.length+1).join("-");return a+this.upcomingInput()+"\n"+b+"^"},next:function(){if(this.done)return this.EOF;this._input||(this.done=!0);var a,b,c,d,e;this._more||(this.yytext="",this.match="");for(var f=this._currentRules(),g=0;g<f.length&&(c=this._input.match(this.rules[f[g]]),!c||b&&!(c[0].length>b[0].length)||(b=c,d=g,this.options.flex));g++);return b?(e=b[0].match(/(?:\r\n?|\n).*/g),e&&(this.yylineno+=e.length),this.yylloc={first_line:this.yylloc.last_line,last_line:this.yylineno+1,first_column:this.yylloc.last_column,last_column:e?e[e.length-1].length-e[e.length-1].match(/\r?\n?/)[0].length:this.yylloc.last_column+b[0].length},this.yytext+=b[0],this.match+=b[0],this.matches=b,this.yyleng=this.yytext.length,this.options.ranges&&(this.yylloc.range=[this.offset,this.offset+=this.yyleng]),this._more=!1,this._input=this._input.slice(b[0].length),this.matched+=b[0],a=this.performAction.call(this,this.yy,this,f[d],this.conditionStack[this.conditionStack.length-1]),this.done&&this._input&&(this.done=!1),a?a:void 0):""===this._input?this.EOF:this.parseError("Lexical error on line "+(this.yylineno+1)+". Unrecognized text.\n"+this.showPosition(),{text:"",token:null,line:this.yylineno})},lex:function(){var a=this.next();return"undefined"!=typeof a?a:this.lex()},begin:function(a){this.conditionStack.push(a)},popState:function(){return this.conditionStack.pop()},_currentRules:function(){return this.conditions[this.conditionStack[this.conditionStack.length-1]].rules},topState:function(){return this.conditionStack[this.conditionStack.length-2]},pushState:function(a){this.begin(a)}};return a.options={},a.performAction=function(a,b,c,d){function e(a,c){return b.yytext=b.yytext.substr(a,b.yyleng-c)}switch(c){case 0:if("\\\\"===b.yytext.slice(-2)?(e(0,1),this.begin("mu")):"\\"===b.yytext.slice(-1)?(e(0,1),this.begin("emu")):this.begin("mu"),b.yytext)return 12;break;case 1:return 12;case 2:return this.popState(),12;case 3:return b.yytext=b.yytext.substr(5,b.yyleng-9),this.popState(),15;case 4:return 12;case 5:return e(0,4),this.popState(),13;case 6:return 45;case 7:return 46;case 8:return 16;case 9:return this.popState(),this.begin("raw"),18;case 10:return 34;case 11:return 24;case 12:return 29;case 13:return this.popState(),28;case 14:return this.popState(),28;case 15:return 26;case 16:return 26;case 17:return 32;case 18:return 31;case 19:this.popState(),this.begin("com");break;case 20:return e(3,5),this.popState(),13;case 21:return 31;case 22:return 51;case 23:return 50;case 24:return 50;case 25:return 54;case 26:break;case 27:return this.popState(),33;case 28:return this.popState(),25;case 29:return b.yytext=e(1,2).replace(/\\"/g,''"''),42;case 30:return b.yytext=e(1,2).replace(/\\''/g,"''"),42;case 31:return 52;case 32:return 44;case 33:return 44;case 34:return 43;case 35:return 50;case 36:return b.yytext=e(1,2),50;case 37:return"INVALID";case 38:return 5}},a.rules=[/^(?:[^\x00]*?(?=(\{\{)))/,/^(?:[^\x00]+)/,/^(?:[^\x00]{2,}?(?=(\{\{|\\\{\{|\\\\\{\{|$)))/,/^(?:\{\{\{\{\/[^\s!"#%-,\.\/;->@\[-\^`\{-~]+(?=[=}\s\/.])\}\}\}\})/,/^(?:[^\x00]*?(?=(\{\{\{\{\/)))/,/^(?:[\s\S]*?--\}\})/,/^(?:\()/,/^(?:\))/,/^(?:\{\{\{\{)/,/^(?:\}\}\}\})/,/^(?:\{\{(~)?>)/,/^(?:\{\{(~)?#)/,/^(?:\{\{(~)?\/)/,/^(?:\{\{(~)?\^\s*(~)?\}\})/,/^(?:\{\{(~)?\s*else\s*(~)?\}\})/,/^(?:\{\{(~)?\^)/,/^(?:\{\{(~)?\s*else\b)/,/^(?:\{\{(~)?\{)/,/^(?:\{\{(~)?&)/,/^(?:\{\{!--)/,/^(?:\{\{![\s\S]*?\}\})/,/^(?:\{\{(~)?)/,/^(?:=)/,/^(?:\.\.)/,/^(?:\.(?=([=~}\s\/.)])))/,/^(?:[\/.])/,/^(?:\s+)/,/^(?:\}(~)?\}\})/,/^(?:(~)?\}\})/,/^(?:"(\\["]|[^"])*")/,/^(?:''(\\['']|[^''])*'')/,/^(?:@)/,/^(?:true(?=([~}\s)])))/,/^(?:false(?=([~}\s)])))/,/^(?:-?[0-9]+(?:\.[0-9]+)?(?=([~}\s)])))/,/^(?:([^\s!"#%-,\.\/;->@\[-\^`\{-~]+(?=([=~}\s\/.)]))))/,/^(?:\[[^\]]*\])/,/^(?:.)/,/^(?:$)/],a.conditions={mu:{rules:[6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38],inclusive:!1},emu:{rules:[2],inclusive:!1},com:{rules:[5],inclusive:!1},raw:{rules:[3,4],inclusive:!1},INITIAL:{rules:[0,1,38],inclusive:!0}},a}();return b.lexer=c,a.prototype=b,b.Parser=a,new a}();return a=b}(),i=function(a){"use strict";function b(a,b){return{left:"~"===a.charAt(2),right:"~"===b.charAt(b.length-3)}}function c(a,b,c,d,i,k){if(a.sexpr.id.original!==d.path.original)throw new j(a.sexpr.id.original+" doesn''t match "+d.path.original,a);var l=c&&c.program,m={left:a.strip.left,right:d.strip.right,openStandalone:f(b.statements),closeStandalone:e((l||b).statements)};if(a.strip.right&&g(b.statements,null,!0),l){var n=c.strip;n.left&&h(b.statements,null,!0),n.right&&g(l.statements,null,!0),d.strip.left&&h(l.statements,null,!0),e(b.statements)&&f(l.statements)&&(h(b.statements),g(l.statements))}else d.strip.left&&h(b.statements,null,!0);return i?new this.BlockNode(a,l,b,m,k):new this.BlockNode(a,b,l,m,k)}function d(a,b){for(var c=0,d=a.length;d>c;c++){var i=a[c],j=i.strip;if(j){var k=e(a,c,b,"partial"===i.type),l=f(a,c,b),m=j.openStandalone&&k,n=j.closeStandalone&&l,o=j.inlineStandalone&&k&&l;j.right&&g(a,c,!0),j.left&&h(a,c,!0),o&&(g(a,c),h(a,c)&&"partial"===i.type&&(i.indent=/([ \t]+$)/.exec(a[c-1].original)?RegExp.$1:"")),m&&(g((i.program||i.inverse).statements),h(a,c)),n&&(g(a,c),h((i.inverse||i.program).statements))}}return a}function e(a,b,c){void 0===b&&(b=a.length);var d=a[b-1],e=a[b-2];return d?"content"===d.type?(e||!c?/\r?\n\s*?$/:/(^|\r?\n)\s*?$/).test(d.original):void 0:c}function f(a,b,c){void 0===b&&(b=-1);var d=a[b+1],e=a[b+2];return d?"content"===d.type?(e||!c?/^\s*?\r?\n/:/^\s*?(\r?\n|$)/).test(d.original):void 0:c}function g(a,b,c){var d=a[null==b?0:b+1];if(d&&"content"===d.type&&(c||!d.rightStripped)){var e=d.string;d.string=d.string.replace(c?/^\s+/:/^[ \t]*\r?\n?/,""),d.rightStripped=d.string!==e}}function h(a,b,c){var d=a[null==b?a.length-1:b-1];if(d&&"content"===d.type&&(c||!d.leftStripped)){var e=d.string;return d.string=d.string.replace(c?/\s+$/:/[ \t]+$/,""),d.leftStripped=d.string!==e,d.leftStripped}}var i={},j=a;return i.stripFlags=b,i.prepareBlock=c,i.prepareProgram=d,i}(c),j=function(a,b,c,d){"use strict";function e(a){return a.constructor===h.ProgramNode?a:(g.yy=k,g.parse(a))}var f={},g=a,h=b,i=c,j=d.extend;f.parser=g;var k={};return j(k,i,h),f.parse=e,f}(h,g,i,b),k=function(a,b){"use strict";function c(){}function d(a,b,c){if(null==a||"string"!=typeof a&&a.constructor!==c.AST.ProgramNode)throw new h("You must pass a string or Handlebars AST to Handlebars.precompile. You passed "+a);b=b||{},"data"in b||(b.data=!0),b.compat&&(b.useDepths=!0);var d=c.parse(a),e=(new c.Compiler).compile(d,b);return(new c.JavaScriptCompiler).compile(e,b)}function e(a,b,c){function d(){var d=c.parse(a),e=(new c.Compiler).compile(d,b),f=(new c.JavaScriptCompiler).compile(e,b,void 0,!0);return c.template(f)}if(null==a||"string"!=typeof a&&a.constructor!==c.AST.ProgramNode)throw new h("You must pass a string or Handlebars AST to Handlebars.compile. You passed "+a);b=b||{},"data"in b||(b.data=!0),b.compat&&(b.useDepths=!0);var e,f=function(a,b){return e||(e=d()),e.call(this,a,b)};return f._setup=function(a){return e||(e=d()),e._setup(a)},f._child=function(a,b,c){return e||(e=d()),e._child(a,b,c)},f}function f(a,b){if(a===b)return!0;if(i(a)&&i(b)&&a.length===b.length){for(var c=0;c<a.length;c++)if(!f(a[c],b[c]))return!1;return!0}}var g={},h=a,i=b.isArray,j=[].slice;return g.Compiler=c,c.prototype={compiler:c,equals:function(a){var b=this.opcodes.length;if(a.opcodes.length!==b)return!1;for(var c=0;b>c;c++){var d=this.opcodes[c],e=a.opcodes[c];if(d.opcode!==e.opcode||!f(d.args,e.args))return!1}for(b=this.children.length,c=0;b>c;c++)if(!this.children[c].equals(a.children[c]))return!1;return!0},guid:0,compile:function(a,b){this.opcodes=[],this.children=[],this.depths={list:[]},this.options=b,this.stringParams=b.stringParams,this.trackIds=b.trackIds;var c=this.options.knownHelpers;if(this.options.knownHelpers={helperMissing:!0,blockHelperMissing:!0,each:!0,"if":!0,unless:!0,"with":!0,log:!0,lookup:!0},c)for(var d in c)this.options.knownHelpers[d]=c[d];return this.accept(a)},accept:function(a){return this[a.type](a)},program:function(a){for(var b=a.statements,c=0,d=b.length;d>c;c++)this.accept(b[c]);return this.isSimple=1===d,this.depths.list=this.depths.list.sort(function(a,b){return a-b}),this},compileProgram:function(a){var b,c=(new this.compiler).compile(a,this.options),d=this.guid++;
this.usePartial=this.usePartial||c.usePartial,this.children[d]=c;for(var e=0,f=c.depths.list.length;f>e;e++)b=c.depths.list[e],2>b||this.addDepth(b-1);return d},block:function(a){var b=a.mustache,c=a.program,d=a.inverse;c&&(c=this.compileProgram(c)),d&&(d=this.compileProgram(d));var e=b.sexpr,f=this.classifySexpr(e);"helper"===f?this.helperSexpr(e,c,d):"simple"===f?(this.simpleSexpr(e),this.opcode("pushProgram",c),this.opcode("pushProgram",d),this.opcode("emptyHash"),this.opcode("blockValue",e.id.original)):(this.ambiguousSexpr(e,c,d),this.opcode("pushProgram",c),this.opcode("pushProgram",d),this.opcode("emptyHash"),this.opcode("ambiguousBlockValue")),this.opcode("append")},hash:function(a){var b,c,d=a.pairs;for(this.opcode("pushHash"),b=0,c=d.length;c>b;b++)this.pushParam(d[b][1]);for(;b--;)this.opcode("assignToHash",d[b][0]);this.opcode("popHash")},partial:function(a){var b=a.partialName;this.usePartial=!0,a.hash?this.accept(a.hash):this.opcode("push","undefined"),a.context?this.accept(a.context):(this.opcode("getContext",0),this.opcode("pushContext")),this.opcode("invokePartial",b.name,a.indent||""),this.opcode("append")},content:function(a){a.string&&this.opcode("appendContent",a.string)},mustache:function(a){this.sexpr(a.sexpr),a.escaped&&!this.options.noEscape?this.opcode("appendEscaped"):this.opcode("append")},ambiguousSexpr:function(a,b,c){var d=a.id,e=d.parts[0],f=null!=b||null!=c;this.opcode("getContext",d.depth),this.opcode("pushProgram",b),this.opcode("pushProgram",c),this.ID(d),this.opcode("invokeAmbiguous",e,f)},simpleSexpr:function(a){var b=a.id;"DATA"===b.type?this.DATA(b):b.parts.length?this.ID(b):(this.addDepth(b.depth),this.opcode("getContext",b.depth),this.opcode("pushContext")),this.opcode("resolvePossibleLambda")},helperSexpr:function(a,b,c){var d=this.setupFullMustacheParams(a,b,c),e=a.id,f=e.parts[0];if(this.options.knownHelpers[f])this.opcode("invokeKnownHelper",d.length,f);else{if(this.options.knownHelpersOnly)throw new h("You specified knownHelpersOnly, but used the unknown helper "+f,a);e.falsy=!0,this.ID(e),this.opcode("invokeHelper",d.length,e.original,e.isSimple)}},sexpr:function(a){var b=this.classifySexpr(a);"simple"===b?this.simpleSexpr(a):"helper"===b?this.helperSexpr(a):this.ambiguousSexpr(a)},ID:function(a){this.addDepth(a.depth),this.opcode("getContext",a.depth);var b=a.parts[0];b?this.opcode("lookupOnContext",a.parts,a.falsy,a.isScoped):this.opcode("pushContext")},DATA:function(a){this.options.data=!0,this.opcode("lookupData",a.id.depth,a.id.parts)},STRING:function(a){this.opcode("pushString",a.string)},NUMBER:function(a){this.opcode("pushLiteral",a.number)},BOOLEAN:function(a){this.opcode("pushLiteral",a.bool)},comment:function(){},opcode:function(a){this.opcodes.push({opcode:a,args:j.call(arguments,1)})},addDepth:function(a){0!==a&&(this.depths[a]||(this.depths[a]=!0,this.depths.list.push(a)))},classifySexpr:function(a){var b=a.isHelper,c=a.eligibleHelper,d=this.options;if(c&&!b){var e=a.id.parts[0];d.knownHelpers[e]?b=!0:d.knownHelpersOnly&&(c=!1)}return b?"helper":c?"ambiguous":"simple"},pushParams:function(a){for(var b=0,c=a.length;c>b;b++)this.pushParam(a[b])},pushParam:function(a){this.stringParams?(a.depth&&this.addDepth(a.depth),this.opcode("getContext",a.depth||0),this.opcode("pushStringParam",a.stringModeValue,a.type),"sexpr"===a.type&&this.sexpr(a)):(this.trackIds&&this.opcode("pushId",a.type,a.idName||a.stringModeValue),this.accept(a))},setupFullMustacheParams:function(a,b,c){var d=a.params;return this.pushParams(d),this.opcode("pushProgram",b),this.opcode("pushProgram",c),a.hash?this.hash(a.hash):this.opcode("emptyHash"),d}},g.precompile=d,g.compile=e,g}(c,b),l=function(a,b){"use strict";function c(a){this.value=a}function d(){}var e,f=a.COMPILER_REVISION,g=a.REVISION_CHANGES,h=b;d.prototype={nameLookup:function(a,b){return d.isValidJavaScriptVariableName(b)?a+"."+b:a+"[''"+b+"'']"},depthedLookup:function(a){return this.aliases.lookup="this.lookup",''lookup(depths, "''+a+''")''},compilerInfo:function(){var a=f,b=g[a];return[a,b]},appendToBuffer:function(a){return this.environment.isSimple?"return "+a+";":{appendToBuffer:!0,content:a,toString:function(){return"buffer += "+a+";"}}},initializeBuffer:function(){return this.quotedString("")},namespace:"Handlebars",compile:function(a,b,c,d){this.environment=a,this.options=b,this.stringParams=this.options.stringParams,this.trackIds=this.options.trackIds,this.precompile=!d,this.name=this.environment.name,this.isChild=!!c,this.context=c||{programs:[],environments:[]},this.preamble(),this.stackSlot=0,this.stackVars=[],this.aliases={},this.registers={list:[]},this.hashes=[],this.compileStack=[],this.inlineStack=[],this.compileChildren(a,b),this.useDepths=this.useDepths||a.depths.list.length||this.options.compat;var e,f,g,i=a.opcodes;for(f=0,g=i.length;g>f;f++)e=i[f],this[e.opcode].apply(this,e.args);if(this.pushSource(""),this.stackSlot||this.inlineStack.length||this.compileStack.length)throw new h("Compile completed with content left on stack");var j=this.createFunctionContext(d);if(this.isChild)return j;var k={compiler:this.compilerInfo(),main:j},l=this.context.programs;for(f=0,g=l.length;g>f;f++)l[f]&&(k[f]=l[f]);return this.environment.usePartial&&(k.usePartial=!0),this.options.data&&(k.useData=!0),this.useDepths&&(k.useDepths=!0),this.options.compat&&(k.compat=!0),d||(k.compiler=JSON.stringify(k.compiler),k=this.objectLiteral(k)),k},preamble:function(){this.lastContext=0,this.source=[]},createFunctionContext:function(a){var b="",c=this.stackVars.concat(this.registers.list);c.length>0&&(b+=", "+c.join(", "));for(var d in this.aliases)this.aliases.hasOwnProperty(d)&&(b+=", "+d+"="+this.aliases[d]);var e=["depth0","helpers","partials","data"];this.useDepths&&e.push("depths");var f=this.mergeSource(b);return a?(e.push(f),Function.apply(this,e)):"function("+e.join(",")+") {\n  "+f+"}"},mergeSource:function(a){for(var b,c,d="",e=!this.forceBuffer,f=0,g=this.source.length;g>f;f++){var h=this.source[f];h.appendToBuffer?b=b?b+"\n    + "+h.content:h.content:(b&&(d?d+="buffer += "+b+";\n  ":(c=!0,d=b+";\n  "),b=void 0),d+=h+"\n  ",this.environment.isSimple||(e=!1))}return e?(b||!d)&&(d+="return "+(b||''""'')+";\n"):(a+=", buffer = "+(c?"":this.initializeBuffer()),d+=b?"return buffer + "+b+";\n":"return buffer;\n"),a&&(d="var "+a.substring(2)+(c?"":";\n  ")+d),d},blockValue:function(a){this.aliases.blockHelperMissing="helpers.blockHelperMissing";var b=[this.contextName(0)];this.setupParams(a,0,b);var c=this.popStack();b.splice(1,0,c),this.push("blockHelperMissing.call("+b.join(", ")+")")},ambiguousBlockValue:function(){this.aliases.blockHelperMissing="helpers.blockHelperMissing";var a=[this.contextName(0)];this.setupParams("",0,a,!0),this.flushInline();var b=this.topStack();a.splice(1,0,b),this.pushSource("if (!"+this.lastHelper+") { "+b+" = blockHelperMissing.call("+a.join(", ")+"); }")},appendContent:function(a){this.pendingContent&&(a=this.pendingContent+a),this.pendingContent=a},append:function(){this.flushInline();var a=this.popStack();this.pushSource("if ("+a+" != null) { "+this.appendToBuffer(a)+" }"),this.environment.isSimple&&this.pushSource("else { "+this.appendToBuffer("''''")+" }")},appendEscaped:function(){this.aliases.escapeExpression="this.escapeExpression",this.pushSource(this.appendToBuffer("escapeExpression("+this.popStack()+")"))},getContext:function(a){this.lastContext=a},pushContext:function(){this.pushStackLiteral(this.contextName(this.lastContext))},lookupOnContext:function(a,b,c){var d=0,e=a.length;for(c||!this.options.compat||this.lastContext?this.pushContext():this.push(this.depthedLookup(a[d++]));e>d;d++)this.replaceStack(function(c){var e=this.nameLookup(c,a[d],"context");return b?" && "+e:" != null ? "+e+" : "+c})},lookupData:function(a,b){a?this.pushStackLiteral("this.data(data, "+a+")"):this.pushStackLiteral("data");for(var c=b.length,d=0;c>d;d++)this.replaceStack(function(a){return" && "+this.nameLookup(a,b[d],"data")})},resolvePossibleLambda:function(){this.aliases.lambda="this.lambda",this.push("lambda("+this.popStack()+", "+this.contextName(0)+")")},pushStringParam:function(a,b){this.pushContext(),this.pushString(b),"sexpr"!==b&&("string"==typeof a?this.pushString(a):this.pushStackLiteral(a))},emptyHash:function(){this.pushStackLiteral("{}"),this.trackIds&&this.push("{}"),this.stringParams&&(this.push("{}"),this.push("{}"))},pushHash:function(){this.hash&&this.hashes.push(this.hash),this.hash={values:[],types:[],contexts:[],ids:[]}},popHash:function(){var a=this.hash;this.hash=this.hashes.pop(),this.trackIds&&this.push("{"+a.ids.join(",")+"}"),this.stringParams&&(this.push("{"+a.contexts.join(",")+"}"),this.push("{"+a.types.join(",")+"}")),this.push("{\n    "+a.values.join(",\n    ")+"\n  }")},pushString:function(a){this.pushStackLiteral(this.quotedString(a))},push:function(a){return this.inlineStack.push(a),a},pushLiteral:function(a){this.pushStackLiteral(a)},pushProgram:function(a){null!=a?this.pushStackLiteral(this.programExpression(a)):this.pushStackLiteral(null)},invokeHelper:function(a,b,c){this.aliases.helperMissing="helpers.helperMissing";var d=this.popStack(),e=this.setupHelper(a,b),f=(c?e.name+" || ":"")+d+" || helperMissing";this.push("(("+f+").call("+e.callParams+"))")},invokeKnownHelper:function(a,b){var c=this.setupHelper(a,b);this.push(c.name+".call("+c.callParams+")")},invokeAmbiguous:function(a,b){this.aliases.functionType=''"function"'',this.aliases.helperMissing="helpers.helperMissing",this.useRegister("helper");var c=this.popStack();this.emptyHash();var d=this.setupHelper(0,a,b),e=this.lastHelper=this.nameLookup("helpers",a,"helper");this.push("((helper = (helper = "+e+" || "+c+") != null ? helper : helperMissing"+(d.paramsInit?"),("+d.paramsInit:"")+"),(typeof helper === functionType ? helper.call("+d.callParams+") : helper))")},invokePartial:function(a,b){var c=[this.nameLookup("partials",a,"partial"),"''"+b+"''","''"+a+"''",this.popStack(),this.popStack(),"helpers","partials"];this.options.data?c.push("data"):this.options.compat&&c.push("undefined"),this.options.compat&&c.push("depths"),this.push("this.invokePartial("+c.join(", ")+")")},assignToHash:function(a){var b,c,d,e=this.popStack();this.trackIds&&(d=this.popStack()),this.stringParams&&(c=this.popStack(),b=this.popStack());var f=this.hash;b&&f.contexts.push("''"+a+"'': "+b),c&&f.types.push("''"+a+"'': "+c),d&&f.ids.push("''"+a+"'': "+d),f.values.push("''"+a+"'': ("+e+")")},pushId:function(a,b){"ID"===a||"DATA"===a?this.pushString(b):"sexpr"===a?this.pushStackLiteral("true"):this.pushStackLiteral("null")},compiler:d,compileChildren:function(a,b){for(var c,d,e=a.children,f=0,g=e.length;g>f;f++){c=e[f],d=new this.compiler;var h=this.matchExistingProgram(c);null==h?(this.context.programs.push(""),h=this.context.programs.length,c.index=h,c.name="program"+h,this.context.programs[h]=d.compile(c,b,this.context,!this.precompile),this.context.environments[h]=c,this.useDepths=this.useDepths||d.useDepths):(c.index=h,c.name="program"+h)}},matchExistingProgram:function(a){for(var b=0,c=this.context.environments.length;c>b;b++){var d=this.context.environments[b];if(d&&d.equals(a))return b}},programExpression:function(a){var b=this.environment.children[a],c=(b.depths.list,this.useDepths),d=[b.index,"data"];return c&&d.push("depths"),"this.program("+d.join(", ")+")"},useRegister:function(a){this.registers[a]||(this.registers[a]=!0,this.registers.list.push(a))},pushStackLiteral:function(a){return this.push(new c(a))},pushSource:function(a){this.pendingContent&&(this.source.push(this.appendToBuffer(this.quotedString(this.pendingContent))),this.pendingContent=void 0),a&&this.source.push(a)},pushStack:function(a){this.flushInline();var b=this.incrStack();return this.pushSource(b+" = "+a+";"),this.compileStack.push(b),b},replaceStack:function(a){{var b,d,e,f="";this.isInline()}if(!this.isInline())throw new h("replaceStack on non-inline");var g=this.popStack(!0);if(g instanceof c)f=b=g.value,e=!0;else{d=!this.stackSlot;var i=d?this.incrStack():this.topStackName();f="("+this.push(i)+" = "+g+")",b=this.topStack()}var j=a.call(this,b);e||this.popStack(),d&&this.stackSlot--,this.push("("+f+j+")")},incrStack:function(){return this.stackSlot++,this.stackSlot>this.stackVars.length&&this.stackVars.push("stack"+this.stackSlot),this.topStackName()},topStackName:function(){return"stack"+this.stackSlot},flushInline:function(){var a=this.inlineStack;if(a.length){this.inlineStack=[];for(var b=0,d=a.length;d>b;b++){var e=a[b];e instanceof c?this.compileStack.push(e):this.pushStack(e)}}},isInline:function(){return this.inlineStack.length},popStack:function(a){var b=this.isInline(),d=(b?this.inlineStack:this.compileStack).pop();if(!a&&d instanceof c)return d.value;if(!b){if(!this.stackSlot)throw new h("Invalid stack pop");this.stackSlot--}return d},topStack:function(){var a=this.isInline()?this.inlineStack:this.compileStack,b=a[a.length-1];return b instanceof c?b.value:b},contextName:function(a){return this.useDepths&&a?"depths["+a+"]":"depth"+a},quotedString:function(a){return''"''+a.replace(/\\/g,"\\\\").replace(/"/g,''\\"'').replace(/\n/g,"\\n").replace(/\r/g,"\\r").replace(/\u2028/g,"\\u2028").replace(/\u2029/g,"\\u2029")+''"''},objectLiteral:function(a){var b=[];for(var c in a)a.hasOwnProperty(c)&&b.push(this.quotedString(c)+":"+a[c]);return"{"+b.join(",")+"}"},setupHelper:function(a,b,c){var d=[],e=this.setupParams(b,a,d,c),f=this.nameLookup("helpers",b,"helper");return{params:d,paramsInit:e,name:f,callParams:[this.contextName(0)].concat(d).join(", ")}},setupOptions:function(a,b,c){var d,e,f,g={},h=[],i=[],j=[];g.name=this.quotedString(a),g.hash=this.popStack(),this.trackIds&&(g.hashIds=this.popStack()),this.stringParams&&(g.hashTypes=this.popStack(),g.hashContexts=this.popStack()),e=this.popStack(),f=this.popStack(),(f||e)&&(f||(f="this.noop"),e||(e="this.noop"),g.fn=f,g.inverse=e);for(var k=b;k--;)d=this.popStack(),c[k]=d,this.trackIds&&(j[k]=this.popStack()),this.stringParams&&(i[k]=this.popStack(),h[k]=this.popStack());return this.trackIds&&(g.ids="["+j.join(",")+"]"),this.stringParams&&(g.types="["+i.join(",")+"]",g.contexts="["+h.join(",")+"]"),this.options.data&&(g.data="data"),g},setupParams:function(a,b,c,d){var e=this.objectLiteral(this.setupOptions(a,b,c));return d?(this.useRegister("options"),c.push("options"),"options="+e):(c.push(e),"")}};for(var i="break else new var case finally return void catch for switch while continue function this with default if throw delete in try do instanceof typeof abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws const goto private transient debugger implements protected volatile double import public let yield".split(" "),j=d.RESERVED_WORDS={},k=0,l=i.length;l>k;k++)j[i[k]]=!0;return d.isValidJavaScriptVariableName=function(a){return!d.RESERVED_WORDS[a]&&/^[a-zA-Z_$][0-9a-zA-Z_$]*$/.test(a)},e=d}(d,c),m=function(a,b,c,d,e){"use strict";var f,g=a,h=b,i=c.parser,j=c.parse,k=d.Compiler,l=d.compile,m=d.precompile,n=e,o=g.create,p=function(){var a=o();return a.compile=function(b,c){return l(b,c,a)},a.precompile=function(b,c){return m(b,c,a)},a.AST=h,a.Compiler=k,a.JavaScriptCompiler=n,a.Parser=i,a.parse=j,a};return g=p(),g.create=p,g["default"]=g,f=g}(f,g,j,k,l);return m});'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> highlight73packJs [
	^ 'var hljs=new function(){function l(o){return o.replace(/&/gm,"&amp;").replace(/</gm,"&lt;").replace(/>/gm,"&gt;")}function b(p){for(var o=p.firstChild;o;o=o.nextSibling){if(o.nodeName=="CODE"){return o}if(!(o.nodeType==3&&o.nodeValue.match(/\s+/))){break}}}function h(p,o){return Array.prototype.map.call(p.childNodes,function(q){if(q.nodeType==3){return o?q.nodeValue.replace(/\n/g,""):q.nodeValue}if(q.nodeName=="BR"){return"\n"}return h(q,o)}).join("")}function a(q){var p=(q.className+" "+q.parentNode.className).split(/\s+/);p=p.map(function(r){return r.replace(/^language-/,"")});for(var o=0;o<p.length;o++){if(e[p[o]]||p[o]=="no-highlight"){return p[o]}}}function c(q){var o=[];(function p(r,s){for(var t=r.firstChild;t;t=t.nextSibling){if(t.nodeType==3){s+=t.nodeValue.length}else{if(t.nodeName=="BR"){s+=1}else{if(t.nodeType==1){o.push({event:"start",offset:s,node:t});s=p(t,s);o.push({event:"stop",offset:s,node:t})}}}}return s})(q,0);return o}function j(x,v,w){var p=0;var y="";var r=[];function t(){if(x.length&&v.length){if(x[0].offset!=v[0].offset){return(x[0].offset<v[0].offset)?x:v}else{return v[0].event=="start"?x:v}}else{return x.length?x:v}}function s(A){function z(B){return" "+B.nodeName+''="''+l(B.value)+''"''}return"<"+A.nodeName+Array.prototype.map.call(A.attributes,z).join("")+">"}while(x.length||v.length){var u=t().splice(0,1)[0];y+=l(w.substr(p,u.offset-p));p=u.offset;if(u.event=="start"){y+=s(u.node);r.push(u.node)}else{if(u.event=="stop"){var o,q=r.length;do{q--;o=r[q];y+=("</"+o.nodeName.toLowerCase()+">")}while(o!=u.node);r.splice(q,1);while(q<r.length){y+=s(r[q]);q++}}}}return y+l(w.substr(p))}function f(q){function o(s,r){return RegExp(s,"m"+(q.cI?"i":"")+(r?"g":""))}function p(y,w){if(y.compiled){return}y.compiled=true;var s=[];if(y.k){var r={};function z(A,t){t.split(" ").forEach(function(B){var C=B.split("|");r[C[0]]=[A,C[1]?Number(C[1]):1];s.push(C[0])})}y.lR=o(y.l||hljs.IR,true);if(typeof y.k=="string"){z("keyword",y.k)}else{for(var x in y.k){if(!y.k.hasOwnProperty(x)){continue}z(x,y.k[x])}}y.k=r}if(w){if(y.bWK){y.b="\\b("+s.join("|")+")\\s"}y.bR=o(y.b?y.b:"\\B|\\b");if(!y.e&&!y.eW){y.e="\\B|\\b"}if(y.e){y.eR=o(y.e)}y.tE=y.e||"";if(y.eW&&w.tE){y.tE+=(y.e?"|":"")+w.tE}}if(y.i){y.iR=o(y.i)}if(y.r===undefined){y.r=1}if(!y.c){y.c=[]}for(var v=0;v<y.c.length;v++){if(y.c[v]=="self"){y.c[v]=y}p(y.c[v],y)}if(y.starts){p(y.starts,w)}var u=[];for(var v=0;v<y.c.length;v++){u.push(y.c[v].b)}if(y.tE){u.push(y.tE)}if(y.i){u.push(y.i)}y.t=u.length?o(u.join("|"),true):{exec:function(t){return null}}}p(q)}function d(D,E){function o(r,M){for(var L=0;L<M.c.length;L++){var K=M.c[L].bR.exec(r);if(K&&K.index==0){return M.c[L]}}}function s(K,r){if(K.e&&K.eR.test(r)){return K}if(K.eW){return s(K.parent,r)}}function t(r,K){return K.i&&K.iR.test(r)}function y(L,r){var K=F.cI?r[0].toLowerCase():r[0];return L.k.hasOwnProperty(K)&&L.k[K]}function G(){var K=l(w);if(!A.k){return K}var r="";var N=0;A.lR.lastIndex=0;var L=A.lR.exec(K);while(L){r+=K.substr(N,L.index-N);var M=y(A,L);if(M){v+=M[1];r+=''<span class="''+M[0]+''">''+L[0]+"</span>"}else{r+=L[0]}N=A.lR.lastIndex;L=A.lR.exec(K)}return r+K.substr(N)}function z(){if(A.sL&&!e[A.sL]){return l(w)}var r=A.sL?d(A.sL,w):g(w);if(A.r>0){v+=r.keyword_count;B+=r.r}return''<span class="''+r.language+''">''+r.value+"</span>"}function J(){return A.sL!==undefined?z():G()}function I(L,r){var K=L.cN?''<span class="''+L.cN+''">'':"";if(L.rB){x+=K;w=""}else{if(L.eB){x+=l(r)+K;w=""}else{x+=K;w=r}}A=Object.create(L,{parent:{value:A}});B+=L.r}function C(K,r){w+=K;if(r===undefined){x+=J();return 0}var L=o(r,A);if(L){x+=J();I(L,r);return L.rB?0:r.length}var M=s(A,r);if(M){if(!(M.rE||M.eE)){w+=r}x+=J();do{if(A.cN){x+="</span>"}A=A.parent}while(A!=M.parent);if(M.eE){x+=l(r)}w="";if(M.starts){I(M.starts,"")}return M.rE?0:r.length}if(t(r,A)){throw"Illegal"}w+=r;return r.length||1}var F=e[D];f(F);var A=F;var w="";var B=0;var v=0;var x="";try{var u,q,p=0;while(true){A.t.lastIndex=p;u=A.t.exec(E);if(!u){break}q=C(E.substr(p,u.index-p),u[0]);p=u.index+q}C(E.substr(p));return{r:B,keyword_count:v,value:x,language:D}}catch(H){if(H=="Illegal"){return{r:0,keyword_count:0,value:l(E)}}else{throw H}}}function g(s){var o={keyword_count:0,r:0,value:l(s)};var q=o;for(var p in e){if(!e.hasOwnProperty(p)){continue}var r=d(p,s);r.language=p;if(r.keyword_count+r.r>q.keyword_count+q.r){q=r}if(r.keyword_count+r.r>o.keyword_count+o.r){q=o;o=r}}if(q.language){o.second_best=q}return o}function i(q,p,o){if(p){q=q.replace(/^((<[^>]+>|\t)+)/gm,function(r,v,u,t){return v.replace(/\t/g,p)})}if(o){q=q.replace(/\n/g,"<br>")}return q}function m(r,u,p){var v=h(r,p);var t=a(r);if(t=="no-highlight"){return}var w=t?d(t,v):g(v);t=w.language;var o=c(r);if(o.length){var q=document.createElement("pre");q.innerHTML=w.value;w.value=j(o,c(q),v)}w.value=i(w.value,u,p);var s=r.className;if(!s.match("(\\s|^)(language-)?"+t+"(\\s|$)")){s=s?(s+" "+t):t}r.innerHTML=w.value;r.className=s;r.result={language:t,kw:w.keyword_count,re:w.r};if(w.second_best){r.second_best={language:w.second_best.language,kw:w.second_best.keyword_count,re:w.second_best.r}}}function n(){if(n.called){return}n.called=true;Array.prototype.map.call(document.getElementsByTagName("pre"),b).filter(Boolean).forEach(function(o){m(o,hljs.tabReplace)})}function k(){window.addEventListener("DOMContentLoaded",n,false);window.addEventListener("load",n,false)}var e={};this.LANGUAGES=e;this.highlight=d;this.highlightAuto=g;this.fixMarkup=i;this.highlightBlock=m;this.initHighlighting=n;this.initHighlightingOnLoad=k;this.IR="[a-zA-Z][a-zA-Z0-9_]*";this.UIR="[a-zA-Z_][a-zA-Z0-9_]*";this.NR="\\b\\d+(\\.\\d+)?";this.CNR="(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)";this.BNR="\\b(0b[01]+)";this.RSR="!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|\\.|-|-=|/|/=|:|;|<|<<|<<=|<=|=|==|===|>|>=|>>|>>=|>>>|>>>=|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~";this.BE={b:"\\\\[\\s\\S]",r:0};this.ASM={cN:"string",b:"''",e:"''",i:"\\n",c:[this.BE],r:0};this.QSM={cN:"string",b:''"'',e:''"'',i:"\\n",c:[this.BE],r:0};this.CLCM={cN:"comment",b:"//",e:"$"};this.CBLCLM={cN:"comment",b:"/\\*",e:"\\*/"};this.HCM={cN:"comment",b:"#",e:"$"};this.NM={cN:"number",b:this.NR,r:0};this.CNM={cN:"number",b:this.CNR,r:0};this.BNM={cN:"number",b:this.BNR,r:0};this.inherit=function(q,r){var o={};for(var p in q){o[p]=q[p]}if(r){for(var p in r){o[p]=r[p]}}return o}}();hljs.LANGUAGES.xml=function(a){var c="[A-Za-z0-9\\._:-]+";var b={eW:true,c:[{cN:"attribute",b:c,r:0},{b:''="'',rB:true,e:''"'',c:[{cN:"value",b:''"'',eW:true}]},{b:"=''",rB:true,e:"''",c:[{cN:"value",b:"''",eW:true}]},{b:"=",c:[{cN:"value",b:"[^\\s/>]+"}]}]};return{cI:true,c:[{cN:"pi",b:"<\\?",e:"\\?>",r:10},{cN:"doctype",b:"<!DOCTYPE",e:">",r:10,c:[{b:"\\[",e:"\\]"}]},{cN:"comment",b:"<!--",e:"-->",r:10},{cN:"cdata",b:"<\\!\\[CDATA\\[",e:"\\]\\]>",r:10},{cN:"tag",b:"<style(?=\\s|>|$)",e:">",k:{title:"style"},c:[b],starts:{e:"</style>",rE:true,sL:"css"}},{cN:"tag",b:"<script(?=\\s|>|$)",e:">",k:{title:"script"},c:[b],starts:{e:"<\/script>",rE:true,sL:"javascript"}},{b:"<%",e:"%>",sL:"vbscript"},{cN:"tag",b:"</?",e:"/?>",c:[{cN:"title",b:"[^ />]+"},b]}]}}(hljs);hljs.LANGUAGES.json=function(a){var e={literal:"true false null"};var d=[a.QSM,a.CNM];var c={cN:"value",e:",",eW:true,eE:true,c:d,k:e};var b={b:"{",e:"}",c:[{cN:"attribute",b:''\\s*"'',e:''"\\s*:\\s*'',eB:true,eE:true,c:[a.BE],i:"\\n",starts:c}],i:"\\S"};var f={b:"\\[",e:"\\]",c:[a.inherit(c,{cN:null})],i:"\\S"};d.splice(d.length,0,b,f);return{c:d,k:e,i:"\\S"}}(hljs);'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> jquery180minJs [
	^ '/*! jQuery v@1.8.0 jquery.com | jquery.org/license */
(function(a,b){function G(a){var b=F[a]={};return p.each(a.split(s),function(a,c){b[c]=!0}),b}function J(a,c,d){if(d===b&&a.nodeType===1){var e="data-"+c.replace(I,"-$1").toLowerCase();d=a.getAttribute(e);if(typeof d=="string"){try{d=d==="true"?!0:d==="false"?!1:d==="null"?null:+d+""===d?+d:H.test(d)?p.parseJSON(d):d}catch(f){}p.data(a,c,d)}else d=b}return d}function K(a){var b;for(b in a){if(b==="data"&&p.isEmptyObject(a[b]))continue;if(b!=="toJSON")return!1}return!0}function ba(){return!1}function bb(){return!0}function bh(a){return!a||!a.parentNode||a.parentNode.nodeType===11}function bi(a,b){do a=a[b];while(a&&a.nodeType!==1);return a}function bj(a,b,c){b=b||0;if(p.isFunction(b))return p.grep(a,function(a,d){var e=!!b.call(a,d,a);return e===c});if(b.nodeType)return p.grep(a,function(a,d){return a===b===c});if(typeof b=="string"){var d=p.grep(a,function(a){return a.nodeType===1});if(be.test(b))return p.filter(b,d,!c);b=p.filter(b,d)}return p.grep(a,function(a,d){return p.inArray(a,b)>=0===c})}function bk(a){var b=bl.split("|"),c=a.createDocumentFragment();if(c.createElement)while(b.length)c.createElement(b.pop());return c}function bC(a,b){return a.getElementsByTagName(b)[0]||a.appendChild(a.ownerDocument.createElement(b))}function bD(a,b){if(b.nodeType!==1||!p.hasData(a))return;var c,d,e,f=p._data(a),g=p._data(b,f),h=f.events;if(h){delete g.handle,g.events={};for(c in h)for(d=0,e=h[c].length;d<e;d++)p.event.add(b,c,h[c][d])}g.data&&(g.data=p.extend({},g.data))}function bE(a,b){var c;if(b.nodeType!==1)return;b.clearAttributes&&b.clearAttributes(),b.mergeAttributes&&b.mergeAttributes(a),c=b.nodeName.toLowerCase(),c==="object"?(b.parentNode&&(b.outerHTML=a.outerHTML),p.support.html5Clone&&a.innerHTML&&!p.trim(b.innerHTML)&&(b.innerHTML=a.innerHTML)):c==="input"&&bv.test(a.type)?(b.defaultChecked=b.checked=a.checked,b.value!==a.value&&(b.value=a.value)):c==="option"?b.selected=a.defaultSelected:c==="input"||c==="textarea"?b.defaultValue=a.defaultValue:c==="script"&&b.text!==a.text&&(b.text=a.text),b.removeAttribute(p.expando)}function bF(a){return typeof a.getElementsByTagName!="undefined"?a.getElementsByTagName("*"):typeof a.querySelectorAll!="undefined"?a.querySelectorAll("*"):[]}function bG(a){bv.test(a.type)&&(a.defaultChecked=a.checked)}function bX(a,b){if(b in a)return b;var c=b.charAt(0).toUpperCase()+b.slice(1),d=b,e=bV.length;while(e--){b=bV[e]+c;if(b in a)return b}return d}function bY(a,b){return a=b||a,p.css(a,"display")==="none"||!p.contains(a.ownerDocument,a)}function bZ(a,b){var c,d,e=[],f=0,g=a.length;for(;f<g;f++){c=a[f];if(!c.style)continue;e[f]=p._data(c,"olddisplay"),b?(!e[f]&&c.style.display==="none"&&(c.style.display=""),c.style.display===""&&bY(c)&&(e[f]=p._data(c,"olddisplay",cb(c.nodeName)))):(d=bH(c,"display"),!e[f]&&d!=="none"&&p._data(c,"olddisplay",d))}for(f=0;f<g;f++){c=a[f];if(!c.style)continue;if(!b||c.style.display==="none"||c.style.display==="")c.style.display=b?e[f]||"":"none"}return a}function b$(a,b,c){var d=bO.exec(b);return d?Math.max(0,d[1]-(c||0))+(d[2]||"px"):b}function b_(a,b,c,d){var e=c===(d?"border":"content")?4:b==="width"?1:0,f=0;for(;e<4;e+=2)c==="margin"&&(f+=p.css(a,c+bU[e],!0)),d?(c==="content"&&(f-=parseFloat(bH(a,"padding"+bU[e]))||0),c!=="margin"&&(f-=parseFloat(bH(a,"border"+bU[e]+"Width"))||0)):(f+=parseFloat(bH(a,"padding"+bU[e]))||0,c!=="padding"&&(f+=parseFloat(bH(a,"border"+bU[e]+"Width"))||0));return f}function ca(a,b,c){var d=b==="width"?a.offsetWidth:a.offsetHeight,e=!0,f=p.support.boxSizing&&p.css(a,"boxSizing")==="border-box";if(d<=0){d=bH(a,b);if(d<0||d==null)d=a.style[b];if(bP.test(d))return d;e=f&&(p.support.boxSizingReliable||d===a.style[b]),d=parseFloat(d)||0}return d+b_(a,b,c||(f?"border":"content"),e)+"px"}function cb(a){if(bR[a])return bR[a];var b=p("<"+a+">").appendTo(e.body),c=b.css("display");b.remove();if(c==="none"||c===""){bI=e.body.appendChild(bI||p.extend(e.createElement("iframe"),{frameBorder:0,width:0,height:0}));if(!bJ||!bI.createElement)bJ=(bI.contentWindow||bI.contentDocument).document,bJ.write("<!doctype html><html><body>"),bJ.close();b=bJ.body.appendChild(bJ.createElement(a)),c=bH(b,"display"),e.body.removeChild(bI)}return bR[a]=c,c}function ch(a,b,c,d){var e;if(p.isArray(b))p.each(b,function(b,e){c||cd.test(a)?d(a,e):ch(a+"["+(typeof e=="object"?b:"")+"]",e,c,d)});else if(!c&&p.type(b)==="object")for(e in b)ch(a+"["+e+"]",b[e],c,d);else d(a,b)}function cy(a){return function(b,c){typeof b!="string"&&(c=b,b="*");var d,e,f,g=b.toLowerCase().split(s),h=0,i=g.length;if(p.isFunction(c))for(;h<i;h++)d=g[h],f=/^\+/.test(d),f&&(d=d.substr(1)||"*"),e=a[d]=a[d]||[],e[f?"unshift":"push"](c)}}function cz(a,c,d,e,f,g){f=f||c.dataTypes[0],g=g||{},g[f]=!0;var h,i=a[f],j=0,k=i?i.length:0,l=a===cu;for(;j<k&&(l||!h);j++)h=i[j](c,d,e),typeof h=="string"&&(!l||g[h]?h=b:(c.dataTypes.unshift(h),h=cz(a,c,d,e,h,g)));return(l||!h)&&!g["*"]&&(h=cz(a,c,d,e,"*",g)),h}function cA(a,c){var d,e,f=p.ajaxSettings.flatOptions||{};for(d in c)c[d]!==b&&((f[d]?a:e||(e={}))[d]=c[d]);e&&p.extend(!0,a,e)}function cB(a,c,d){var e,f,g,h,i=a.contents,j=a.dataTypes,k=a.responseFields;for(f in k)f in d&&(c[k[f]]=d[f]);while(j[0]==="*")j.shift(),e===b&&(e=a.mimeType||c.getResponseHeader("content-type"));if(e)for(f in i)if(i[f]&&i[f].test(e)){j.unshift(f);break}if(j[0]in d)g=j[0];else{for(f in d){if(!j[0]||a.converters[f+" "+j[0]]){g=f;break}h||(h=f)}g=g||h}if(g)return g!==j[0]&&j.unshift(g),d[g]}function cC(a,b){var c,d,e,f,g=a.dataTypes.slice(),h=g[0],i={},j=0;a.dataFilter&&(b=a.dataFilter(b,a.dataType));if(g[1])for(c in a.converters)i[c.toLowerCase()]=a.converters[c];for(;e=g[++j];)if(e!=="*"){if(h!=="*"&&h!==e){c=i[h+" "+e]||i["* "+e];if(!c)for(d in i){f=d.split(" ");if(f[1]===e){c=i[h+" "+f[0]]||i["* "+f[0]];if(c){c===!0?c=i[d]:i[d]!==!0&&(e=f[0],g.splice(j--,0,e));break}}}if(c!==!0)if(c&&a["throws"])b=c(b);else try{b=c(b)}catch(k){return{state:"parsererror",error:c?k:"No conversion from "+h+" to "+e}}}h=e}return{state:"success",data:b}}function cK(){try{return new a.XMLHttpRequest}catch(b){}}function cL(){try{return new a.ActiveXObject("Microsoft.XMLHTTP")}catch(b){}}function cT(){return setTimeout(function(){cM=b},0),cM=p.now()}function cU(a,b){p.each(b,function(b,c){var d=(cS[b]||[]).concat(cS["*"]),e=0,f=d.length;for(;e<f;e++)if(d[e].call(a,b,c))return})}function cV(a,b,c){var d,e=0,f=0,g=cR.length,h=p.Deferred().always(function(){delete i.elem}),i=function(){var b=cM||cT(),c=Math.max(0,j.startTime+j.duration-b),d=1-(c/j.duration||0),e=0,f=j.tweens.length;for(;e<f;e++)j.tweens[e].run(d);return h.notifyWith(a,[j,d,c]),d<1&&f?c:(h.resolveWith(a,[j]),!1)},j=h.promise({elem:a,props:p.extend({},b),opts:p.extend(!0,{specialEasing:{}},c),originalProperties:b,originalOptions:c,startTime:cM||cT(),duration:c.duration,tweens:[],createTween:function(b,c,d){var e=p.Tween(a,j.opts,b,c,j.opts.specialEasing[b]||j.opts.easing);return j.tweens.push(e),e},stop:function(b){var c=0,d=b?j.tweens.length:0;for(;c<d;c++)j.tweens[c].run(1);return b?h.resolveWith(a,[j,b]):h.rejectWith(a,[j,b]),this}}),k=j.props;cW(k,j.opts.specialEasing);for(;e<g;e++){d=cR[e].call(j,a,k,j.opts);if(d)return d}return cU(j,k),p.isFunction(j.opts.start)&&j.opts.start.call(a,j),p.fx.timer(p.extend(i,{anim:j,queue:j.opts.queue,elem:a})),j.progress(j.opts.progress).done(j.opts.done,j.opts.complete).fail(j.opts.fail).always(j.opts.always)}function cW(a,b){var c,d,e,f,g;for(c in a){d=p.camelCase(c),e=b[d],f=a[c],p.isArray(f)&&(e=f[1],f=a[c]=f[0]),c!==d&&(a[d]=f,delete a[c]),g=p.cssHooks[d];if(g&&"expand"in g){f=g.expand(f),delete a[d];for(c in f)c in a||(a[c]=f[c],b[c]=e)}else b[d]=e}}function cX(a,b,c){var d,e,f,g,h,i,j,k,l=this,m=a.style,n={},o=[],q=a.nodeType&&bY(a);c.queue||(j=p._queueHooks(a,"fx"),j.unqueued==null&&(j.unqueued=0,k=j.empty.fire,j.empty.fire=function(){j.unqueued||k()}),j.unqueued++,l.always(function(){l.always(function(){j.unqueued--,p.queue(a,"fx").length||j.empty.fire()})})),a.nodeType===1&&("height"in b||"width"in b)&&(c.overflow=[m.overflow,m.overflowX,m.overflowY],p.css(a,"display")==="inline"&&p.css(a,"float")==="none"&&(!p.support.inlineBlockNeedsLayout||cb(a.nodeName)==="inline"?m.display="inline-block":m.zoom=1)),c.overflow&&(m.overflow="hidden",p.support.shrinkWrapBlocks||l.done(function(){m.overflow=c.overflow[0],m.overflowX=c.overflow[1],m.overflowY=c.overflow[2]}));for(d in b){f=b[d];if(cO.exec(f)){delete b[d];if(f===(q?"hide":"show"))continue;o.push(d)}}g=o.length;if(g){h=p._data(a,"fxshow")||p._data(a,"fxshow",{}),q?p(a).show():l.done(function(){p(a).hide()}),l.done(function(){var b;p.removeData(a,"fxshow",!0);for(b in n)p.style(a,b,n[b])});for(d=0;d<g;d++)e=o[d],i=l.createTween(e,q?h[e]:0),n[e]=h[e]||p.style(a,e),e in h||(h[e]=i.start,q&&(i.end=i.start,i.start=e==="width"||e==="height"?1:0))}}function cY(a,b,c,d,e){return new cY.prototype.init(a,b,c,d,e)}function cZ(a,b){var c,d={height:a},e=0;for(;e<4;e+=2-b)c=bU[e],d["margin"+c]=d["padding"+c]=a;return b&&(d.opacity=d.width=a),d}function c_(a){return p.isWindow(a)?a:a.nodeType===9?a.defaultView||a.parentWindow:!1}var c,d,e=a.document,f=a.location,g=a.navigator,h=a.jQuery,i=a.$,j=Array.prototype.push,k=Array.prototype.slice,l=Array.prototype.indexOf,m=Object.prototype.toString,n=Object.prototype.hasOwnProperty,o=String.prototype.trim,p=function(a,b){return new p.fn.init(a,b,c)},q=/[\-+]?(?:\d*\.|)\d+(?:[eE][\-+]?\d+|)/.source,r=/\S/,s=/\s+/,t=r.test(" ")?/^[\s\xA0]+|[\s\xA0]+$/g:/^\s+|\s+$/g,u=/^(?:[^#<]*(<[\w\W]+>)[^>]*$|#([\w\-]*)$)/,v=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,w=/^[\],:{}\s]*$/,x=/(?:^|:|,)(?:\s*\[)+/g,y=/\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g,z=/"[^"\\\r\n]*"|true|false|null|-?(?:\d\d*\.|)\d+(?:[eE][\-+]?\d+|)/g,A=/^-ms-/,B=/-([\da-z])/gi,C=function(a,b){return(b+"").toUpperCase()},D=function(){e.addEventListener?(e.removeEventListener("DOMContentLoaded",D,!1),p.ready()):e.readyState==="complete"&&(e.detachEvent("onreadystatechange",D),p.ready())},E={};p.fn=p.prototype={constructor:p,init:function(a,c,d){var f,g,h,i;if(!a)return this;if(a.nodeType)return this.context=this[0]=a,this.length=1,this;if(typeof a=="string"){a.charAt(0)==="<"&&a.charAt(a.length-1)===">"&&a.length>=3?f=[null,a,null]:f=u.exec(a);if(f&&(f[1]||!c)){if(f[1])return c=c instanceof p?c[0]:c,i=c&&c.nodeType?c.ownerDocument||c:e,a=p.parseHTML(f[1],i,!0),v.test(f[1])&&p.isPlainObject(c)&&this.attr.call(a,c,!0),p.merge(this,a);g=e.getElementById(f[2]);if(g&&g.parentNode){if(g.id!==f[2])return d.find(a);this.length=1,this[0]=g}return this.context=e,this.selector=a,this}return!c||c.jquery?(c||d).find(a):this.constructor(c).find(a)}return p.isFunction(a)?d.ready(a):(a.selector!==b&&(this.selector=a.selector,this.context=a.context),p.makeArray(a,this))},selector:"",jquery:"1.8.0",length:0,size:function(){return this.length},toArray:function(){return k.call(this)},get:function(a){return a==null?this.toArray():a<0?this[this.length+a]:this[a]},pushStack:function(a,b,c){var d=p.merge(this.constructor(),a);return d.prevObject=this,d.context=this.context,b==="find"?d.selector=this.selector+(this.selector?" ":"")+c:b&&(d.selector=this.selector+"."+b+"("+c+")"),d},each:function(a,b){return p.each(this,a,b)},ready:function(a){return p.ready.promise().done(a),this},eq:function(a){return a=+a,a===-1?this.slice(a):this.slice(a,a+1)},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},slice:function(){return this.pushStack(k.apply(this,arguments),"slice",k.call(arguments).join(","))},map:function(a){return this.pushStack(p.map(this,function(b,c){return a.call(b,c,b)}))},end:function(){return this.prevObject||this.constructor(null)},push:j,sort:[].sort,splice:[].splice},p.fn.init.prototype=p.fn,p.extend=p.fn.extend=function(){var a,c,d,e,f,g,h=arguments[0]||{},i=1,j=arguments.length,k=!1;typeof h=="boolean"&&(k=h,h=arguments[1]||{},i=2),typeof h!="object"&&!p.isFunction(h)&&(h={}),j===i&&(h=this,--i);for(;i<j;i++)if((a=arguments[i])!=null)for(c in a){d=h[c],e=a[c];if(h===e)continue;k&&e&&(p.isPlainObject(e)||(f=p.isArray(e)))?(f?(f=!1,g=d&&p.isArray(d)?d:[]):g=d&&p.isPlainObject(d)?d:{},h[c]=p.extend(k,g,e)):e!==b&&(h[c]=e)}return h},p.extend({noConflict:function(b){return a.$===p&&(a.$=i),b&&a.jQuery===p&&(a.jQuery=h),p},isReady:!1,readyWait:1,holdReady:function(a){a?p.readyWait++:p.ready(!0)},ready:function(a){if(a===!0?--p.readyWait:p.isReady)return;if(!e.body)return setTimeout(p.ready,1);p.isReady=!0;if(a!==!0&&--p.readyWait>0)return;d.resolveWith(e,[p]),p.fn.trigger&&p(e).trigger("ready").off("ready")},isFunction:function(a){return p.type(a)==="function"},isArray:Array.isArray||function(a){return p.type(a)==="array"},isWindow:function(a){return a!=null&&a==a.window},isNumeric:function(a){return!isNaN(parseFloat(a))&&isFinite(a)},type:function(a){return a==null?String(a):E[m.call(a)]||"object"},isPlainObject:function(a){if(!a||p.type(a)!=="object"||a.nodeType||p.isWindow(a))return!1;try{if(a.constructor&&!n.call(a,"constructor")&&!n.call(a.constructor.prototype,"isPrototypeOf"))return!1}catch(c){return!1}var d;for(d in a);return d===b||n.call(a,d)},isEmptyObject:function(a){var b;for(b in a)return!1;return!0},error:function(a){throw new Error(a)},parseHTML:function(a,b,c){var d;return!a||typeof a!="string"?null:(typeof b=="boolean"&&(c=b,b=0),b=b||e,(d=v.exec(a))?[b.createElement(d[1])]:(d=p.buildFragment([a],b,c?null:[]),p.merge([],(d.cacheable?p.clone(d.fragment):d.fragment).childNodes)))},parseJSON:function(b){if(!b||typeof b!="string")return null;b=p.trim(b);if(a.JSON&&a.JSON.parse)return a.JSON.parse(b);if(w.test(b.replace(y,"@").replace(z,"]").replace(x,"")))return(new Function("return "+b))();p.error("Invalid JSON: "+b)},parseXML:function(c){var d,e;if(!c||typeof c!="string")return null;try{a.DOMParser?(e=new DOMParser,d=e.parseFromString(c,"text/xml")):(d=new ActiveXObject("Microsoft.XMLDOM"),d.async="false",d.loadXML(c))}catch(f){d=b}return(!d||!d.documentElement||d.getElementsByTagName("parsererror").length)&&p.error("Invalid XML: "+c),d},noop:function(){},globalEval:function(b){b&&r.test(b)&&(a.execScript||function(b){a.eval.call(a,b)})(b)},camelCase:function(a){return a.replace(A,"ms-").replace(B,C)},nodeName:function(a,b){return a.nodeName&&a.nodeName.toUpperCase()===b.toUpperCase()},each:function(a,c,d){var e,f=0,g=a.length,h=g===b||p.isFunction(a);if(d){if(h){for(e in a)if(c.apply(a[e],d)===!1)break}else for(;f<g;)if(c.apply(a[f++],d)===!1)break}else if(h){for(e in a)if(c.call(a[e],e,a[e])===!1)break}else for(;f<g;)if(c.call(a[f],f,a[f++])===!1)break;return a},trim:o?function(a){return a==null?"":o.call(a)}:function(a){return a==null?"":a.toString().replace(t,"")},makeArray:function(a,b){var c,d=b||[];return a!=null&&(c=p.type(a),a.length==null||c==="string"||c==="function"||c==="regexp"||p.isWindow(a)?j.call(d,a):p.merge(d,a)),d},inArray:function(a,b,c){var d;if(b){if(l)return l.call(b,a,c);d=b.length,c=c?c<0?Math.max(0,d+c):c:0;for(;c<d;c++)if(c in b&&b[c]===a)return c}return-1},merge:function(a,c){var d=c.length,e=a.length,f=0;if(typeof d=="number")for(;f<d;f++)a[e++]=c[f];else while(c[f]!==b)a[e++]=c[f++];return a.length=e,a},grep:function(a,b,c){var d,e=[],f=0,g=a.length;c=!!c;for(;f<g;f++)d=!!b(a[f],f),c!==d&&e.push(a[f]);return e},map:function(a,c,d){var e,f,g=[],h=0,i=a.length,j=a instanceof p||i!==b&&typeof i=="number"&&(i>0&&a[0]&&a[i-1]||i===0||p.isArray(a));if(j)for(;h<i;h++)e=c(a[h],h,d),e!=null&&(g[g.length]=e);else for(f in a)e=c(a[f],f,d),e!=null&&(g[g.length]=e);return g.concat.apply([],g)},guid:1,proxy:function(a,c){var d,e,f;return typeof c=="string"&&(d=a[c],c=a,a=d),p.isFunction(a)?(e=k.call(arguments,2),f=function(){return a.apply(c,e.concat(k.call(arguments)))},f.guid=a.guid=a.guid||f.guid||p.guid++,f):b},access:function(a,c,d,e,f,g,h){var i,j=d==null,k=0,l=a.length;if(d&&typeof d=="object"){for(k in d)p.access(a,c,k,d[k],1,g,e);f=1}else if(e!==b){i=h===b&&p.isFunction(e),j&&(i?(i=c,c=function(a,b,c){return i.call(p(a),c)}):(c.call(a,e),c=null));if(c)for(;k<l;k++)c(a[k],d,i?e.call(a[k],k,c(a[k],d)):e,h);f=1}return f?a:j?c.call(a):l?c(a[0],d):g},now:function(){return(new Date).getTime()}}),p.ready.promise=function(b){if(!d){d=p.Deferred();if(e.readyState==="complete"||e.readyState!=="loading"&&e.addEventListener)setTimeout(p.ready,1);else if(e.addEventListener)e.addEventListener("DOMContentLoaded",D,!1),a.addEventListener("load",p.ready,!1);else{e.attachEvent("onreadystatechange",D),a.attachEvent("onload",p.ready);var c=!1;try{c=a.frameElement==null&&e.documentElement}catch(f){}c&&c.doScroll&&function g(){if(!p.isReady){try{c.doScroll("left")}catch(a){return setTimeout(g,50)}p.ready()}}()}}return d.promise(b)},p.each("Boolean Number String Function Array Date RegExp Object".split(" "),function(a,b){E["[object "+b+"]"]=b.toLowerCase()}),c=p(e);var F={};p.Callbacks=function(a){a=typeof a=="string"?F[a]||G(a):p.extend({},a);var c,d,e,f,g,h,i=[],j=!a.once&&[],k=function(b){c=a.memory&&b,d=!0,h=f||0,f=0,g=i.length,e=!0;for(;i&&h<g;h++)if(i[h].apply(b[0],b[1])===!1&&a.stopOnFalse){c=!1;break}e=!1,i&&(j?j.length&&k(j.shift()):c?i=[]:l.disable())},l={add:function(){if(i){var b=i.length;(function d(b){p.each(b,function(b,c){p.isFunction(c)&&(!a.unique||!l.has(c))?i.push(c):c&&c.length&&d(c)})})(arguments),e?g=i.length:c&&(f=b,k(c))}return this},remove:function(){return i&&p.each(arguments,function(a,b){var c;while((c=p.inArray(b,i,c))>-1)i.splice(c,1),e&&(c<=g&&g--,c<=h&&h--)}),this},has:function(a){return p.inArray(a,i)>-1},empty:function(){return i=[],this},disable:function(){return i=j=c=b,this},disabled:function(){return!i},lock:function(){return j=b,c||l.disable(),this},locked:function(){return!j},fireWith:function(a,b){return b=b||[],b=[a,b.slice?b.slice():b],i&&(!d||j)&&(e?j.push(b):k(b)),this},fire:function(){return l.fireWith(this,arguments),this},fired:function(){return!!d}};return l},p.extend({Deferred:function(a){var b=[["resolve","done",p.Callbacks("once memory"),"resolved"],["reject","fail",p.Callbacks("once memory"),"rejected"],["notify","progress",p.Callbacks("memory")]],c="pending",d={state:function(){return c},always:function(){return e.done(arguments).fail(arguments),this},then:function(){var a=arguments;return p.Deferred(function(c){p.each(b,function(b,d){var f=d[0],g=a[b];e[d[1]](p.isFunction(g)?function(){var a=g.apply(this,arguments);a&&p.isFunction(a.promise)?a.promise().done(c.resolve).fail(c.reject).progress(c.notify):c[f+"With"](this===e?c:this,[a])}:c[f])}),a=null}).promise()},promise:function(a){return typeof a=="object"?p.extend(a,d):d}},e={};return d.pipe=d.then,p.each(b,function(a,f){var g=f[2],h=f[3];d[f[1]]=g.add,h&&g.add(function(){c=h},b[a^1][2].disable,b[2][2].lock),e[f[0]]=g.fire,e[f[0]+"With"]=g.fireWith}),d.promise(e),a&&a.call(e,e),e},when:function(a){var b=0,c=k.call(arguments),d=c.length,e=d!==1||a&&p.isFunction(a.promise)?d:0,f=e===1?a:p.Deferred(),g=function(a,b,c){return function(d){b[a]=this,c[a]=arguments.length>1?k.call(arguments):d,c===h?f.notifyWith(b,c):--e||f.resolveWith(b,c)}},h,i,j;if(d>1){h=new Array(d),i=new Array(d),j=new Array(d);for(;b<d;b++)c[b]&&p.isFunction(c[b].promise)?c[b].promise().done(g(b,j,c)).fail(f.reject).progress(g(b,i,h)):--e}return e||f.resolveWith(j,c),f.promise()}}),p.support=function(){var b,c,d,f,g,h,i,j,k,l,m,n=e.createElement("div");n.setAttribute("className","t"),n.innerHTML="  <link/><table></table><a href=''/a''>a</a><input type=''checkbox''/>",c=n.getElementsByTagName("*"),d=n.getElementsByTagName("a")[0],d.style.cssText="top:1px;float:left;opacity:.5";if(!c||!c.length||!d)return{};f=e.createElement("select"),g=f.appendChild(e.createElement("option")),h=n.getElementsByTagName("input")[0],b={leadingWhitespace:n.firstChild.nodeType===3,tbody:!n.getElementsByTagName("tbody").length,htmlSerialize:!!n.getElementsByTagName("link").length,style:/top/.test(d.getAttribute("style")),hrefNormalized:d.getAttribute("href")==="/a",opacity:/^0.5/.test(d.style.opacity),cssFloat:!!d.style.cssFloat,checkOn:h.value==="on",optSelected:g.selected,getSetAttribute:n.className!=="t",enctype:!!e.createElement("form").enctype,html5Clone:e.createElement("nav").cloneNode(!0).outerHTML!=="<:nav></:nav>",boxModel:e.compatMode==="CSS1Compat",submitBubbles:!0,changeBubbles:!0,focusinBubbles:!1,deleteExpando:!0,noCloneEvent:!0,inlineBlockNeedsLayout:!1,shrinkWrapBlocks:!1,reliableMarginRight:!0,boxSizingReliable:!0,pixelPosition:!1},h.checked=!0,b.noCloneChecked=h.cloneNode(!0).checked,f.disabled=!0,b.optDisabled=!g.disabled;try{delete n.test}catch(o){b.deleteExpando=!1}!n.addEventListener&&n.attachEvent&&n.fireEvent&&(n.attachEvent("onclick",m=function(){b.noCloneEvent=!1}),n.cloneNode(!0).fireEvent("onclick"),n.detachEvent("onclick",m)),h=e.createElement("input"),h.value="t",h.setAttribute("type","radio"),b.radioValue=h.value==="t",h.setAttribute("checked","checked"),h.setAttribute("name","t"),n.appendChild(h),i=e.createDocumentFragment(),i.appendChild(n.lastChild),b.checkClone=i.cloneNode(!0).cloneNode(!0).lastChild.checked,b.appendChecked=h.checked,i.removeChild(h),i.appendChild(n);if(n.attachEvent)for(k in{submit:!0,change:!0,focusin:!0})j="on"+k,l=j in n,l||(n.setAttribute(j,"return;"),l=typeof n[j]=="function"),b[k+"Bubbles"]=l;return p(function(){var c,d,f,g,h="padding:0;margin:0;border:0;display:block;overflow:hidden;",i=e.getElementsByTagName("body")[0];if(!i)return;c=e.createElement("div"),c.style.cssText="visibility:hidden;border:0;width:0;height:0;position:static;top:0;margin-top:1px",i.insertBefore(c,i.firstChild),d=e.createElement("div"),c.appendChild(d),d.innerHTML="<table><tr><td></td><td>t</td></tr></table>",f=d.getElementsByTagName("td"),f[0].style.cssText="padding:0;margin:0;border:0;display:none",l=f[0].offsetHeight===0,f[0].style.display="",f[1].style.display="none",b.reliableHiddenOffsets=l&&f[0].offsetHeight===0,d.innerHTML="",d.style.cssText="box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;",b.boxSizing=d.offsetWidth===4,b.doesNotIncludeMarginInBodyOffset=i.offsetTop!==1,a.getComputedStyle&&(b.pixelPosition=(a.getComputedStyle(d,null)||{}).top!=="1%",b.boxSizingReliable=(a.getComputedStyle(d,null)||{width:"4px"}).width==="4px",g=e.createElement("div"),g.style.cssText=d.style.cssText=h,g.style.marginRight=g.style.width="0",d.style.width="1px",d.appendChild(g),b.reliableMarginRight=!parseFloat((a.getComputedStyle(g,null)||{}).marginRight)),typeof d.style.zoom!="undefined"&&(d.innerHTML="",d.style.cssText=h+"width:1px;padding:1px;display:inline;zoom:1",b.inlineBlockNeedsLayout=d.offsetWidth===3,d.style.display="block",d.style.overflow="visible",d.innerHTML="<div></div>",d.firstChild.style.width="5px",b.shrinkWrapBlocks=d.offsetWidth!==3,c.style.zoom=1),i.removeChild(c),c=d=f=g=null}),i.removeChild(n),c=d=f=g=h=i=n=null,b}();var H=/^(?:\{.*\}|\[.*\])$/,I=/([A-Z])/g;p.extend({cache:{},deletedIds:[],uuid:0,expando:"jQuery"+(p.fn.jquery+Math.random()).replace(/\D/g,""),noData:{embed:!0,object:"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000",applet:!0},hasData:function(a){return a=a.nodeType?p.cache[a[p.expando]]:a[p.expando],!!a&&!K(a)},data:function(a,c,d,e){if(!p.acceptData(a))return;var f,g,h=p.expando,i=typeof c=="string",j=a.nodeType,k=j?p.cache:a,l=j?a[h]:a[h]&&h;if((!l||!k[l]||!e&&!k[l].data)&&i&&d===b)return;l||(j?a[h]=l=p.deletedIds.pop()||++p.uuid:l=h),k[l]||(k[l]={},j||(k[l].toJSON=p.noop));if(typeof c=="object"||typeof c=="function")e?k[l]=p.extend(k[l],c):k[l].data=p.extend(k[l].data,c);return f=k[l],e||(f.data||(f.data={}),f=f.data),d!==b&&(f[p.camelCase(c)]=d),i?(g=f[c],g==null&&(g=f[p.camelCase(c)])):g=f,g},removeData:function(a,b,c){if(!p.acceptData(a))return;var d,e,f,g=a.nodeType,h=g?p.cache:a,i=g?a[p.expando]:p.expando;if(!h[i])return;if(b){d=c?h[i]:h[i].data;if(d){p.isArray(b)||(b in d?b=[b]:(b=p.camelCase(b),b in d?b=[b]:b=b.split(" ")));for(e=0,f=b.length;e<f;e++)delete d[b[e]];if(!(c?K:p.isEmptyObject)(d))return}}if(!c){delete h[i].data;if(!K(h[i]))return}g?p.cleanData([a],!0):p.support.deleteExpando||h!=h.window?delete h[i]:h[i]=null},_data:function(a,b,c){return p.data(a,b,c,!0)},acceptData:function(a){var b=a.nodeName&&p.noData[a.nodeName.toLowerCase()];return!b||b!==!0&&a.getAttribute("classid")===b}}),p.fn.extend({data:function(a,c){var d,e,f,g,h,i=this[0],j=0,k=null;if(a===b){if(this.length){k=p.data(i);if(i.nodeType===1&&!p._data(i,"parsedAttrs")){f=i.attributes;for(h=f.length;j<h;j++)g=f[j].name,g.indexOf("data-")===0&&(g=p.camelCase(g.substring(5)),J(i,g,k[g]));p._data(i,"parsedAttrs",!0)}}return k}return typeof a=="object"?this.each(function(){p.data(this,a)}):(d=a.split(".",2),d[1]=d[1]?"."+d[1]:"",e=d[1]+"!",p.access(this,function(c){if(c===b)return k=this.triggerHandler("getData"+e,[d[0]]),k===b&&i&&(k=p.data(i,a),k=J(i,a,k)),k===b&&d[1]?this.data(d[0]):k;d[1]=c,this.each(function(){var b=p(this);b.triggerHandler("setData"+e,d),p.data(this,a,c),b.triggerHandler("changeData"+e,d)})},null,c,arguments.length>1,null,!1))},removeData:function(a){return this.each(function(){p.removeData(this,a)})}}),p.extend({queue:function(a,b,c){var d;if(a)return b=(b||"fx")+"queue",d=p._data(a,b),c&&(!d||p.isArray(c)?d=p._data(a,b,p.makeArray(c)):d.push(c)),d||[]},dequeue:function(a,b){b=b||"fx";var c=p.queue(a,b),d=c.shift(),e=p._queueHooks(a,b),f=function(){p.dequeue(a,b)};d==="inprogress"&&(d=c.shift()),d&&(b==="fx"&&c.unshift("inprogress"),delete e.stop,d.call(a,f,e)),!c.length&&e&&e.empty.fire()},_queueHooks:function(a,b){var c=b+"queueHooks";return p._data(a,c)||p._data(a,c,{empty:p.Callbacks("once memory").add(function(){p.removeData(a,b+"queue",!0),p.removeData(a,c,!0)})})}}),p.fn.extend({queue:function(a,c){var d=2;return typeof a!="string"&&(c=a,a="fx",d--),arguments.length<d?p.queue(this[0],a):c===b?this:this.each(function(){var b=p.queue(this,a,c);p._queueHooks(this,a),a==="fx"&&b[0]!=="inprogress"&&p.dequeue(this,a)})},dequeue:function(a){return this.each(function(){p.dequeue(this,a)})},delay:function(a,b){return a=p.fx?p.fx.speeds[a]||a:a,b=b||"fx",this.queue(b,function(b,c){var d=setTimeout(b,a);c.stop=function(){clearTimeout(d)}})},clearQueue:function(a){return this.queue(a||"fx",[])},promise:function(a,c){var d,e=1,f=p.Deferred(),g=this,h=this.length,i=function(){--e||f.resolveWith(g,[g])};typeof a!="string"&&(c=a,a=b),a=a||"fx";while(h--)(d=p._data(g[h],a+"queueHooks"))&&d.empty&&(e++,d.empty.add(i));return i(),f.promise(c)}});var L,M,N,O=/[\t\r\n]/g,P=/\r/g,Q=/^(?:button|input)$/i,R=/^(?:button|input|object|select|textarea)$/i,S=/^a(?:rea|)$/i,T=/^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,U=p.support.getSetAttribute;p.fn.extend({attr:function(a,b){return p.access(this,p.attr,a,b,arguments.length>1)},removeAttr:function(a){return this.each(function(){p.removeAttr(this,a)})},prop:function(a,b){return p.access(this,p.prop,a,b,arguments.length>1)},removeProp:function(a){return a=p.propFix[a]||a,this.each(function(){try{this[a]=b,delete this[a]}catch(c){}})},addClass:function(a){var b,c,d,e,f,g,h;if(p.isFunction(a))return this.each(function(b){p(this).addClass(a.call(this,b,this.className))});if(a&&typeof a=="string"){b=a.split(s);for(c=0,d=this.length;c<d;c++){e=this[c];if(e.nodeType===1)if(!e.className&&b.length===1)e.className=a;else{f=" "+e.className+" ";for(g=0,h=b.length;g<h;g++)~f.indexOf(" "+b[g]+" ")||(f+=b[g]+" ");e.className=p.trim(f)}}}return this},removeClass:function(a){var c,d,e,f,g,h,i;if(p.isFunction(a))return this.each(function(b){p(this).removeClass(a.call(this,b,this.className))});if(a&&typeof a=="string"||a===b){c=(a||"").split(s);for(h=0,i=this.length;h<i;h++){e=this[h];if(e.nodeType===1&&e.className){d=(" "+e.className+" ").replace(O," ");for(f=0,g=c.length;f<g;f++)while(d.indexOf(" "+c[f]+" ")>-1)d=d.replace(" "+c[f]+" "," ");e.className=a?p.trim(d):""}}}return this},toggleClass:function(a,b){var c=typeof a,d=typeof b=="boolean";return p.isFunction(a)?this.each(function(c){p(this).toggleClass(a.call(this,c,this.className,b),b)}):this.each(function(){if(c==="string"){var e,f=0,g=p(this),h=b,i=a.split(s);while(e=i[f++])h=d?h:!g.hasClass(e),g[h?"addClass":"removeClass"](e)}else if(c==="undefined"||c==="boolean")this.className&&p._data(this,"__className__",this.className),this.className=this.className||a===!1?"":p._data(this,"__className__")||""})},hasClass:function(a){var b=" "+a+" ",c=0,d=this.length;for(;c<d;c++)if(this[c].nodeType===1&&(" "+this[c].className+" ").replace(O," ").indexOf(b)>-1)return!0;return!1},val:function(a){var c,d,e,f=this[0];if(!arguments.length){if(f)return c=p.valHooks[f.type]||p.valHooks[f.nodeName.toLowerCase()],c&&"get"in c&&(d=c.get(f,"value"))!==b?d:(d=f.value,typeof d=="string"?d.replace(P,""):d==null?"":d);return}return e=p.isFunction(a),this.each(function(d){var f,g=p(this);if(this.nodeType!==1)return;e?f=a.call(this,d,g.val()):f=a,f==null?f="":typeof f=="number"?f+="":p.isArray(f)&&(f=p.map(f,function(a){return a==null?"":a+""})),c=p.valHooks[this.type]||p.valHooks[this.nodeName.toLowerCase()];if(!c||!("set"in c)||c.set(this,f,"value")===b)this.value=f})}}),p.extend({valHooks:{option:{get:function(a){var b=a.attributes.value;return!b||b.specified?a.value:a.text}},select:{get:function(a){var b,c,d,e,f=a.selectedIndex,g=[],h=a.options,i=a.type==="select-one";if(f<0)return null;c=i?f:0,d=i?f+1:h.length;for(;c<d;c++){e=h[c];if(e.selected&&(p.support.optDisabled?!e.disabled:e.getAttribute("disabled")===null)&&(!e.parentNode.disabled||!p.nodeName(e.parentNode,"optgroup"))){b=p(e).val();if(i)return b;g.push(b)}}return i&&!g.length&&h.length?p(h[f]).val():g},set:function(a,b){var c=p.makeArray(b);return p(a).find("option").each(function(){this.selected=p.inArray(p(this).val(),c)>=0}),c.length||(a.selectedIndex=-1),c}}},attrFn:{},attr:function(a,c,d,e){var f,g,h,i=a.nodeType;if(!a||i===3||i===8||i===2)return;if(e&&p.isFunction(p.fn[c]))return p(a)[c](d);if(typeof a.getAttribute=="undefined")return p.prop(a,c,d);h=i!==1||!p.isXMLDoc(a),h&&(c=c.toLowerCase(),g=p.attrHooks[c]||(T.test(c)?M:L));if(d!==b){if(d===null){p.removeAttr(a,c);return}return g&&"set"in g&&h&&(f=g.set(a,d,c))!==b?f:(a.setAttribute(c,""+d),d)}return g&&"get"in g&&h&&(f=g.get(a,c))!==null?f:(f=a.getAttribute(c),f===null?b:f)},removeAttr:function(a,b){var c,d,e,f,g=0;if(b&&a.nodeType===1){d=b.split(s);for(;g<d.length;g++)e=d[g],e&&(c=p.propFix[e]||e,f=T.test(e),f||p.attr(a,e,""),a.removeAttribute(U?e:c),f&&c in a&&(a[c]=!1))}},attrHooks:{type:{set:function(a,b){if(Q.test(a.nodeName)&&a.parentNode)p.error("type property can''t be changed");else if(!p.support.radioValue&&b==="radio"&&p.nodeName(a,"input")){var c=a.value;return a.setAttribute("type",b),c&&(a.value=c),b}}},value:{get:function(a,b){return L&&p.nodeName(a,"button")?L.get(a,b):b in a?a.value:null},set:function(a,b,c){if(L&&p.nodeName(a,"button"))return L.set(a,b,c);a.value=b}}},propFix:{tabindex:"tabIndex",readonly:"readOnly","for":"htmlFor","class":"className",maxlength:"maxLength",cellspacing:"cellSpacing",cellpadding:"cellPadding",rowspan:"rowSpan",colspan:"colSpan",usemap:"useMap",frameborder:"frameBorder",contenteditable:"contentEditable"},prop:function(a,c,d){var e,f,g,h=a.nodeType;if(!a||h===3||h===8||h===2)return;return g=h!==1||!p.isXMLDoc(a),g&&(c=p.propFix[c]||c,f=p.propHooks[c]),d!==b?f&&"set"in f&&(e=f.set(a,d,c))!==b?e:a[c]=d:f&&"get"in f&&(e=f.get(a,c))!==null?e:a[c]},propHooks:{tabIndex:{get:function(a){var c=a.getAttributeNode("tabindex");return c&&c.specified?parseInt(c.value,10):R.test(a.nodeName)||S.test(a.nodeName)&&a.href?0:b}}}}),M={get:function(a,c){var d,e=p.prop(a,c);return e===!0||typeof e!="boolean"&&(d=a.getAttributeNode(c))&&d.nodeValue!==!1?c.toLowerCase():b},set:function(a,b,c){var d;return b===!1?p.removeAttr(a,c):(d=p.propFix[c]||c,d in a&&(a[d]=!0),a.setAttribute(c,c.toLowerCase())),c}},U||(N={name:!0,id:!0,coords:!0},L=p.valHooks.button={get:function(a,c){var d;return d=a.getAttributeNode(c),d&&(N[c]?d.value!=="":d.specified)?d.value:b},set:function(a,b,c){var d=a.getAttributeNode(c);return d||(d=e.createAttribute(c),a.setAttributeNode(d)),d.value=b+""}},p.each(["width","height"],function(a,b){p.attrHooks[b]=p.extend(p.attrHooks[b],{set:function(a,c){if(c==="")return a.setAttribute(b,"auto"),c}})}),p.attrHooks.contenteditable={get:L.get,set:function(a,b,c){b===""&&(b="false"),L.set(a,b,c)}}),p.support.hrefNormalized||p.each(["href","src","width","height"],function(a,c){p.attrHooks[c]=p.extend(p.attrHooks[c],{get:function(a){var d=a.getAttribute(c,2);return d===null?b:d}})}),p.support.style||(p.attrHooks.style={get:function(a){return a.style.cssText.toLowerCase()||b},set:function(a,b){return a.style.cssText=""+b}}),p.support.optSelected||(p.propHooks.selected=p.extend(p.propHooks.selected,{get:function(a){var b=a.parentNode;return b&&(b.selectedIndex,b.parentNode&&b.parentNode.selectedIndex),null}})),p.support.enctype||(p.propFix.enctype="encoding"),p.support.checkOn||p.each(["radio","checkbox"],function(){p.valHooks[this]={get:function(a){return a.getAttribute("value")===null?"on":a.value}}}),p.each(["radio","checkbox"],function(){p.valHooks[this]=p.extend(p.valHooks[this],{set:function(a,b){if(p.isArray(b))return a.checked=p.inArray(p(a).val(),b)>=0}})});var V=/^(?:textarea|input|select)$/i,W=/^([^\.]*|)(?:\.(.+)|)$/,X=/(?:^|\s)hover(\.\S+|)\b/,Y=/^key/,Z=/^(?:mouse|contextmenu)|click/,$=/^(?:focusinfocus|focusoutblur)$/,_=function(a){return p.event.special.hover?a:a.replace(X,"mouseenter$1 mouseleave$1")};p.event={add:function(a,c,d,e,f){var g,h,i,j,k,l,m,n,o,q,r;if(a.nodeType===3||a.nodeType===8||!c||!d||!(g=p._data(a)))return;d.handler&&(o=d,d=o.handler,f=o.selector),d.guid||(d.guid=p.guid++),i=g.events,i||(g.events=i={}),h=g.handle,h||(g.handle=h=function(a){return typeof p!="undefined"&&(!a||p.event.triggered!==a.type)?p.event.dispatch.apply(h.elem,arguments):b},h.elem=a),c=p.trim(_(c)).split(" ");for(j=0;j<c.length;j++){k=W.exec(c[j])||[],l=k[1],m=(k[2]||"").split(".").sort(),r=p.event.special[l]||{},l=(f?r.delegateType:r.bindType)||l,r=p.event.special[l]||{},n=p.extend({type:l,origType:k[1],data:e,handler:d,guid:d.guid,selector:f,namespace:m.join(".")},o),q=i[l];if(!q){q=i[l]=[],q.delegateCount=0;if(!r.setup||r.setup.call(a,e,m,h)===!1)a.addEventListener?a.addEventListener(l,h,!1):a.attachEvent&&a.attachEvent("on"+l,h)}r.add&&(r.add.call(a,n),n.handler.guid||(n.handler.guid=d.guid)),f?q.splice(q.delegateCount++,0,n):q.push(n),p.event.global[l]=!0}a=null},global:{},remove:function(a,b,c,d,e){var f,g,h,i,j,k,l,m,n,o,q,r=p.hasData(a)&&p._data(a);if(!r||!(m=r.events))return;b=p.trim(_(b||"")).split(" ");for(f=0;f<b.length;f++){g=W.exec(b[f])||[],h=i=g[1],j=g[2];if(!h){for(h in m)p.event.remove(a,h+b[f],c,d,!0);continue}n=p.event.special[h]||{},h=(d?n.delegateType:n.bindType)||h,o=m[h]||[],k=o.length,j=j?new RegExp("(^|\\.)"+j.split(".").sort().join("\\.(?:.*\\.|)")+"(\\.|$)"):null;for(l=0;l<o.length;l++)q=o[l],(e||i===q.origType)&&(!c||c.guid===q.guid)&&(!j||j.test(q.namespace))&&(!d||d===q.selector||d==="**"&&q.selector)&&(o.splice(l--,1),q.selector&&o.delegateCount--,n.remove&&n.remove.call(a,q));o.length===0&&k!==o.length&&((!n.teardown||n.teardown.call(a,j,r.handle)===!1)&&p.removeEvent(a,h,r.handle),delete m[h])}p.isEmptyObject(m)&&(delete r.handle,p.removeData(a,"events",!0))},customEvent:{getData:!0,setData:!0,changeData:!0},trigger:function(c,d,f,g){if(!f||f.nodeType!==3&&f.nodeType!==8){var h,i,j,k,l,m,n,o,q,r,s=c.type||c,t=[];if($.test(s+p.event.triggered))return;s.indexOf("!")>=0&&(s=s.slice(0,-1),i=!0),s.indexOf(".")>=0&&(t=s.split("."),s=t.shift(),t.sort());if((!f||p.event.customEvent[s])&&!p.event.global[s])return;c=typeof c=="object"?c[p.expando]?c:new p.Event(s,c):new p.Event(s),c.type=s,c.isTrigger=!0,c.exclusive=i,c.namespace=t.join("."),c.namespace_re=c.namespace?new RegExp("(^|\\.)"+t.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,m=s.indexOf(":")<0?"on"+s:"";if(!f){h=p.cache;for(j in h)h[j].events&&h[j].events[s]&&p.event.trigger(c,d,h[j].handle.elem,!0);return}c.result=b,c.target||(c.target=f),d=d!=null?p.makeArray(d):[],d.unshift(c),n=p.event.special[s]||{};if(n.trigger&&n.trigger.apply(f,d)===!1)return;q=[[f,n.bindType||s]];if(!g&&!n.noBubble&&!p.isWindow(f)){r=n.delegateType||s,k=$.test(r+s)?f:f.parentNode;for(l=f;k;k=k.parentNode)q.push([k,r]),l=k;l===(f.ownerDocument||e)&&q.push([l.defaultView||l.parentWindow||a,r])}for(j=0;j<q.length&&!c.isPropagationStopped();j++)k=q[j][0],c.type=q[j][1],o=(p._data(k,"events")||{})[c.type]&&p._data(k,"handle"),o&&o.apply(k,d),o=m&&k[m],o&&p.acceptData(k)&&o.apply(k,d)===!1&&c.preventDefault();return c.type=s,!g&&!c.isDefaultPrevented()&&(!n._default||n._default.apply(f.ownerDocument,d)===!1)&&(s!=="click"||!p.nodeName(f,"a"))&&p.acceptData(f)&&m&&f[s]&&(s!=="focus"&&s!=="blur"||c.target.offsetWidth!==0)&&!p.isWindow(f)&&(l=f[m],l&&(f[m]=null),p.event.triggered=s,f[s](),p.event.triggered=b,l&&(f[m]=l)),c.result}return},dispatch:function(c){c=p.event.fix(c||a.event);var d,e,f,g,h,i,j,k,l,m,n,o=(p._data(this,"events")||{})[c.type]||[],q=o.delegateCount,r=[].slice.call(arguments),s=!c.exclusive&&!c.namespace,t=p.event.special[c.type]||{},u=[];r[0]=c,c.delegateTarget=this;if(t.preDispatch&&t.preDispatch.call(this,c)===!1)return;if(q&&(!c.button||c.type!=="click")){g=p(this),g.context=this;for(f=c.target;f!=this;f=f.parentNode||this)if(f.disabled!==!0||c.type!=="click"){i={},k=[],g[0]=f;for(d=0;d<q;d++)l=o[d],m=l.selector,i[m]===b&&(i[m]=g.is(m)),i[m]&&k.push(l);k.length&&u.push({elem:f,matches:k})}}o.length>q&&u.push({elem:this,matches:o.slice(q)});for(d=0;d<u.length&&!c.isPropagationStopped();d++){j=u[d],c.currentTarget=j.elem;for(e=0;e<j.matches.length&&!c.isImmediatePropagationStopped();e++){l=j.matches[e];if(s||!c.namespace&&!l.namespace||c.namespace_re&&c.namespace_re.test(l.namespace))c.data=l.data,c.handleObj=l,h=((p.event.special[l.origType]||{}).handle||l.handler).apply(j.elem,r),h!==b&&(c.result=h,h===!1&&(c.preventDefault(),c.stopPropagation()))}}return t.postDispatch&&t.postDispatch.call(this,c),c.result},props:"attrChange attrName relatedNode srcElement altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(a,b){return a.which==null&&(a.which=b.charCode!=null?b.charCode:b.keyCode),a}},mouseHooks:{props:"button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(a,c){var d,f,g,h=c.button,i=c.fromElement;return a.pageX==null&&c.clientX!=null&&(d=a.target.ownerDocument||e,f=d.documentElement,g=d.body,a.pageX=c.clientX+(f&&f.scrollLeft||g&&g.scrollLeft||0)-(f&&f.clientLeft||g&&g.clientLeft||0),a.pageY=c.clientY+(f&&f.scrollTop||g&&g.scrollTop||0)-(f&&f.clientTop||g&&g.clientTop||0)),!a.relatedTarget&&i&&(a.relatedTarget=i===a.target?c.toElement:i),!a.which&&h!==b&&(a.which=h&1?1:h&2?3:h&4?2:0),a}},fix:function(a){if(a[p.expando])return a;var b,c,d=a,f=p.event.fixHooks[a.type]||{},g=f.props?this.props.concat(f.props):this.props;a=p.Event(d);for(b=g.length;b;)c=g[--b],a[c]=d[c];return a.target||(a.target=d.srcElement||e),a.target.nodeType===3&&(a.target=a.target.parentNode),a.metaKey=!!a.metaKey,f.filter?f.filter(a,d):a},special:{ready:{setup:p.bindReady},load:{noBubble:!0},focus:{delegateType:"focusin"},blur:{delegateType:"focusout"},beforeunload:{setup:function(a,b,c){p.isWindow(this)&&(this.onbeforeunload=c)},teardown:function(a,b){this.onbeforeunload===b&&(this.onbeforeunload=null)}}},simulate:function(a,b,c,d){var e=p.extend(new p.Event,c,{type:a,isSimulated:!0,originalEvent:{}});d?p.event.trigger(e,null,b):p.event.dispatch.call(b,e),e.isDefaultPrevented()&&c.preventDefault()}},p.event.handle=p.event.dispatch,p.removeEvent=e.removeEventListener?function(a,b,c){a.removeEventListener&&a.removeEventListener(b,c,!1)}:function(a,b,c){var d="on"+b;a.detachEvent&&(typeof a[d]=="undefined"&&(a[d]=null),a.detachEvent(d,c))},p.Event=function(a,b){if(this instanceof p.Event)a&&a.type?(this.originalEvent=a,this.type=a.type,this.isDefaultPrevented=a.defaultPrevented||a.returnValue===!1||a.getPreventDefault&&a.getPreventDefault()?bb:ba):this.type=a,b&&p.extend(this,b),this.timeStamp=a&&a.timeStamp||p.now(),this[p.expando]=!0;else return new p.Event(a,b)},p.Event.prototype={preventDefault:function(){this.isDefaultPrevented=bb;var a=this.originalEvent;if(!a)return;a.preventDefault?a.preventDefault():a.returnValue=!1},stopPropagation:function(){this.isPropagationStopped=bb;var a=this.originalEvent;if(!a)return;a.stopPropagation&&a.stopPropagation(),a.cancelBubble=!0},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=bb,this.stopPropagation()},isDefaultPrevented:ba,isPropagationStopped:ba,isImmediatePropagationStopped:ba},p.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(a,b){p.event.special[a]={delegateType:b,bindType:b,handle:function(a){var c,d=this,e=a.relatedTarget,f=a.handleObj,g=f.selector;if(!e||e!==d&&!p.contains(d,e))a.type=f.origType,c=f.handler.apply(this,arguments),a.type=b;return c}}}),p.support.submitBubbles||(p.event.special.submit={setup:function(){if(p.nodeName(this,"form"))return!1;p.event.add(this,"click._submit keypress._submit",function(a){var c=a.target,d=p.nodeName(c,"input")||p.nodeName(c,"button")?c.form:b;d&&!p._data(d,"_submit_attached")&&(p.event.add(d,"submit._submit",function(a){a._submit_bubble=!0}),p._data(d,"_submit_attached",!0))})},postDispatch:function(a){a._submit_bubble&&(delete a._submit_bubble,this.parentNode&&!a.isTrigger&&p.event.simulate("submit",this.parentNode,a,!0))},teardown:function(){if(p.nodeName(this,"form"))return!1;p.event.remove(this,"._submit")}}),p.support.changeBubbles||(p.event.special.change={setup:function(){if(V.test(this.nodeName)){if(this.type==="checkbox"||this.type==="radio")p.event.add(this,"propertychange._change",function(a){a.originalEvent.propertyName==="checked"&&(this._just_changed=!0)}),p.event.add(this,"click._change",function(a){this._just_changed&&!a.isTrigger&&(this._just_changed=!1),p.event.simulate("change",this,a,!0)});return!1}p.event.add(this,"beforeactivate._change",function(a){var b=a.target;V.test(b.nodeName)&&!p._data(b,"_change_attached")&&(p.event.add(b,"change._change",function(a){this.parentNode&&!a.isSimulated&&!a.isTrigger&&p.event.simulate("change",this.parentNode,a,!0)}),p._data(b,"_change_attached",!0))})},handle:function(a){var b=a.target;if(this!==b||a.isSimulated||a.isTrigger||b.type!=="radio"&&b.type!=="checkbox")return a.handleObj.handler.apply(this,arguments)},teardown:function(){return p.event.remove(this,"._change"),V.test(this.nodeName)}}),p.support.focusinBubbles||p.each({focus:"focusin",blur:"focusout"},function(a,b){var c=0,d=function(a){p.event.simulate(b,a.target,p.event.fix(a),!0)};p.event.special[b]={setup:function(){c++===0&&e.addEventListener(a,d,!0)},teardown:function(){--c===0&&e.removeEventListener(a,d,!0)}}}),p.fn.extend({on:function(a,c,d,e,f){var g,h;if(typeof a=="object"){typeof c!="string"&&(d=d||c,c=b);for(h in a)this.on(h,c,d,a[h],f);return this}d==null&&e==null?(e=c,d=c=b):e==null&&(typeof c=="string"?(e=d,d=b):(e=d,d=c,c=b));if(e===!1)e=ba;else if(!e)return this;return f===1&&(g=e,e=function(a){return p().off(a),g.apply(this,arguments)},e.guid=g.guid||(g.guid=p.guid++)),this.each(function(){p.event.add(this,a,e,d,c)})},one:function(a,b,c,d){return this.on(a,b,c,d,1)},off:function(a,c,d){var e,f;if(a&&a.preventDefault&&a.handleObj)return e=a.handleObj,p(a.delegateTarget).off(e.namespace?e.origType+"."+e.namespace:e.origType,e.selector,e.handler),this;if(typeof a=="object"){for(f in a)this.off(f,c,a[f]);return this}if(c===!1||typeof c=="function")d=c,c=b;return d===!1&&(d=ba),this.each(function(){p.event.remove(this,a,d,c)})},bind:function(a,b,c){return this.on(a,null,b,c)},unbind:function(a,b){return this.off(a,null,b)},live:function(a,b,c){return p(this.context).on(a,this.selector,b,c),this},die:function(a,b){return p(this.context).off(a,this.selector||"**",b),this},delegate:function(a,b,c,d){return this.on(b,a,c,d)},undelegate:function(a,b,c){return arguments.length==1?this.off(a,"**"):this.off(b,a||"**",c)},trigger:function(a,b){return this.each(function(){p.event.trigger(a,b,this)})},triggerHandler:function(a,b){if(this[0])return p.event.trigger(a,b,this[0],!0)},toggle:function(a){var b=arguments,c=a.guid||p.guid++,d=0,e=function(c){var e=(p._data(this,"lastToggle"+a.guid)||0)%d;return p._data(this,"lastToggle"+a.guid,e+1),c.preventDefault(),b[e].apply(this,arguments)||!1};e.guid=c;while(d<b.length)b[d++].guid=c;return this.click(e)},hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)}}),p.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(a,b){p.fn[b]=function(a,c){return c==null&&(c=a,a=null),arguments.length>0?this.on(b,null,a,c):this.trigger(b)},Y.test(b)&&(p.event.fixHooks[b]=p.event.keyHooks),Z.test(b)&&(p.event.fixHooks[b]=p.event.mouseHooks)}),function(a,b){function bd(a,b,c,d){var e=0,f=b.length;for(;e<f;e++)Z(a,b[e],c,d)}function be(a,b,c,d,e,f){var g,h=$.setFilters[b.toLowerCase()];return h||Z.error(b),(a||!(g=e))&&bd(a||"*",d,g=[],e),g.length>0?h(g,c,f):[]}function bf(a,c,d,e,f){var g,h,i,j,k,l,m,n,p=0,q=f.length,s=L.POS,t=new RegExp("^"+s.source+"(?!"+r+")","i"),u=function(){var a=1,c=arguments.length-2;for(;a<c;a++)arguments[a]===b&&(g[a]=b)};for(;p<q;p++){s.exec(""),a=f[p],j=[],i=0,k=e;while(g=s.exec(a)){n=s.lastIndex=g.index+g[0].length;if(n>i){m=a.slice(i,g.index),i=n,l=[c],B.test(m)&&(k&&(l=k),k=e);if(h=H.test(m))m=m.slice(0,-5).replace(B,"$&*");g.length>1&&g[0].replace(t,u),k=be(m,g[1],g[2],l,k,h)}}k?(j=j.concat(k),(m=a.slice(i))&&m!==")"?B.test(m)?bd(m,j,d,e):Z(m,c,d,e?e.concat(k):k):o.apply(d,j)):Z(a,c,d,e)}return q===1?d:Z.uniqueSort(d)}function bg(a,b,c){var d,e,f,g=[],i=0,j=D.exec(a),k=!j.pop()&&!j.pop(),l=k&&a.match(C)||[""],m=$.preFilter,n=$.filter,o=!c&&b!==h;for(;(e=l[i])!=null&&k;i++){g.push(d=[]),o&&(e=" "+e);while(e){k=!1;if(j=B.exec(e))e=e.slice(j[0].length),k=d.push({part:j.pop().replace(A," "),captures:j});for(f in n)(j=L[f].exec(e))&&(!m[f]||(j=m[f](j,b,c)))&&(e=e.slice(j.shift().length),k=d.push({part:f,captures:j}));if(!k)break}}return k||Z.error(a),g}function bh(a,b,e){var f=b.dir,g=m++;return a||(a=function(a){return a===e}),b.first?function(b,c){while(b=b[f])if(b.nodeType===1)return a(b,c)&&b}:function(b,e){var h,i=g+"."+d,j=i+"."+c;while(b=b[f])if(b.nodeType===1){if((h=b[q])===j)return b.sizset;if(typeof h=="string"&&h.indexOf(i)===0){if(b.sizset)return b}else{b[q]=j;if(a(b,e))return b.sizset=!0,b;b.sizset=!1}}}}function bi(a,b){return a?function(c,d){var e=b(c,d);return e&&a(e===!0?c:e,d)}:b}function bj(a,b,c){var d,e,f=0;for(;d=a[f];f++)$.relative[d.part]?e=bh(e,$.relative[d.part],b):(d.captures.push(b,c),e=bi(e,$.filter[d.part].apply(null,d.captures)));return e}function bk(a){return function(b,c){var d,e=0;for(;d=a[e];e++)if(d(b,c))return!0;return!1}}var c,d,e,f,g,h=a.document,i=h.documentElement,j="undefined",k=!1,l=!0,m=0,n=[].slice,o=[].push,q=("sizcache"+Math.random()).replace(".",""),r="[\\x20\\t\\r\\n\\f]",s="(?:\\\\.|[-\\w]|[^\\x00-\\xa0])+",t=s.replace("w","w#"),u="([*^$|!~]?=)",v="\\["+r+"*("+s+")"+r+"*(?:"+u+r+"*(?:([''\"])((?:\\\\.|[^\\\\])*?)\\3|("+t+")|)|)"+r+"*\\]",w=":("+s+")(?:\\((?:([''\"])((?:\\\\.|[^\\\\])*?)\\2|((?:[^,]|\\\\,|(?:,(?=[^\\[]*\\]))|(?:,(?=[^\\(]*\\))))*))\\)|)",x=":(nth|eq|gt|lt|first|last|even|odd)(?:\\((\\d*)\\)|)(?=[^-]|$)",y=r+"*([\\x20\\t\\r\\n\\f>+~])"+r+"*",z="(?=[^\\x20\\t\\r\\n\\f])(?:\\\\.|"+v+"|"+w.replace(2,7)+"|[^\\\\(),])+",A=new RegExp("^"+r+"+|((?:^|[^\\\\])(?:\\\\.)*)"+r+"+$","g"),B=new RegExp("^"+y),C=new RegExp(z+"?(?="+r+"*,|$)","g"),D=new RegExp("^(?:(?!,)(?:(?:^|,)"+r+"*"+z+")*?|"+r+"*(.*?))(\\)|$)"),E=new RegExp(z.slice(19,-6)+"\\x20\\t\\r\\n\\f>+~])+|"+y,"g"),F=/^(?:#([\w\-]+)|(\w+)|\.([\w\-]+))$/,G=/[\x20\t\r\n\f]*[+~]/,H=/:not\($/,I=/h\d/i,J=/input|select|textarea|button/i,K=/\\(?!\\)/g,L={ID:new RegExp("^#("+s+")"),CLASS:new RegExp("^\\.("+s+")"),NAME:new RegExp("^\\[name=[''\"]?("+s+")[''\"]?\\]"),TAG:new RegExp("^("+s.replace("[-","[-\\*")+")"),ATTR:new RegExp("^"+v),PSEUDO:new RegExp("^"+w),CHILD:new RegExp("^:(only|nth|last|first)-child(?:\\("+r+"*(even|odd|(([+-]|)(\\d*)n|)"+r+"*(?:([+-]|)"+r+"*(\\d+)|))"+r+"*\\)|)","i"),POS:new RegExp(x,"ig"),needsContext:new RegExp("^"+r+"*[>+~]|"+x,"i")},M={},N=[],O={},P=[],Q=function(a){return a.sizzleFilter=!0,a},R=function(a){return function(b){return b.nodeName.toLowerCase()==="input"&&b.type===a}},S=function(a){return function(b){var c=b.nodeName.toLowerCase();return(c==="input"||c==="button")&&b.type===a}},T=function(a){var b=!1,c=h.createElement("div");try{b=a(c)}catch(d){}return c=null,b},U=T(function(a){a.innerHTML="<select></select>";var b=typeof a.lastChild.getAttribute("multiple");return b!=="boolean"&&b!=="string"}),V=T(function(a){a.id=q+0,a.innerHTML="<a name=''"+q+"''></a><div name=''"+q+"''></div>",i.insertBefore(a,i.firstChild);var b=h.getElementsByName&&h.getElementsByName(q).length===2+h.getElementsByName(q+0).length;return g=!h.getElementById(q),i.removeChild(a),b}),W=T(function(a){return a.appendChild(h.createComment("")),a.getElementsByTagName("*").length===0}),X=T(function(a){return a.innerHTML="<a href=''#''></a>",a.firstChild&&typeof a.firstChild.getAttribute!==j&&a.firstChild.getAttribute("href")==="#"}),Y=T(function(a){return a.innerHTML="<div class=''hidden e''></div><div class=''hidden''></div>",!a.getElementsByClassName||a.getElementsByClassName("e").length===0?!1:(a.lastChild.className="e",a.getElementsByClassName("e").length!==1)}),Z=function(a,b,c,d){c=c||[],b=b||h;var e,f,g,i,j=b.nodeType;if(j!==1&&j!==9)return[];if(!a||typeof a!="string")return c;g=ba(b);if(!g&&!d)if(e=F.exec(a))if(i=e[1]){if(j===9){f=b.getElementById(i);if(!f||!f.parentNode)return c;if(f.id===i)return c.push(f),c}else if(b.ownerDocument&&(f=b.ownerDocument.getElementById(i))&&bb(b,f)&&f.id===i)return c.push(f),c}else{if(e[2])return o.apply(c,n.call(b.getElementsByTagName(a),0)),c;if((i=e[3])&&Y&&b.getElementsByClassName)return o.apply(c,n.call(b.getElementsByClassName(i),0)),c}return bm(a,b,c,d,g)},$=Z.selectors={cacheLength:50,match:L,order:["ID","TAG"],attrHandle:{},createPseudo:Q,find:{ID:g?function(a,b,c){if(typeof b.getElementById!==j&&!c){var d=b.getElementById(a);return d&&d.parentNode?[d]:[]}}:function(a,c,d){if(typeof c.getElementById!==j&&!d){var e=c.getElementById(a);return e?e.id===a||typeof e.getAttributeNode!==j&&e.getAttributeNode("id").value===a?[e]:b:[]}},TAG:W?function(a,b){if(typeof b.getElementsByTagName!==j)return b.getElementsByTagName(a)}:function(a,b){var c=b.getElementsByTagName(a);if(a==="*"){var d,e=[],f=0;for(;d=c[f];f++)d.nodeType===1&&e.push(d);return e}return c}},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(a){return a[1]=a[1].replace(K,""),a[3]=(a[4]||a[5]||"").replace(K,""),a[2]==="~="&&(a[3]=" "+a[3]+" "),a.slice(0,4)},CHILD:function(a){return a[1]=a[1].toLowerCase(),a[1]==="nth"?(a[2]||Z.error(a[0]),a[3]=+(a[3]?a[4]+(a[5]||1):2*(a[2]==="even"||a[2]==="odd")),a[4]=+(a[6]+a[7]||a[2]==="odd")):a[2]&&Z.error(a[0]),a},PSEUDO:function(a){var b,c=a[4];return L.CHILD.test(a[0])?null:(c&&(b=D.exec(c))&&b.pop()&&(a[0]=a[0].slice(0,b[0].length-c.length-1),c=b[0].slice(0,-1)),a.splice(2,3,c||a[3]),a)}},filter:{ID:g?function(a){return a=a.replace(K,""),function(b){return b.getAttribute("id")===a}}:function(a){return a=a.replace(K,""),function(b){var c=typeof b.getAttributeNode!==j&&b.getAttributeNode("id");return c&&c.value===a}},TAG:function(a){return a==="*"?function(){return!0}:(a=a.replace(K,"").toLowerCase(),function(b){return b.nodeName&&b.nodeName.toLowerCase()===a})},CLASS:function(a){var b=M[a];return b||(b=M[a]=new RegExp("(^|"+r+")"+a+"("+r+"|$)"),N.push(a),N.length>$.cacheLength&&delete M[N.shift()]),function(a){return b.test(a.className||typeof a.getAttribute!==j&&a.getAttribute("class")||"")}},ATTR:function(a,b,c){return b?function(d){var e=Z.attr(d,a),f=e+"";if(e==null)return b==="!=";switch(b){case"=":return f===c;case"!=":return f!==c;case"^=":return c&&f.indexOf(c)===0;case"*=":return c&&f.indexOf(c)>-1;case"$=":return c&&f.substr(f.length-c.length)===c;case"~=":return(" "+f+" ").indexOf(c)>-1;case"|=":return f===c||f.substr(0,c.length+1)===c+"-"}}:function(b){return Z.attr(b,a)!=null}},CHILD:function(a,b,c,d){if(a==="nth"){var e=m++;return function(a){var b,f,g=0,h=a;if(c===1&&d===0)return!0;b=a.parentNode;if(b&&(b[q]!==e||!a.sizset)){for(h=b.firstChild;h;h=h.nextSibling)if(h.nodeType===1){h.sizset=++g;if(h===a)break}b[q]=e}return f=a.sizset-d,c===0?f===0:f%c===0&&f/c>=0}}return function(b){var c=b;switch(a){case"only":case"first":while(c=c.previousSibling)if(c.nodeType===1)return!1;if(a==="first")return!0;c=b;case"last":while(c=c.nextSibling)if(c.nodeType===1)return!1;return!0}}},PSEUDO:function(a,b,c,d){var e=$.pseudos[a]||$.pseudos[a.toLowerCase()];return e||Z.error("unsupported pseudo: "+a),e.sizzleFilter?e(b,c,d):e}},pseudos:{not:Q(function(a,b,c){var d=bl(a.replace(A,"$1"),b,c);return function(a){return!d(a)}}),enabled:function(a){return a.disabled===!1},disabled:function(a){return a.disabled===!0},checked:function(a){var b=a.nodeName.toLowerCase();return b==="input"&&!!a.checked||b==="option"&&!!a.selected},selected:function(a){return a.parentNode&&a.parentNode.selectedIndex,a.selected===!0},parent:function(a){return!$.pseudos.empty(a)},empty:function(a){var b;a=a.firstChild;while(a){if(a.nodeName>"@"||(b=a.nodeType)===3||b===4)return!1;a=a.nextSibling}return!0},contains:Q(function(a){return function(b){return(b.textContent||b.innerText||bc(b)).indexOf(a)>-1}}),has:Q(function(a){return function(b){return Z(a,b).length>0}}),header:function(a){return I.test(a.nodeName)},text:function(a){var b,c;return a.nodeName.toLowerCase()==="input"&&(b=a.type)==="text"&&((c=a.getAttribute("type"))==null||c.toLowerCase()===b)},radio:R("radio"),checkbox:R("checkbox"),file:R("file"),password:R("password"),image:R("image"),submit:S("submit"),reset:S("reset"),button:function(a){var b=a.nodeName.toLowerCase();return b==="input"&&a.type==="button"||b==="button"},input:function(a){return J.test(a.nodeName)},focus:function(a){var b=a.ownerDocument;return a===b.activeElement&&(!b.hasFocus||b.hasFocus())&&(!!a.type||!!a.href)},active:function(a){return a===a.ownerDocument.activeElement}},setFilters:{first:function(a,b,c){return c?a.slice(1):[a[0]]},last:function(a,b,c){var d=a.pop();return c?a:[d]},even:function(a,b,c){var d=[],e=c?1:0,f=a.length;for(;e<f;e=e+2)d.push(a[e]);return d},odd:function(a,b,c){var d=[],e=c?0:1,f=a.length;for(;e<f;e=e+2)d.push(a[e]);return d},lt:function(a,b,c){return c?a.slice(+b):a.slice(0,+b)},gt:function(a,b,c){return c?a.slice(0,+b+1):a.slice(+b+1)},eq:function(a,b,c){var d=a.splice(+b,1);return c?a:d}}};$.setFilters.nth=$.setFilters.eq,$.filters=$.pseudos,X||($.attrHandle={href:function(a){return a.getAttribute("href",2)},type:function(a){return a.getAttribute("type")}}),V&&($.order.push("NAME"),$.find.NAME=function(a,b){if(typeof b.getElementsByName!==j)return b.getElementsByName(a)}),Y&&($.order.splice(1,0,"CLASS"),$.find.CLASS=function(a,b,c){if(typeof b.getElementsByClassName!==j&&!c)return b.getElementsByClassName(a)});try{n.call(i.childNodes,0)[0].nodeType}catch(_){n=function(a){var b,c=[];for(;b=this[a];a++)c.push(b);return c}}var ba=Z.isXML=function(a){var b=a&&(a.ownerDocument||a).documentElement;return b?b.nodeName!=="HTML":!1},bb=Z.contains=i.compareDocumentPosition?function(a,b){return!!(a.compareDocumentPosition(b)&16)}:i.contains?function(a,b){var c=a.nodeType===9?a.documentElement:a,d=b.parentNode;return a===d||!!(d&&d.nodeType===1&&c.contains&&c.contains(d))}:function(a,b){while(b=b.parentNode)if(b===a)return!0;return!1},bc=Z.getText=function(a){var b,c="",d=0,e=a.nodeType;if(e){if(e===1||e===9||e===11){if(typeof a.textContent=="string")return a.textContent;for(a=a.firstChild;a;a=a.nextSibling)c+=bc(a)}else if(e===3||e===4)return a.nodeValue}else for(;b=a[d];d++)c+=bc(b);return c};Z.attr=function(a,b){var c,d=ba(a);return d||(b=b.toLowerCase()),$.attrHandle[b]?$.attrHandle[b](a):U||d?a.getAttribute(b):(c=a.getAttributeNode(b),c?typeof a[b]=="boolean"?a[b]?b:null:c.specified?c.value:null:null)},Z.error=function(a){throw new Error("Syntax error, unrecognized expression: "+a)},[0,0].sort(function(){return l=0}),i.compareDocumentPosition?e=function(a,b){return a===b?(k=!0,0):(!a.compareDocumentPosition||!b.compareDocumentPosition?a.compareDocumentPosition:a.compareDocumentPosition(b)&4)?-1:1}:(e=function(a,b){if(a===b)return k=!0,0;if(a.sourceIndex&&b.sourceIndex)return a.sourceIndex-b.sourceIndex;var c,d,e=[],g=[],h=a.parentNode,i=b.parentNode,j=h;if(h===i)return f(a,b);if(!h)return-1;if(!i)return 1;while(j)e.unshift(j),j=j.parentNode;j=i;while(j)g.unshift(j),j=j.parentNode;c=e.length,d=g.length;for(var l=0;l<c&&l<d;l++)if(e[l]!==g[l])return f(e[l],g[l]);return l===c?f(a,g[l],-1):f(e[l],b,1)},f=function(a,b,c){if(a===b)return c;var d=a.nextSibling;while(d){if(d===b)return-1;d=d.nextSibling}return 1}),Z.uniqueSort=function(a){var b,c=1;if(e){k=l,a.sort(e);if(k)for(;b=a[c];c++)b===a[c-1]&&a.splice(c--,1)}return a};var bl=Z.compile=function(a,b,c){var d,e,f,g=O[a];if(g&&g.context===b)return g;e=bg(a,b,c);for(f=0;d=e[f];f++)e[f]=bj(d,b,c);return g=O[a]=bk(e),g.context=b,g.runs=g.dirruns=0,P.push(a),P.length>$.cacheLength&&delete O[P.shift()],g};Z.matches=function(a,b){return Z(a,null,null,b)},Z.matchesSelector=function(a,b){return Z(b,null,null,[a]).length>0};var bm=function(a,b,e,f,g){a=a.replace(A,"$1");var h,i,j,k,l,m,p,q,r,s=a.match(C),t=a.match(E),u=b.nodeType;if(L.POS.test(a))return bf(a,b,e,f,s);if(f)h=n.call(f,0);else if(s&&s.length===1){if(t.length>1&&u===9&&!g&&(s=L.ID.exec(t[0]))){b=$.find.ID(s[1],b,g)[0];if(!b)return e;a=a.slice(t.shift().length)}q=(s=G.exec(t[0]))&&!s.index&&b.parentNode||b,r=t.pop(),m=r.split(":not")[0];for(j=0,k=$.order.length;j<k;j++){p=$.order[j];if(s=L[p].exec(m)){h=$.find[p]((s[1]||"").replace(K,""),q,g);if(h==null)continue;m===r&&(a=a.slice(0,a.length-r.length)+m.replace(L[p],""),a||o.apply(e,n.call(h,0)));break}}}if(a){i=bl(a,b,g),d=i.dirruns++,h==null&&(h=$.find.TAG("*",G.test(a)&&b.parentNode||b));for(j=0;l=h[j];j++)c=i.runs++,i(l,b)&&e.push(l)}return e};h.querySelectorAll&&function(){var a,b=bm,c=/''|\\/g,d=/\=[\x20\t\r\n\f]*([^''"\]]*)[\x20\t\r\n\f]*\]/g,e=[],f=[":active"],g=i.matchesSelector||i.mozMatchesSelector||i.webkitMatchesSelector||i.oMatchesSelector||i.msMatchesSelector;T(function(a){a.innerHTML="<select><option selected></option></select>",a.querySelectorAll("[selected]").length||e.push("\\["+r+"*(?:checked|disabled|ismap|multiple|readonly|selected|value)"),a.querySelectorAll(":checked").length||e.push(":checked")}),T(function(a){a.innerHTML="<p test=''''></p>",a.querySelectorAll("[test^='''']").length&&e.push("[*^$]="+r+"*(?:\"\"|'''')"),a.innerHTML="<input type=''hidden''>",a.querySelectorAll(":enabled").length||e.push(":enabled",":disabled")}),e=e.length&&new RegExp(e.join("|")),bm=function(a,d,f,g,h){if(!g&&!h&&(!e||!e.test(a)))if(d.nodeType===9)try{return o.apply(f,n.call(d.querySelectorAll(a),0)),f}catch(i){}else if(d.nodeType===1&&d.nodeName.toLowerCase()!=="object"){var j=d.getAttribute("id"),k=j||q,l=G.test(a)&&d.parentNode||d;j?k=k.replace(c,"\\$&"):d.setAttribute("id",k);try{return o.apply(f,n.call(l.querySelectorAll(a.replace(C,"[id=''"+k+"''] $&")),0)),f}catch(i){}finally{j||d.removeAttribute("id")}}return b(a,d,f,g,h)},g&&(T(function(b){a=g.call(b,"div");try{g.call(b,"[test!='''']:sizzle"),f.push($.match.PSEUDO)}catch(c){}}),f=new RegExp(f.join("|")),Z.matchesSelector=function(b,c){c=c.replace(d,"=''$1'']");if(!ba(b)&&!f.test(c)&&(!e||!e.test(c)))try{var h=g.call(b,c);if(h||a||b.document&&b.document.nodeType!==11)return h}catch(i){}return Z(c,null,null,[b]).length>0})}(),Z.attr=p.attr,p.find=Z,p.expr=Z.selectors,p.expr[":"]=p.expr.pseudos,p.unique=Z.uniqueSort,p.text=Z.getText,p.isXMLDoc=Z.isXML,p.contains=Z.contains}(a);var bc=/Until$/,bd=/^(?:parents|prev(?:Until|All))/,be=/^.[^:#\[\.,]*$/,bf=p.expr.match.needsContext,bg={children:!0,contents:!0,next:!0,prev:!0};p.fn.extend({find:function(a){var b,c,d,e,f,g,h=this;if(typeof a!="string")return p(a).filter(function(){for(b=0,c=h.length;b<c;b++)if(p.contains(h[b],this))return!0});g=this.pushStack("","find",a);for(b=0,c=this.length;b<c;b++){d=g.length,p.find(a,this[b],g);if(b>0)for(e=d;e<g.length;e++)for(f=0;f<d;f++)if(g[f]===g[e]){g.splice(e--,1);break}}return g},has:function(a){var b,c=p(a,this),d=c.length;return this.filter(function(){for(b=0;b<d;b++)if(p.contains(this,c[b]))return!0})},not:function(a){return this.pushStack(bj(this,a,!1),"not",a)},filter:function(a){return this.pushStack(bj(this,a,!0),"filter",a)},is:function(a){return!!a&&(typeof a=="string"?bf.test(a)?p(a,this.context).index(this[0])>=0:p.filter(a,this).length>0:this.filter(a).length>0)},closest:function(a,b){var c,d=0,e=this.length,f=[],g=bf.test(a)||typeof a!="string"?p(a,b||this.context):0;for(;d<e;d++){c=this[d];while(c&&c.ownerDocument&&c!==b&&c.nodeType!==11){if(g?g.index(c)>-1:p.find.matchesSelector(c,a)){f.push(c);break}c=c.parentNode}}return f=f.length>1?p.unique(f):f,this.pushStack(f,"closest",a)},index:function(a){return a?typeof a=="string"?p.inArray(this[0],p(a)):p.inArray(a.jquery?a[0]:a,this):this[0]&&this[0].parentNode?this.prevAll().length:-1},add:function(a,b){var c=typeof a=="string"?p(a,b):p.makeArray(a&&a.nodeType?[a]:a),d=p.merge(this.get(),c);return this.pushStack(bh(c[0])||bh(d[0])?d:p.unique(d))},addBack:function(a){return this.add(a==null?this.prevObject:this.prevObject.filter(a))}}),p.fn.andSelf=p.fn.addBack,p.each({parent:function(a){var b=a.parentNode;return b&&b.nodeType!==11?b:null},parents:function(a){return p.dir(a,"parentNode")},parentsUntil:function(a,b,c){return p.dir(a,"parentNode",c)},next:function(a){return bi(a,"nextSibling")},prev:function(a){return bi(a,"previousSibling")},nextAll:function(a){return p.dir(a,"nextSibling")},prevAll:function(a){return p.dir(a,"previousSibling")},nextUntil:function(a,b,c){return p.dir(a,"nextSibling",c)},prevUntil:function(a,b,c){return p.dir(a,"previousSibling",c)},siblings:function(a){return p.sibling((a.parentNode||{}).firstChild,a)},children:function(a){return p.sibling(a.firstChild)},contents:function(a){return p.nodeName(a,"iframe")?a.contentDocument||a.contentWindow.document:p.merge([],a.childNodes)}},function(a,b){p.fn[a]=function(c,d){var e=p.map(this,b,c);return bc.test(a)||(d=c),d&&typeof d=="string"&&(e=p.filter(d,e)),e=this.length>1&&!bg[a]?p.unique(e):e,this.length>1&&bd.test(a)&&(e=e.reverse()),this.pushStack(e,a,k.call(arguments).join(","))}}),p.extend({filter:function(a,b,c){return c&&(a=":not("+a+")"),b.length===1?p.find.matchesSelector(b[0],a)?[b[0]]:[]:p.find.matches(a,b)},dir:function(a,c,d){var e=[],f=a[c];while(f&&f.nodeType!==9&&(d===b||f.nodeType!==1||!p(f).is(d)))f.nodeType===1&&e.push(f),f=f[c];return e},sibling:function(a,b){var c=[];for(;a;a=a.nextSibling)a.nodeType===1&&a!==b&&c.push(a);return c}});var bl="abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",bm=/ jQuery\d+="(?:null|\d+)"/g,bn=/^\s+/,bo=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,bp=/<([\w:]+)/,bq=/<tbody/i,br=/<|&#?\w+;/,bs=/<(?:script|style|link)/i,bt=/<(?:script|object|embed|option|style)/i,bu=new RegExp("<(?:"+bl+")[\\s/>]","i"),bv=/^(?:checkbox|radio)$/,bw=/checked\s*(?:[^=]|=\s*.checked.)/i,bx=/\/(java|ecma)script/i,by=/^\s*<!(?:\[CDATA\[|\-\-)|[\]\-]{2}>\s*$/g,bz={option:[1,"<select multiple=''multiple''>","</select>"],legend:[1,"<fieldset>","</fieldset>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],area:[1,"<map>","</map>"],_default:[0,"",""]},bA=bk(e),bB=bA.appendChild(e.createElement("div"));bz.optgroup=bz.option,bz.tbody=bz.tfoot=bz.colgroup=bz.caption=bz.thead,bz.th=bz.td,p.support.htmlSerialize||(bz._default=[1,"X<div>","</div>"]),p.fn.extend({text:function(a){return p.access(this,function(a){return a===b?p.text(this):this.empty().append((this[0]&&this[0].ownerDocument||e).createTextNode(a))},null,a,arguments.length)},wrapAll:function(a){if(p.isFunction(a))return this.each(function(b){p(this).wrapAll(a.call(this,b))});if(this[0]){var b=p(a,this[0].ownerDocument).eq(0).clone(!0);this[0].parentNode&&b.insertBefore(this[0]),b.map(function(){var a=this;while(a.firstChild&&a.firstChild.nodeType===1)a=a.firstChild;return a}).append(this)}return this},wrapInner:function(a){return p.isFunction(a)?this.each(function(b){p(this).wrapInner(a.call(this,b))}):this.each(function(){var b=p(this),c=b.contents();c.length?c.wrapAll(a):b.append(a)})},wrap:function(a){var b=p.isFunction(a);return this.each(function(c){p(this).wrapAll(b?a.call(this,c):a)})},unwrap:function(){return this.parent().each(function(){p.nodeName(this,"body")||p(this).replaceWith(this.childNodes)}).end()},append:function(){return this.domManip(arguments,!0,function(a){(this.nodeType===1||this.nodeType===11)&&this.appendChild(a)})},prepend:function(){return this.domManip(arguments,!0,function(a){(this.nodeType===1||this.nodeType===11)&&this.insertBefore(a,this.firstChild)})},before:function(){if(!bh(this[0]))return this.domManip(arguments,!1,function(a){this.parentNode.insertBefore(a,this)});if(arguments.length){var a=p.clean(arguments);return this.pushStack(p.merge(a,this),"before",this.selector)}},after:function(){if(!bh(this[0]))return this.domManip(arguments,!1,function(a){this.parentNode.insertBefore(a,this.nextSibling)});if(arguments.length){var a=p.clean(arguments);return this.pushStack(p.merge(this,a),"after",this.selector)}},remove:function(a,b){var c,d=0;for(;(c=this[d])!=null;d++)if(!a||p.filter(a,[c]).length)!b&&c.nodeType===1&&(p.cleanData(c.getElementsByTagName("*")),p.cleanData([c])),c.parentNode&&c.parentNode.removeChild(c);return this},empty:function(){var a,b=0;for(;(a=this[b])!=null;b++){a.nodeType===1&&p.cleanData(a.getElementsByTagName("*"));while(a.firstChild)a.removeChild(a.firstChild)}return this},clone:function(a,b){return a=a==null?!1:a,b=b==null?a:b,this.map(function(){return p.clone(this,a,b)})},html:function(a){return p.access(this,function(a){var c=this[0]||{},d=0,e=this.length;if(a===b)return c.nodeType===1?c.innerHTML.replace(bm,""):b;if(typeof a=="string"&&!bs.test(a)&&(p.support.htmlSerialize||!bu.test(a))&&(p.support.leadingWhitespace||!bn.test(a))&&!bz[(bp.exec(a)||["",""])[1].toLowerCase()]){a=a.replace(bo,"<$1></$2>");try{for(;d<e;d++)c=this[d]||{},c.nodeType===1&&(p.cleanData(c.getElementsByTagName("*")),c.innerHTML=a);c=0}catch(f){}}c&&this.empty().append(a)},null,a,arguments.length)},replaceWith:function(a){return bh(this[0])?this.length?this.pushStack(p(p.isFunction(a)?a():a),"replaceWith",a):this:p.isFunction(a)?this.each(function(b){var c=p(this),d=c.html();c.replaceWith(a.call(this,b,d))}):(typeof a!="string"&&(a=p(a).detach()),this.each(function(){var b=this.nextSibling,c=this.parentNode;p(this).remove(),b?p(b).before(a):p(c).append(a)}))},detach:function(a){return this.remove(a,!0)},domManip:function(a,c,d){a=[].concat.apply([],a);var e,f,g,h,i=0,j=a[0],k=[],l=this.length;if(!p.support.checkClone&&l>1&&typeof j=="string"&&bw.test(j))return this.each(function(){p(this).domManip(a,c,d)});if(p.isFunction(j))return this.each(function(e){var f=p(this);a[0]=j.call(this,e,c?f.html():b),f.domManip(a,c,d)});if(this[0]){e=p.buildFragment(a,this,k),g=e.fragment,f=g.firstChild,g.childNodes.length===1&&(g=f);if(f){c=c&&p.nodeName(f,"tr");for(h=e.cacheable||l-1;i<l;i++)d.call(c&&p.nodeName(this[i],"table")?bC(this[i],"tbody"):this[i],i===h?g:p.clone(g,!0,!0))}g=f=null,k.length&&p.each(k,function(a,b){b.src?p.ajax?p.ajax({url:b.src,type:"GET",dataType:"script",async:!1,global:!1,"throws":!0}):p.error("no ajax"):p.globalEval((b.text||b.textContent||b.innerHTML||"").replace(by,"")),b.parentNode&&b.parentNode.removeChild(b)})}return this}}),p.buildFragment=function(a,c,d){var f,g,h,i=a[0];return c=c||e,c=(c[0]||c).ownerDocument||c[0]||c,typeof c.createDocumentFragment=="undefined"&&(c=e),a.length===1&&typeof i=="string"&&i.length<512&&c===e&&i.charAt(0)==="<"&&!bt.test(i)&&(p.support.checkClone||!bw.test(i))&&(p.support.html5Clone||!bu.test(i))&&(g=!0,f=p.fragments[i],h=f!==b),f||(f=c.createDocumentFragment(),p.clean(a,c,f,d),g&&(p.fragments[i]=h&&f)),{fragment:f,cacheable:g}},p.fragments={},p.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(a,b){p.fn[a]=function(c){var d,e=0,f=[],g=p(c),h=g.length,i=this.length===1&&this[0].parentNode;if((i==null||i&&i.nodeType===11&&i.childNodes.length===1)&&h===1)return g[b](this[0]),this;for(;e<h;e++)d=(e>0?this.clone(!0):this).get(),p(g[e])[b](d),f=f.concat(d);return this.pushStack(f,a,g.selector)}}),p.extend({clone:function(a,b,c){var d,e,f,g;p.support.html5Clone||p.isXMLDoc(a)||!bu.test("<"+a.nodeName+">")?g=a.cloneNode(!0):(bB.innerHTML=a.outerHTML,bB.removeChild(g=bB.firstChild));if((!p.support.noCloneEvent||!p.support.noCloneChecked)&&(a.nodeType===1||a.nodeType===11)&&!p.isXMLDoc(a)){bE(a,g),d=bF(a),e=bF(g);for(f=0;d[f];++f)e[f]&&bE(d[f],e[f])}if(b){bD(a,g);if(c){d=bF(a),e=bF(g);for(f=0;d[f];++f)bD(d[f],e[f])}}return d=e=null,g},clean:function(a,b,c,d){var f,g,h,i,j,k,l,m,n,o,q,r,s=0,t=[];if(!b||typeof b.createDocumentFragment=="undefined")b=e;for(g=b===e&&bA;(h=a[s])!=null;s++){typeof h=="number"&&(h+="");if(!h)continue;if(typeof h=="string")if(!br.test(h))h=b.createTextNode(h);else{g=g||bk(b),l=l||g.appendChild(b.createElement("div")),h=h.replace(bo,"<$1></$2>"),i=(bp.exec(h)||["",""])[1].toLowerCase(),j=bz[i]||bz._default,k=j[0],l.innerHTML=j[1]+h+j[2];while(k--)l=l.lastChild;if(!p.support.tbody){m=bq.test(h),n=i==="table"&&!m?l.firstChild&&l.firstChild.childNodes:j[1]==="<table>"&&!m?l.childNodes:[];for(f=n.length-1;f>=0;--f)p.nodeName(n[f],"tbody")&&!n[f].childNodes.length&&n[f].parentNode.removeChild(n[f])}!p.support.leadingWhitespace&&bn.test(h)&&l.insertBefore(b.createTextNode(bn.exec(h)[0]),l.firstChild),h=l.childNodes,l=g.lastChild}h.nodeType?t.push(h):t=p.merge(t,h)}l&&(g.removeChild(l),h=l=g=null);if(!p.support.appendChecked)for(s=0;(h=t[s])!=null;s++)p.nodeName(h,"input")?bG(h):typeof h.getElementsByTagName!="undefined"&&p.grep(h.getElementsByTagName("input"),bG);if(c){q=function(a){if(!a.type||bx.test(a.type))return d?d.push(a.parentNode?a.parentNode.removeChild(a):a):c.appendChild(a)};for(s=0;(h=t[s])!=null;s++)if(!p.nodeName(h,"script")||!q(h))c.appendChild(h),typeof h.getElementsByTagName!="undefined"&&(r=p.grep(p.merge([],h.getElementsByTagName("script")),q),t.splice.apply(t,[s+1,0].concat(r)),s+=r.length)}return t},cleanData:function(a,b){var c,d,e,f,g=0,h=p.expando,i=p.cache,j=p.support.deleteExpando,k=p.event.special;for(;(e=a[g])!=null;g++)if(b||p.acceptData(e)){d=e[h],c=d&&i[d];if(c){if(c.events)for(f in c.events)k[f]?p.event.remove(e,f):p.removeEvent(e,f,c.handle);i[d]&&(delete i[d],j?delete e[h]:e.removeAttribute?e.removeAttribute(h):e[h]=null,p.deletedIds.push(d))}}}}),function(){var a,b;p.uaMatch=function(a){a=a.toLowerCase();var b=/(chrome)[ \/]([\w.]+)/.exec(a)||/(webkit)[ \/]([\w.]+)/.exec(a)||/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(a)||/(msie) ([\w.]+)/.exec(a)||a.indexOf("compatible")<0&&/(mozilla)(?:.*? rv:([\w.]+)|)/.exec(a)||[];return{browser:b[1]||"",version:b[2]||"0"}},a=p.uaMatch(g.userAgent),b={},a.browser&&(b[a.browser]=!0,b.version=a.version),b.webkit&&(b.safari=!0),p.browser=b,p.sub=function(){function a(b,c){return new a.fn.init(b,c)}p.extend(!0,a,this),a.superclass=this,a.fn=a.prototype=this(),a.fn.constructor=a,a.sub=this.sub,a.fn.init=function c(c,d){return d&&d instanceof p&&!(d instanceof a)&&(d=a(d)),p.fn.init.call(this,c,d,b)},a.fn.init.prototype=a.fn;var b=a(e);return a}}();var bH,bI,bJ,bK=/alpha\([^)]*\)/i,bL=/opacity=([^)]*)/,bM=/^(top|right|bottom|left)$/,bN=/^margin/,bO=new RegExp("^("+q+")(.*)$","i"),bP=new RegExp("^("+q+")(?!px)[a-z%]+$","i"),bQ=new RegExp("^([-+])=("+q+")","i"),bR={},bS={position:"absolute",visibility:"hidden",display:"block"},bT={letterSpacing:0,fontWeight:400,lineHeight:1},bU=["Top","Right","Bottom","Left"],bV=["Webkit","O","Moz","ms"],bW=p.fn.toggle;p.fn.extend({css:function(a,c){return p.access(this,function(a,c,d){return d!==b?p.style(a,c,d):p.css(a,c)},a,c,arguments.length>1)},show:function(){return bZ(this,!0)},hide:function(){return bZ(this)},toggle:function(a,b){var c=typeof a=="boolean";return p.isFunction(a)&&p.isFunction(b)?bW.apply(this,arguments):this.each(function(){(c?a:bY(this))?p(this).show():p(this).hide()})}}),p.extend({cssHooks:{opacity:{get:function(a,b){if(b){var c=bH(a,"opacity");return c===""?"1":c}}}},cssNumber:{fillOpacity:!0,fontWeight:!0,lineHeight:!0,opacity:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":p.support.cssFloat?"cssFloat":"styleFloat"},style:function(a,c,d,e){if(!a||a.nodeType===3||a.nodeType===8||!a.style)return;var f,g,h,i=p.camelCase(c),j=a.style;c=p.cssProps[i]||(p.cssProps[i]=bX(j,i)),h=p.cssHooks[c]||p.cssHooks[i];if(d===b)return h&&"get"in h&&(f=h.get(a,!1,e))!==b?f:j[c];g=typeof d,g==="string"&&(f=bQ.exec(d))&&(d=(f[1]+1)*f[2]+parseFloat(p.css(a,c)),g="number");if(d==null||g==="number"&&isNaN(d))return;g==="number"&&!p.cssNumber[i]&&(d+="px");if(!h||!("set"in h)||(d=h.set(a,d,e))!==b)try{j[c]=d}catch(k){}},css:function(a,c,d,e){var f,g,h,i=p.camelCase(c);return c=p.cssProps[i]||(p.cssProps[i]=bX(a.style,i)),h=p.cssHooks[c]||p.cssHooks[i],h&&"get"in h&&(f=h.get(a,!0,e)),f===b&&(f=bH(a,c)),f==="normal"&&c in bT&&(f=bT[c]),d||e!==b?(g=parseFloat(f),d||p.isNumeric(g)?g||0:f):f},swap:function(a,b,c){var d,e,f={};for(e in b)f[e]=a.style[e],a.style[e]=b[e];d=c.call(a);for(e in b)a.style[e]=f[e];return d}}),a.getComputedStyle?bH=function(a,b){var c,d,e,f,g=getComputedStyle(a,null),h=a.style;return g&&(c=g[b],c===""&&!p.contains(a.ownerDocument.documentElement,a)&&(c=p.style(a,b)),bP.test(c)&&bN.test(b)&&(d=h.width,e=h.minWidth,f=h.maxWidth,h.minWidth=h.maxWidth=h.width=c,c=g.width,h.width=d,h.minWidth=e,h.maxWidth=f)),c}:e.documentElement.currentStyle&&(bH=function(a,b){var c,d,e=a.currentStyle&&a.currentStyle[b],f=a.style;return e==null&&f&&f[b]&&(e=f[b]),bP.test(e)&&!bM.test(b)&&(c=f.left,d=a.runtimeStyle&&a.runtimeStyle.left,d&&(a.runtimeStyle.left=a.currentStyle.left),f.left=b==="fontSize"?"1em":e,e=f.pixelLeft+"px",f.left=c,d&&(a.runtimeStyle.left=d)),e===""?"auto":e}),p.each(["height","width"],function(a,b){p.cssHooks[b]={get:function(a,c,d){if(c)return a.offsetWidth!==0||bH(a,"display")!=="none"?ca(a,b,d):p.swap(a,bS,function(){return ca(a,b,d)})},set:function(a,c,d){return b$(a,c,d?b_(a,b,d,p.support.boxSizing&&p.css(a,"boxSizing")==="border-box"):0)}}}),p.support.opacity||(p.cssHooks.opacity={get:function(a,b){return bL.test((b&&a.currentStyle?a.currentStyle.filter:a.style.filter)||"")?.01*parseFloat(RegExp.$1)+"":b?"1":""},set:function(a,b){var c=a.style,d=a.currentStyle,e=p.isNumeric(b)?"alpha(opacity="+b*100+")":"",f=d&&d.filter||c.filter||"";c.zoom=1;if(b>=1&&p.trim(f.replace(bK,""))===""&&c.removeAttribute){c.removeAttribute("filter");if(d&&!d.filter)return}c.filter=bK.test(f)?f.replace(bK,e):f+" "+e}}),p(function(){p.support.reliableMarginRight||(p.cssHooks.marginRight={get:function(a,b){return p.swap(a,{display:"inline-block"},function(){if(b)return bH(a,"marginRight")})}}),!p.support.pixelPosition&&p.fn.position&&p.each(["top","left"],function(a,b){p.cssHooks[b]={get:function(a,c){if(c){var d=bH(a,b);return bP.test(d)?p(a).position()[b]+"px":d}}}})}),p.expr&&p.expr.filters&&(p.expr.filters.hidden=function(a){return a.offsetWidth===0&&a.offsetHeight===0||!p.support.reliableHiddenOffsets&&(a.style&&a.style.display||bH(a,"display"))==="none"},p.expr.filters.visible=function(a){return!p.expr.filters.hidden(a)}),p.each({margin:"",padding:"",border:"Width"},function(a,b){p.cssHooks[a+b]={expand:function(c){var d,e=typeof c=="string"?c.split(" "):[c],f={};for(d=0;d<4;d++)f[a+bU[d]+b]=e[d]||e[d-2]||e[0];return f}},bN.test(a)||(p.cssHooks[a+b].set=b$)});var cc=/%20/g,cd=/\[\]$/,ce=/\r?\n/g,cf=/^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,cg=/^(?:select|textarea)/i;p.fn.extend({serialize:function(){return p.param(this.serializeArray())},serializeArray:function(){return this.map(function(){return this.elements?p.makeArray(this.elements):this}).filter(function(){return this.name&&!this.disabled&&(this.checked||cg.test(this.nodeName)||cf.test(this.type))}).map(function(a,b){var c=p(this).val();return c==null?null:p.isArray(c)?p.map(c,function(a,c){return{name:b.name,value:a.replace(ce,"\r\n")}}):{name:b.name,value:c.replace(ce,"\r\n")}}).get()}}),p.param=function(a,c){var d,e=[],f=function(a,b){b=p.isFunction(b)?b():b==null?"":b,e[e.length]=encodeURIComponent(a)+"="+encodeURIComponent(b)};c===b&&(c=p.ajaxSettings&&p.ajaxSettings.traditional);if(p.isArray(a)||a.jquery&&!p.isPlainObject(a))p.each(a,function(){f(this.name,this.value)});else for(d in a)ch(d,a[d],c,f);return e.join("&").replace(cc,"+")};var ci,cj,ck=/#.*$/,cl=/^(.*?):[ \t]*([^\r\n]*)\r?$/mg,cm=/^(?:about|app|app\-storage|.+\-extension|file|res|widget):$/,cn=/^(?:GET|HEAD)$/,co=/^\/\//,cp=/\?/,cq=/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,cr=/([?&])_=[^&]*/,cs=/^([\w\+\.\-]+:)(?:\/\/([^\/?#:]*)(?::(\d+)|)|)/,ct=p.fn.load,cu={},cv={},cw=["*/"]+["*"];try{ci=f.href}catch(cx){ci=e.createElement("a"),ci.href="",ci=ci.href}cj=cs.exec(ci.toLowerCase())||[],p.fn.load=function(a,c,d){if(typeof a!="string"&&ct)return ct.apply(this,arguments);if(!this.length)return this;var e,f,g,h=this,i=a.indexOf(" ");return i>=0&&(e=a.slice(i,a.length),a=a.slice(0,i)),p.isFunction(c)?(d=c,c=b):typeof c=="object"&&(f="POST"),p.ajax({url:a,type:f,dataType:"html",data:c,complete:function(a,b){d&&h.each(d,g||[a.responseText,b,a])}}).done(function(a){g=arguments,h.html(e?p("<div>").append(a.replace(cq,"")).find(e):a)}),this},p.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "),function(a,b){p.fn[b]=function(a){return this.on(b,a)}}),p.each(["get","post"],function(a,c){p[c]=function(a,d,e,f){return p.isFunction(d)&&(f=f||e,e=d,d=b),p.ajax({type:c,url:a,data:d,success:e,dataType:f})}}),p.extend({getScript:function(a,c){return p.get(a,b,c,"script")},getJSON:function(a,b,c){return p.get(a,b,c,"json")},ajaxSetup:function(a,b){return b?cA(a,p.ajaxSettings):(b=a,a=p.ajaxSettings),cA(a,b),a},ajaxSettings:{url:ci,isLocal:cm.test(cj[1]),global:!0,type:"GET",contentType:"application/x-www-form-urlencoded; charset=UTF-8",processData:!0,async:!0,accepts:{xml:"application/xml, text/xml",html:"text/html",text:"text/plain",json:"application/json, text/javascript","*":cw},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText"},converters:{"* text":a.String,"text html":!0,"text json":p.parseJSON,"text xml":p.parseXML},flatOptions:{context:!0,url:!0}},ajaxPrefilter:cy(cu),ajaxTransport:cy(cv),ajax:function(a,c){function y(a,c,f,i){var k,s,t,u,w,y=c;if(v===2)return;v=2,h&&clearTimeout(h),g=b,e=i||"",x.readyState=a>0?4:0,f&&(u=cB(l,x,f));if(a>=200&&a<300||a===304)l.ifModified&&(w=x.getResponseHeader("Last-Modified"),w&&(p.lastModified[d]=w),w=x.getResponseHeader("Etag"),w&&(p.etag[d]=w)),a===304?(y="notmodified",k=!0):(k=cC(l,u),y=k.state,s=k.data,t=k.error,k=!t);else{t=y;if(!y||a)y="error",a<0&&(a=0)}x.status=a,x.statusText=""+(c||y),k?o.resolveWith(m,[s,y,x]):o.rejectWith(m,[x,y,t]),x.statusCode(r),r=b,j&&n.trigger("ajax"+(k?"Success":"Error"),[x,l,k?s:t]),q.fireWith(m,[x,y]),j&&(n.trigger("ajaxComplete",[x,l]),--p.active||p.event.trigger("ajaxStop"))}typeof a=="object"&&(c=a,a=b),c=c||{};var d,e,f,g,h,i,j,k,l=p.ajaxSetup({},c),m=l.context||l,n=m!==l&&(m.nodeType||m instanceof p)?p(m):p.event,o=p.Deferred(),q=p.Callbacks("once memory"),r=l.statusCode||{},t={},u={},v=0,w="canceled",x={readyState:0,setRequestHeader:function(a,b){if(!v){var c=a.toLowerCase();a=u[c]=u[c]||a,t[a]=b}return this},getAllResponseHeaders:function(){return v===2?e:null},getResponseHeader:function(a){var c;if(v===2){if(!f){f={};while(c=cl.exec(e))f[c[1].toLowerCase()]=c[2]}c=f[a.toLowerCase()]}return c===b?null:c},overrideMimeType:function(a){return v||(l.mimeType=a),this},abort:function(a){return a=a||w,g&&g.abort(a),y(0,a),this}};o.promise(x),x.success=x.done,x.error=x.fail,x.complete=q.add,x.statusCode=function(a){if(a){var b;if(v<2)for(b in a)r[b]=[r[b],a[b]];else b=a[x.status],x.always(b)}return this},l.url=((a||l.url)+"").replace(ck,"").replace(co,cj[1]+"//"),l.dataTypes=p.trim(l.dataType||"*").toLowerCase().split(s),l.crossDomain==null&&(i=cs.exec(l.url.toLowerCase()),l.crossDomain=!(!i||i[1]==cj[1]&&i[2]==cj[2]&&(i[3]||(i[1]==="http:"?80:443))==(cj[3]||(cj[1]==="http:"?80:443)))),l.data&&l.processData&&typeof l.data!="string"&&(l.data=p.param(l.data,l.traditional)),cz(cu,l,c,x);if(v===2)return x;j=l.global,l.type=l.type.toUpperCase(),l.hasContent=!cn.test(l.type),j&&p.active++===0&&p.event.trigger("ajaxStart");if(!l.hasContent){l.data&&(l.url+=(cp.test(l.url)?"&":"?")+l.data,delete l.data),d=l.url;if(l.cache===!1){var z=p.now(),A=l.url.replace(cr,"$1_="+z);l.url=A+(A===l.url?(cp.test(l.url)?"&":"?")+"_="+z:"")}}(l.data&&l.hasContent&&l.contentType!==!1||c.contentType)&&x.setRequestHeader("Content-Type",l.contentType),l.ifModified&&(d=d||l.url,p.lastModified[d]&&x.setRequestHeader("If-Modified-Since",p.lastModified[d]),p.etag[d]&&x.setRequestHeader("If-None-Match",p.etag[d])),x.setRequestHeader("Accept",l.dataTypes[0]&&l.accepts[l.dataTypes[0]]?l.accepts[l.dataTypes[0]]+(l.dataTypes[0]!=="*"?", "+cw+"; q=0.01":""):l.accepts["*"]);for(k in l.headers)x.setRequestHeader(k,l.headers[k]);if(!l.beforeSend||l.beforeSend.call(m,x,l)!==!1&&v!==2){w="abort";for(k in{success:1,error:1,complete:1})x[k](l[k]);g=cz(cv,l,c,x);if(!g)y(-1,"No Transport");else{x.readyState=1,j&&n.trigger("ajaxSend",[x,l]),l.async&&l.timeout>0&&(h=setTimeout(function(){x.abort("timeout")},l.timeout));try{v=1,g.send(t,y)}catch(B){if(v<2)y(-1,B);else throw B}}return x}return x.abort()},active:0,lastModified:{},etag:{}});var cD=[],cE=/\?/,cF=/(=)\?(?=&|$)|\?\?/,cG=p.now();p.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var a=cD.pop()||p.expando+"_"+cG++;return this[a]=!0,a}}),p.ajaxPrefilter("json jsonp",function(c,d,e){var f,g,h,i=c.data,j=c.url,k=c.jsonp!==!1,l=k&&cF.test(j),m=k&&!l&&typeof i=="string"&&!(c.contentType||"").indexOf("application/x-www-form-urlencoded")&&cF.test(i);if(c.dataTypes[0]==="jsonp"||l||m)return f=c.jsonpCallback=p.isFunction(c.jsonpCallback)?c.jsonpCallback():c.jsonpCallback,g=a[f],l?c.url=j.replace(cF,"$1"+f):m?c.data=i.replace(cF,"$1"+f):k&&(c.url+=(cE.test(j)?"&":"?")+c.jsonp+"="+f),c.converters["script json"]=function(){return h||p.error(f+" was not called"),h[0]},c.dataTypes[0]="json",a[f]=function(){h=arguments},e.always(function(){a[f]=g,c[f]&&(c.jsonpCallback=d.jsonpCallback,cD.push(f)),h&&p.isFunction(g)&&g(h[0]),h=g=b}),"script"}),p.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/javascript|ecmascript/},converters:{"text script":function(a){return p.globalEval(a),a}}}),p.ajaxPrefilter("script",function(a){a.cache===b&&(a.cache=!1),a.crossDomain&&(a.type="GET",a.global=!1)}),p.ajaxTransport("script",function(a){if(a.crossDomain){var c,d=e.head||e.getElementsByTagName("head")[0]||e.documentElement;return{send:function(f,g){c=e.createElement("script"),c.async="async",a.scriptCharset&&(c.charset=a.scriptCharset),c.src=a.url,c.onload=c.onreadystatechange=function(a,e){if(e||!c.readyState||/loaded|complete/.test(c.readyState))c.onload=c.onreadystatechange=null,d&&c.parentNode&&d.removeChild(c),c=b,e||g(200,"success")},d.insertBefore(c,d.firstChild)},abort:function(){c&&c.onload(0,1)}}}});var cH,cI=a.ActiveXObject?function(){for(var a in cH)cH[a](0,1)}:!1,cJ=0;p.ajaxSettings.xhr=a.ActiveXObject?function(){return!this.isLocal&&cK()||cL()}:cK,function(a){p.extend(p.support,{ajax:!!a,cors:!!a&&"withCredentials"in a})}(p.ajaxSettings.xhr()),p.support.ajax&&p.ajaxTransport(function(c){if(!c.crossDomain||p.support.cors){var d;return{send:function(e,f){var g,h,i=c.xhr();c.username?i.open(c.type,c.url,c.async,c.username,c.password):i.open(c.type,c.url,c.async);if(c.xhrFields)for(h in c.xhrFields)i[h]=c.xhrFields[h];c.mimeType&&i.overrideMimeType&&i.overrideMimeType(c.mimeType),!c.crossDomain&&!e["X-Requested-With"]&&(e["X-Requested-With"]="XMLHttpRequest");try{for(h in e)i.setRequestHeader(h,e[h])}catch(j){}i.send(c.hasContent&&c.data||null),d=function(a,e){var h,j,k,l,m;try{if(d&&(e||i.readyState===4)){d=b,g&&(i.onreadystatechange=p.noop,cI&&delete cH[g]);if(e)i.readyState!==4&&i.abort();else{h=i.status,k=i.getAllResponseHeaders(),l={},m=i.responseXML,m&&m.documentElement&&(l.xml=m);try{l.text=i.responseText}catch(a){}try{j=i.statusText}catch(n){j=""}!h&&c.isLocal&&!c.crossDomain?h=l.text?200:404:h===1223&&(h=204)}}}catch(o){e||f(-1,o)}l&&f(h,j,l,k)},c.async?i.readyState===4?setTimeout(d,0):(g=++cJ,cI&&(cH||(cH={},p(a).unload(cI)),cH[g]=d),i.onreadystatechange=d):d()},abort:function(){d&&d(0,1)}}}});var cM,cN,cO=/^(?:toggle|show|hide)$/,cP=new RegExp("^(?:([-+])=|)("+q+")([a-z%]*)$","i"),cQ=/queueHooks$/,cR=[cX],cS={"*":[function(a,b){var c,d,e,f=this.createTween(a,b),g=cP.exec(b),h=f.cur(),i=+h||0,j=1;if(g){c=+g[2],d=g[3]||(p.cssNumber[a]?"":"px");if(d!=="px"&&i){i=p.css(f.elem,a,!0)||c||1;do e=j=j||".5",i=i/j,p.style(f.elem,a,i+d),j=f.cur()/h;while(j!==1&&j!==e)}f.unit=d,f.start=i,f.end=g[1]?i+(g[1]+1)*c:c}return f}]};p.Animation=p.extend(cV,{tweener:function(a,b){p.isFunction(a)?(b=a,a=["*"]):a=a.split(" ");var c,d=0,e=a.length;for(;d<e;d++)c=a[d],cS[c]=cS[c]||[],cS[c].unshift(b)},prefilter:function(a,b){b?cR.unshift(a):cR.push(a)}}),p.Tween=cY,cY.prototype={constructor:cY,init:function(a,b,c,d,e,f){this.elem=a,this.prop=c,this.easing=e||"swing",this.options=b,this.start=this.now=this.cur(),this.end=d,this.unit=f||(p.cssNumber[c]?"":"px")},cur:function(){var a=cY.propHooks[this.prop];return a&&a.get?a.get(this):cY.propHooks._default.get(this)},run:function(a){var b,c=cY.propHooks[this.prop];return this.pos=b=p.easing[this.easing](a,this.options.duration*a,0,1,this.options.duration),this.now=(this.end-this.start)*b+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),c&&c.set?c.set(this):cY.propHooks._default.set(this),this}},cY.prototype.init.prototype=cY.prototype,cY.propHooks={_default:{get:function(a){var b;return a.elem[a.prop]==null||!!a.elem.style&&a.elem.style[a.prop]!=null?(b=p.css(a.elem,a.prop,!1,""),!b||b==="auto"?0:b):a.elem[a.prop]},set:function(a){p.fx.step[a.prop]?p.fx.step[a.prop](a):a.elem.style&&(a.elem.style[p.cssProps[a.prop]]!=null||p.cssHooks[a.prop])?p.style(a.elem,a.prop,a.now+a.unit):a.elem[a.prop]=a.now}}},cY.propHooks.scrollTop=cY.propHooks.scrollLeft={set:function(a){a.elem.nodeType&&a.elem.parentNode&&(a.elem[a.prop]=a.now)}},p.each(["toggle","show","hide"],function(a,b){var c=p.fn[b];p.fn[b]=function(d,e,f){return d==null||typeof d=="boolean"||!a&&p.isFunction(d)&&p.isFunction(e)?c.apply(this,arguments):this.animate(cZ(b,!0),d,e,f)}}),p.fn.extend({fadeTo:function(a,b,c,d){return this.filter(bY).css("opacity",0).show().end().animate({opacity:b},a,c,d)},animate:function(a,b,c,d){var e=p.isEmptyObject(a),f=p.speed(b,c,d),g=function(){var b=cV(this,p.extend({},a),f);e&&b.stop(!0)};return e||f.queue===!1?this.each(g):this.queue(f.queue,g)},stop:function(a,c,d){var e=function(a){var b=a.stop;delete a.stop,b(d)};return typeof a!="string"&&(d=c,c=a,a=b),c&&a!==!1&&this.queue(a||"fx",[]),this.each(function(){var b=!0,c=a!=null&&a+"queueHooks",f=p.timers,g=p._data(this);if(c)g[c]&&g[c].stop&&e(g[c]);else for(c in g)g[c]&&g[c].stop&&cQ.test(c)&&e(g[c]);for(c=f.length;c--;)f[c].elem===this&&(a==null||f[c].queue===a)&&(f[c].anim.stop(d),b=!1,f.splice(c,1));(b||!d)&&p.dequeue(this,a)})}}),p.each({slideDown:cZ("show"),slideUp:cZ("hide"),slideToggle:cZ("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(a,b){p.fn[a]=function(a,c,d){return this.animate(b,a,c,d)}}),p.speed=function(a,b,c){var d=a&&typeof a=="object"?p.extend({},a):{complete:c||!c&&b||p.isFunction(a)&&a,duration:a,easing:c&&b||b&&!p.isFunction(b)&&b};d.duration=p.fx.off?0:typeof d.duration=="number"?d.duration:d.duration in p.fx.speeds?p.fx.speeds[d.duration]:p.fx.speeds._default;if(d.queue==null||d.queue===!0)d.queue="fx";return d.old=d.complete,d.complete=function(){p.isFunction(d.old)&&d.old.call(this),d.queue&&p.dequeue(this,d.queue)},d},p.easing={linear:function(a){return a},swing:function(a){return.5-Math.cos(a*Math.PI)/2}},p.timers=[],p.fx=cY.prototype.init,p.fx.tick=function(){var a,b=p.timers,c=0;for(;c<b.length;c++)a=b[c],!a()&&b[c]===a&&b.splice(c--,1);b.length||p.fx.stop()},p.fx.timer=function(a){a()&&p.timers.push(a)&&!cN&&(cN=setInterval(p.fx.tick,p.fx.interval))},p.fx.interval=13,p.fx.stop=function(){clearInterval(cN),cN=null},p.fx.speeds={slow:600,fast:200,_default:400},p.fx.step={},p.expr&&p.expr.filters&&(p.expr.filters.animated=function(a){return p.grep(p.timers,function(b){return a===b.elem}).length});var c$=/^(?:body|html)$/i;p.fn.offset=function(a){if(arguments.length)return a===b?this:this.each(function(b){p.offset.setOffset(this,a,b)});var c,d,e,f,g,h,i,j,k,l,m=this[0],n=m&&m.ownerDocument;if(!n)return;return(e=n.body)===m?p.offset.bodyOffset(m):(d=n.documentElement,p.contains(d,m)?(c=m.getBoundingClientRect(),f=c_(n),g=d.clientTop||e.clientTop||0,h=d.clientLeft||e.clientLeft||0,i=f.pageYOffset||d.scrollTop,j=f.pageXOffset||d.scrollLeft,k=c.top+i-g,l=c.left+j-h,{top:k,left:l}):{top:0,left:0})},p.offset={bodyOffset:function(a){var b=a.offsetTop,c=a.offsetLeft;return p.support.doesNotIncludeMarginInBodyOffset&&(b+=parseFloat(p.css(a,"marginTop"))||0,c+=parseFloat(p.css(a,"marginLeft"))||0),{top:b,left:c}},setOffset:function(a,b,c){var d=p.css(a,"position");d==="static"&&(a.style.position="relative");var e=p(a),f=e.offset(),g=p.css(a,"top"),h=p.css(a,"left"),i=(d==="absolute"||d==="fixed")&&p.inArray("auto",[g,h])>-1,j={},k={},l,m;i?(k=e.position(),l=k.top,m=k.left):(l=parseFloat(g)||0,m=parseFloat(h)||0),p.isFunction(b)&&(b=b.call(a,c,f)),b.top!=null&&(j.top=b.top-f.top+l),b.left!=null&&(j.left=b.left-f.left+m),"using"in b?b.using.call(a,j):e.css(j)}},p.fn.extend({position:function(){if(!this[0])return;var a=this[0],b=this.offsetParent(),c=this.offset(),d=c$.test(b[0].nodeName)?{top:0,left:0}:b.offset();return c.top-=parseFloat(p.css(a,"marginTop"))||0,c.left-=parseFloat(p.css(a,"marginLeft"))||0,d.top+=parseFloat(p.css(b[0],"borderTopWidth"))||0,d.left+=parseFloat(p.css(b[0],"borderLeftWidth"))||0,{top:c.top-d.top,left:c.left-d.left}},offsetParent:function(){return this.map(function(){var a=this.offsetParent||e.body;while(a&&!c$.test(a.nodeName)&&p.css(a,"position")==="static")a=a.offsetParent;return a||e.body})}}),p.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(a,c){var d=/Y/.test(c);p.fn[a]=function(e){return p.access(this,function(a,e,f){var g=c_(a);if(f===b)return g?c in g?g[c]:g.document.documentElement[e]:a[e];g?g.scrollTo(d?p(g).scrollLeft():f,d?f:p(g).scrollTop()):a[e]=f},a,e,arguments.length,null)}}),p.each({Height:"height",Width:"width"},function(a,c){p.each({padding:"inner"+a,content:c,"":"outer"+a},function(d,e){p.fn[e]=function(e,f){var g=arguments.length&&(d||typeof e!="boolean"),h=d||(e===!0||f===!0?"margin":"border");return p.access(this,function(c,d,e){var f;return p.isWindow(c)?c.document.documentElement["client"+a]:c.nodeType===9?(f=c.documentElement,Math.max(c.body["scroll"+a],f["scroll"+a],c.body["offset"+a],f["offset"+a],f["client"+a])):e===b?p.css(c,d,e,h):p.style(c,d,e,h)},c,g?e:b,g)}})}),a.jQuery=a.$=p,typeof define=="function"&&define.amd&&define.amd.jQuery&&define("jquery",[],function(){return p})})(window);'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> jquerybabbqminJs [
	^ '/*
 * jQuery BBQ: Back Button & Query Library - v1.2.1 - 2/17/2010
 * http://benalman.com/projects/jquery-bbq-plugin/
 * 
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */
(function($,p){var i,m=Array.prototype.slice,r=decodeURIComponent,a=$.param,c,l,v,b=$.bbq=$.bbq||{},q,u,j,e=$.event.special,d="hashchange",A="querystring",D="fragment",y="elemUrlAttr",g="location",k="href",t="src",x=/^.*\?|#.*$/g,w=/^.*\#/,h,C={};function E(F){return typeof F==="string"}function B(G){var F=m.call(arguments,1);return function(){return G.apply(this,F.concat(m.call(arguments)))}}function n(F){return F.replace(/^[^#]*#?(.*)$/,"$1")}function o(F){return F.replace(/(?:^[^?#]*\?([^#]*).*$)?.*/,"$1")}function f(H,M,F,I,G){var O,L,K,N,J;if(I!==i){K=F.match(H?/^([^#]*)\#?(.*)$/:/^([^#?]*)\??([^#]*)(#?.*)/);J=K[3]||"";if(G===2&&E(I)){L=I.replace(H?w:x,"")}else{N=l(K[2]);I=E(I)?l[H?D:A](I):I;L=G===2?I:G===1?$.extend({},I,N):$.extend({},N,I);L=a(L);if(H){L=L.replace(h,r)}}O=K[1]+(H?"#":L||!K[1]?"?":"")+L+J}else{O=M(F!==i?F:p[g][k])}return O}a[A]=B(f,0,o);a[D]=c=B(f,1,n);c.noEscape=function(G){G=G||"";var F=$.map(G.split(""),encodeURIComponent);h=new RegExp(F.join("|"),"g")};c.noEscape(",/");$.deparam=l=function(I,F){var H={},G={"true":!0,"false":!1,"null":null};$.each(I.replace(/\+/g," ").split("&"),function(L,Q){var K=Q.split("="),P=r(K[0]),J,O=H,M=0,R=P.split("]["),N=R.length-1;if(/\[/.test(R[0])&&/\]$/.test(R[N])){R[N]=R[N].replace(/\]$/,"");R=R.shift().split("[").concat(R);N=R.length-1}else{N=0}if(K.length===2){J=r(K[1]);if(F){J=J&&!isNaN(J)?+J:J==="undefined"?i:G[J]!==i?G[J]:J}if(N){for(;M<=N;M++){P=R[M]===""?O.length:R[M];O=O[P]=M<N?O[P]||(R[M+1]&&isNaN(R[M+1])?{}:[]):J}}else{if($.isArray(H[P])){H[P].push(J)}else{if(H[P]!==i){H[P]=[H[P],J]}else{H[P]=J}}}}else{if(P){H[P]=F?i:""}}});return H};function z(H,F,G){if(F===i||typeof F==="boolean"){G=F;F=a[H?D:A]()}else{F=E(F)?F.replace(H?w:x,""):F}return l(F,G)}l[A]=B(z,0);l[D]=v=B(z,1);$[y]||($[y]=function(F){return $.extend(C,F)})({a:k,base:k,iframe:t,img:t,input:t,form:"action",link:k,script:t});j=$[y];function s(I,G,H,F){if(!E(H)&&typeof H!=="object"){F=H;H=G;G=i}return this.each(function(){var L=$(this),J=G||j()[(this.nodeName||"").toLowerCase()]||"",K=J&&L.attr(J)||"";L.attr(J,a[I](K,H,F))})}$.fn[A]=B(s,A);$.fn[D]=B(s,D);b.pushState=q=function(I,F){if(E(I)&&/^#/.test(I)&&F===i){F=2}var H=I!==i,G=c(p[g][k],H?I:{},H?F:2);p[g][k]=G+(/#/.test(G)?"":"#")};b.getState=u=function(F,G){return F===i||typeof F==="boolean"?v(F):v(G)[F]};b.removeState=function(F){var G={};if(F!==i){G=u();$.each($.isArray(F)?F:arguments,function(I,H){delete G[H]})}q(G,2)};e[d]=$.extend(e[d],{add:function(F){var H;function G(J){var I=J[D]=c();J.getState=function(K,L){return K===i||typeof K==="boolean"?l(I,K):l(I,L)[K]};H.apply(this,arguments)}if($.isFunction(F)){H=F;return G}else{H=F.handler;F.handler=G}}})})(jQuery,this);
/*
 * jQuery hashchange event - v1.2 - 2/11/2010
 * http://benalman.com/projects/jquery-hashchange-plugin/
 * 
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */
(function($,i,b){var j,k=$.event.special,c="location",d="hashchange",l="href",f=$.browser,g=document.documentMode,h=f.msie&&(g===b||g<8),e="on"+d in i&&!h;function a(m){m=m||i[c][l];return m.replace(/^[^#]*#?(.*)$/,"$1")}$[d+"Delay"]=100;k[d]=$.extend(k[d],{setup:function(){if(e){return false}$(j.start)},teardown:function(){if(e){return false}$(j.stop)}});j=(function(){var m={},r,n,o,q;function p(){o=q=function(s){return s};if(h){n=$(''<iframe src="javascript:0"/>'').hide().insertAfter("body")[0].contentWindow;q=function(){return a(n.document[c][l])};o=function(u,s){if(u!==s){var t=n.document;t.open().close();t[c].hash="#"+u}};o(a())}}m.start=function(){if(r){return}var t=a();o||p();(function s(){var v=a(),u=q(t);if(v!==t){o(t=v,u);$(i).trigger(d)}else{if(u!==t){i[c][l]=i[c][l].replace(/#.*/,"")+"#"+u}}r=setTimeout(s,$[d+"Delay"])})()};m.stop=function(){if(!n){r&&clearTimeout(r);r=0}};return m})()})(jQuery,this);'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> jqueryslidetominJs [
	^ '(function(b){b.fn.slideto=function(a){a=b.extend({slide_duration:"slow",highlight_duration:3E3,highlight:true,highlight_color:"#FFFF99"},a);return this.each(function(){obj=b(this);b("body").animate({scrollTop:obj.offset().top},a.slide_duration,function(){a.highlight&&b.ui.version&&obj.effect("highlight",{color:a.highlight_color},a.highlight_duration)})})}})(jQuery);
'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> jquerywiggleminJs [
	^ '/*
jQuery Wiggle
Author: WonderGroup, Jordan Thomas
URL: http://labs.wondergroup.com/demos/mini-ui/index.html
License: MIT (http://en.wikipedia.org/wiki/MIT_License)
*/
jQuery.fn.wiggle=function(o){var d={speed:50,wiggles:3,travel:5,callback:null};var o=jQuery.extend(d,o);return this.each(function(){var cache=this;var wrap=jQuery(this).wrap(''<div class="wiggle-wrap"></div>'').css("position","relative");var calls=0;for(i=1;i<=o.wiggles;i++){jQuery(this).animate({left:"-="+o.travel},o.speed).animate({left:"+="+o.travel*2},o.speed*2).animate({left:"-="+o.travel},o.speed,function(){calls++;if(jQuery(cache).parent().hasClass(''wiggle-wrap'')){jQuery(cache).parent().replaceWith(cache);}
if(calls==o.wiggles&&jQuery.isFunction(o.callback)){o.callback();}});}});};'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> logosmallPng [
	^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 30 0 0 0 30 8 6 0 0 0 59 48 174 162 0 0 0 25 116 69 88 116 83 111 102 116 119 97 114 101 0 65 100 111 98 101 32 73 109 97 103 101 82 101 97 100 121 113 201 101 60 0 0 2 164 73 68 65 84 120 218 196 87 61 108 211 64 20 126 113 151 138 46 102 104 197 232 17 65 7 87 2 41 18 67 205 130 64 93 50 116 40 83 156 173 136 161 201 194 154 118 67 98 72 59 192 194 80 51 177 32 145 72 84 234 22 103 34 82 135 122 105 213 13 143 85 89 92 9 80 71 222 231 222 85 150 125 103 39 181 3 47 58 157 117 126 185 239 253 124 239 229 133 232 63 73 237 54 95 90 239 146 201 155 157 56 138 190 236 80 48 19 96 6 115 120 107 242 194 110 105 212 0 254 137 87 159 13 9 75 1 11 192 174 0 156 70 60 94 59 58 3 106 5 160 61 222 218 37 82 25 241 234 48 184 55 17 176 200 225 48 149 199 50 2 207 183 147 7 115 42 173 7 14 125 175 16 20 226 240 157 151 167 35 26 203 3 67 19 94 123 6 21 212 19 124 201 134 90 188 24 170 190 101 221 179 105 97 222 164 240 60 160 223 87 145 242 230 69 211 162 37 94 23 81 72 63 35 37 167 112 184 194 97 143 210 30 119 85 218 238 243 30 189 219 60 166 109 119 24 27 160 147 167 182 27 235 124 104 255 160 199 247 27 74 251 37 89 141 148 183 202 146 89 171 183 99 47 189 195 78 236 177 78 134 129 71 126 224 9 35 154 58 181 173 116 142 155 121 9 2 224 193 120 87 27 102 8 194 251 190 223 138 159 239 204 155 58 53 147 157 108 36 129 29 250 119 178 106 36 234 214 210 17 230 54 178 160 247 24 98 75 143 181 140 89 171 199 41 161 211 112 116 195 238 164 81 18 0 187 124 135 180 224 249 161 165 13 162 51 39 26 6 220 114 211 111 193 208 39 203 27 241 69 31 191 189 162 103 143 54 233 205 198 87 250 115 117 73 209 175 243 152 189 120 127 48 222 163 206 250 103 102 255 46 29 157 13 98 35 193 106 232 215 248 115 18 250 25 100 163 136 80 210 179 69 81 159 16 185 131 76 82 7 103 32 30 150 172 121 60 95 168 235 249 186 129 228 53 14 135 107 243 117 99 63 102 52 202 105 18 65 36 96 168 251 246 174 174 10 174 27 8 119 18 95 119 201 209 89 63 147 219 34 1 40 194 155 83 122 129 145 250 17 207 72 94 221 150 144 81 18 216 175 226 198 130 50 146 210 79 2 239 233 180 224 53 74 3 185 206 171 107 232 160 18 36 241 116 156 197 124 118 3 44 70 20 79 57 195 48 169 0 14 162 45 21 0 131 11 0 69 137 233 134 2 213 207 34 110 61 70 63 157 81 171 12 216 193 149 76 29 11 175 59 51 2 5 75 91 218 209 135 199 147 64 116 178 170 167 144 23 236 216 56 119 230 98 240 1 131 35 220 245 138 60 125 201 160 135 211 140 183 24 35 246 75 228 28 189 161 165 250 151 49 201 64 111 138 113 101 107 10 3 66 49 210 122 85 252 133 1 40 34 176 42 242 159 230 128 47 60 28 228 181 96 41 127 5 24 0 154 32 255 214 9 250 54 239 0 0 0 0 73 69 78 68 174 66 96 130]
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> markedJs [
	^ '/**
 * marked - a markdown parser
 * Copyright (c) 2011-2014, Christopher Jeffrey. (MIT Licensed)
 * https://github.com/chjj/marked
 */

;(function() {

/**
 * Block-Level Grammar
 */

var block = {
  newline: /^\n+/,
  code: /^( {4}[^\n]+\n*)+/,
  fences: noop,
  hr: /^( *[-*_]){3,} *(?:\n+|$)/,
  heading: /^ *(#{1,6}) *([^\n]+?) *#* *(?:\n+|$)/,
  nptable: noop,
  lheading: /^([^\n]+)\n *(=|-){2,} *(?:\n+|$)/,
  blockquote: /^( *>[^\n]+(\n(?!def)[^\n]+)*\n*)+/,
  list: /^( *)(bull) [\s\S]+?(?:hr|def|\n{2,}(?! )(?!\1bull )\n*|\s*$)/,
  html: /^ *(?:comment *(?:\n|\s*$)|closed *(?:\n{2,}|\s*$)|closing *(?:\n{2,}|\s*$))/,
  def: /^ *\[([^\]]+)\]: *<?([^\s>]+)>?(?: +["(]([^\n]+)[")])? *(?:\n+|$)/,
  table: noop,
  paragraph: /^((?:[^\n]+\n?(?!hr|heading|lheading|blockquote|tag|def))+)\n*/,
  text: /^[^\n]+/
};

block.bullet = /(?:[*+-]|\d+\.)/;
block.item = /^( *)(bull) [^\n]*(?:\n(?!\1bull )[^\n]*)*/;
block.item = replace(block.item, ''gm'')
  (/bull/g, block.bullet)
  ();

block.list = replace(block.list)
  (/bull/g, block.bullet)
  (''hr'', ''\\n+(?=\\1?(?:[-*_] *){3,}(?:\\n+|$))'')
  (''def'', ''\\n+(?='' + block.def.source + '')'')
  ();

block.blockquote = replace(block.blockquote)
  (''def'', block.def)
  ();

block._tag = ''(?!(?:''
  + ''a|em|strong|small|s|cite|q|dfn|abbr|data|time|code''
  + ''|var|samp|kbd|sub|sup|i|b|u|mark|ruby|rt|rp|bdi|bdo''
  + ''|span|br|wbr|ins|del|img)\\b)\\w+(?!:/|[^\\w\\s@]*@)\\b'';

block.html = replace(block.html)
  (''comment'', /<!--[\s\S]*?-->/)
  (''closed'', /<(tag)[\s\S]+?<\/\1>/)
  (''closing'', /<tag(?:"[^"]*"|''[^'']*''|[^''">])*?>/)
  (/tag/g, block._tag)
  ();

block.paragraph = replace(block.paragraph)
  (''hr'', block.hr)
  (''heading'', block.heading)
  (''lheading'', block.lheading)
  (''blockquote'', block.blockquote)
  (''tag'', ''<'' + block._tag)
  (''def'', block.def)
  ();

/**
 * Normal Block Grammar
 */

block.normal = merge({}, block);

/**
 * GFM Block Grammar
 */

block.gfm = merge({}, block.normal, {
  fences: /^ *(`{3,}|~{3,}) *(\S+)? *\n([\s\S]+?)\s*\1 *(?:\n+|$)/,
  paragraph: /^/
});

block.gfm.paragraph = replace(block.paragraph)
  (''(?!'', ''(?!''
    + block.gfm.fences.source.replace(''\\1'', ''\\2'') + ''|''
    + block.list.source.replace(''\\1'', ''\\3'') + ''|'')
  ();

/**
 * GFM + Tables Block Grammar
 */

block.tables = merge({}, block.gfm, {
  nptable: /^ *(\S.*\|.*)\n *([-:]+ *\|[-| :]*)\n((?:.*\|.*(?:\n|$))*)\n*/,
  table: /^ *\|(.+)\n *\|( *[-:]+[-| :]*)\n((?: *\|.*(?:\n|$))*)\n*/
});

/**
 * Block Lexer
 */

function Lexer(options) {
  this.tokens = [];
  this.tokens.links = {};
  this.options = options || marked.defaults;
  this.rules = block.normal;

  if (this.options.gfm) {
    if (this.options.tables) {
      this.rules = block.tables;
    } else {
      this.rules = block.gfm;
    }
  }
}

/**
 * Expose Block Rules
 */

Lexer.rules = block;

/**
 * Static Lex Method
 */

Lexer.lex = function(src, options) {
  var lexer = new Lexer(options);
  return lexer.lex(src);
};

/**
 * Preprocessing
 */

Lexer.prototype.lex = function(src) {
  src = src
    .replace(/\r\n|\r/g, ''\n'')
    .replace(/\t/g, ''    '')
    .replace(/\u00a0/g, '' '')
    .replace(/\u2424/g, ''\n'');

  return this.token(src, true);
};

/**
 * Lexing
 */

Lexer.prototype.token = function(src, top, bq) {
  var src = src.replace(/^ +$/gm, '''')
    , next
    , loose
    , cap
    , bull
    , b
    , item
    , space
    , i
    , l;

  while (src) {
    // newline
    if (cap = this.rules.newline.exec(src)) {
      src = src.substring(cap[0].length);
      if (cap[0].length > 1) {
        this.tokens.push({
          type: ''space''
        });
      }
    }

    // code
    if (cap = this.rules.code.exec(src)) {
      src = src.substring(cap[0].length);
      cap = cap[0].replace(/^ {4}/gm, '''');
      this.tokens.push({
        type: ''code'',
        text: !this.options.pedantic
          ? cap.replace(/\n+$/, '''')
          : cap
      });
      continue;
    }

    // fences (gfm)
    if (cap = this.rules.fences.exec(src)) {
      src = src.substring(cap[0].length);
      this.tokens.push({
        type: ''code'',
        lang: cap[2],
        text: cap[3]
      });
      continue;
    }

    // heading
    if (cap = this.rules.heading.exec(src)) {
      src = src.substring(cap[0].length);
      this.tokens.push({
        type: ''heading'',
        depth: cap[1].length,
        text: cap[2]
      });
      continue;
    }

    // table no leading pipe (gfm)
    if (top && (cap = this.rules.nptable.exec(src))) {
      src = src.substring(cap[0].length);

      item = {
        type: ''table'',
        header: cap[1].replace(/^ *| *\| *$/g, '''').split(/ *\| */),
        align: cap[2].replace(/^ *|\| *$/g, '''').split(/ *\| */),
        cells: cap[3].replace(/\n$/, '''').split(''\n'')
      };

      for (i = 0; i < item.align.length; i++) {
        if (/^ *-+: *$/.test(item.align[i])) {
          item.align[i] = ''right'';
        } else if (/^ *:-+: *$/.test(item.align[i])) {
          item.align[i] = ''center'';
        } else if (/^ *:-+ *$/.test(item.align[i])) {
          item.align[i] = ''left'';
        } else {
          item.align[i] = null;
        }
      }

      for (i = 0; i < item.cells.length; i++) {
        item.cells[i] = item.cells[i].split(/ *\| */);
      }

      this.tokens.push(item);

      continue;
    }

    // lheading
    if (cap = this.rules.lheading.exec(src)) {
      src = src.substring(cap[0].length);
      this.tokens.push({
        type: ''heading'',
        depth: cap[2] === ''='' ? 1 : 2,
        text: cap[1]
      });
      continue;
    }

    // hr
    if (cap = this.rules.hr.exec(src)) {
      src = src.substring(cap[0].length);
      this.tokens.push({
        type: ''hr''
      });
      continue;
    }

    // blockquote
    if (cap = this.rules.blockquote.exec(src)) {
      src = src.substring(cap[0].length);

      this.tokens.push({
        type: ''blockquote_start''
      });

      cap = cap[0].replace(/^ *> ?/gm, '''');

      // Pass `top` to keep the current
      // "toplevel" state. This is exactly
      // how markdown.pl works.
      this.token(cap, top, true);

      this.tokens.push({
        type: ''blockquote_end''
      });

      continue;
    }

    // list
    if (cap = this.rules.list.exec(src)) {
      src = src.substring(cap[0].length);
      bull = cap[2];

      this.tokens.push({
        type: ''list_start'',
        ordered: bull.length > 1
      });

      // Get each top-level item.
      cap = cap[0].match(this.rules.item);

      next = false;
      l = cap.length;
      i = 0;

      for (; i < l; i++) {
        item = cap[i];

        // Remove the list item''s bullet
        // so it is seen as the next token.
        space = item.length;
        item = item.replace(/^ *([*+-]|\d+\.) +/, '''');

        // Outdent whatever the
        // list item contains. Hacky.
        if (~item.indexOf(''\n '')) {
          space -= item.length;
          item = !this.options.pedantic
            ? item.replace(new RegExp(''^ {1,'' + space + ''}'', ''gm''), '''')
            : item.replace(/^ {1,4}/gm, '''');
        }

        // Determine whether the next list item belongs here.
        // Backpedal if it does not belong in this list.
        if (this.options.smartLists && i !== l - 1) {
          b = block.bullet.exec(cap[i + 1])[0];
          if (bull !== b && !(bull.length > 1 && b.length > 1)) {
            src = cap.slice(i + 1).join(''\n'') + src;
            i = l - 1;
          }
        }

        // Determine whether item is loose or not.
        // Use: /(^|\n)(?! )[^\n]+\n\n(?!\s*$)/
        // for discount behavior.
        loose = next || /\n\n(?!\s*$)/.test(item);
        if (i !== l - 1) {
          next = item.charAt(item.length - 1) === ''\n'';
          if (!loose) loose = next;
        }

        this.tokens.push({
          type: loose
            ? ''loose_item_start''
            : ''list_item_start''
        });

        // Recurse.
        this.token(item, false, bq);

        this.tokens.push({
          type: ''list_item_end''
        });
      }

      this.tokens.push({
        type: ''list_end''
      });

      continue;
    }

    // html
    if (cap = this.rules.html.exec(src)) {
      src = src.substring(cap[0].length);
      this.tokens.push({
        type: this.options.sanitize
          ? ''paragraph''
          : ''html'',
        pre: cap[1] === ''pre'' || cap[1] === ''script'' || cap[1] === ''style'',
        text: cap[0]
      });
      continue;
    }

    // def
    if ((!bq && top) && (cap = this.rules.def.exec(src))) {
      src = src.substring(cap[0].length);
      this.tokens.links[cap[1].toLowerCase()] = {
        href: cap[2],
        title: cap[3]
      };
      continue;
    }

    // table (gfm)
    if (top && (cap = this.rules.table.exec(src))) {
      src = src.substring(cap[0].length);

      item = {
        type: ''table'',
        header: cap[1].replace(/^ *| *\| *$/g, '''').split(/ *\| */),
        align: cap[2].replace(/^ *|\| *$/g, '''').split(/ *\| */),
        cells: cap[3].replace(/(?: *\| *)?\n$/, '''').split(''\n'')
      };

      for (i = 0; i < item.align.length; i++) {
        if (/^ *-+: *$/.test(item.align[i])) {
          item.align[i] = ''right'';
        } else if (/^ *:-+: *$/.test(item.align[i])) {
          item.align[i] = ''center'';
        } else if (/^ *:-+ *$/.test(item.align[i])) {
          item.align[i] = ''left'';
        } else {
          item.align[i] = null;
        }
      }

      for (i = 0; i < item.cells.length; i++) {
        item.cells[i] = item.cells[i]
          .replace(/^ *\| *| *\| *$/g, '''')
          .split(/ *\| */);
      }

      this.tokens.push(item);

      continue;
    }

    // top-level paragraph
    if (top && (cap = this.rules.paragraph.exec(src))) {
      src = src.substring(cap[0].length);
      this.tokens.push({
        type: ''paragraph'',
        text: cap[1].charAt(cap[1].length - 1) === ''\n''
          ? cap[1].slice(0, -1)
          : cap[1]
      });
      continue;
    }

    // text
    if (cap = this.rules.text.exec(src)) {
      // Top-level should never reach here.
      src = src.substring(cap[0].length);
      this.tokens.push({
        type: ''text'',
        text: cap[0]
      });
      continue;
    }

    if (src) {
      throw new
        Error(''Infinite loop on byte: '' + src.charCodeAt(0));
    }
  }

  return this.tokens;
};

/**
 * Inline-Level Grammar
 */

var inline = {
  escape: /^\\([\\`*{}\[\]()#+\-.!_>])/,
  autolink: /^<([^ >]+(@|:\/)[^ >]+)>/,
  url: noop,
  tag: /^<!--[\s\S]*?-->|^<\/?\w+(?:"[^"]*"|''[^'']*''|[^''">])*?>/,
  link: /^!?\[(inside)\]\(href\)/,
  reflink: /^!?\[(inside)\]\s*\[([^\]]*)\]/,
  nolink: /^!?\[((?:\[[^\]]*\]|[^\[\]])*)\]/,
  strong: /^__([\s\S]+?)__(?!_)|^\*\*([\s\S]+?)\*\*(?!\*)/,
  em: /^\b_((?:__|[\s\S])+?)_\b|^\*((?:\*\*|[\s\S])+?)\*(?!\*)/,
  code: /^(`+)\s*([\s\S]*?[^`])\s*\1(?!`)/,
  br: /^ {2,}\n(?!\s*$)/,
  del: noop,
  text: /^[\s\S]+?(?=[\\<!\[_*`]| {2,}\n|$)/
};

inline._inside = /(?:\[[^\]]*\]|[^\[\]]|\](?=[^\[]*\]))*/;
inline._href = /\s*<?([\s\S]*?)>?(?:\s+[''"]([\s\S]*?)[''"])?\s*/;

inline.link = replace(inline.link)
  (''inside'', inline._inside)
  (''href'', inline._href)
  ();

inline.reflink = replace(inline.reflink)
  (''inside'', inline._inside)
  ();

/**
 * Normal Inline Grammar
 */

inline.normal = merge({}, inline);

/**
 * Pedantic Inline Grammar
 */

inline.pedantic = merge({}, inline.normal, {
  strong: /^__(?=\S)([\s\S]*?\S)__(?!_)|^\*\*(?=\S)([\s\S]*?\S)\*\*(?!\*)/,
  em: /^_(?=\S)([\s\S]*?\S)_(?!_)|^\*(?=\S)([\s\S]*?\S)\*(?!\*)/
});

/**
 * GFM Inline Grammar
 */

inline.gfm = merge({}, inline.normal, {
  escape: replace(inline.escape)(''])'', ''~|])'')(),
  url: /^(https?:\/\/[^\s<]+[^<.,:;"'')\]\s])/,
  del: /^~~(?=\S)([\s\S]*?\S)~~/,
  text: replace(inline.text)
    ('']|'', ''~]|'')
    (''|'', ''|https?://|'')
    ()
});

/**
 * GFM + Line Breaks Inline Grammar
 */

inline.breaks = merge({}, inline.gfm, {
  br: replace(inline.br)(''{2,}'', ''*'')(),
  text: replace(inline.gfm.text)(''{2,}'', ''*'')()
});

/**
 * Inline Lexer & Compiler
 */

function InlineLexer(links, options) {
  this.options = options || marked.defaults;
  this.links = links;
  this.rules = inline.normal;
  this.renderer = this.options.renderer || new Renderer;
  this.renderer.options = this.options;

  if (!this.links) {
    throw new
      Error(''Tokens array requires a `links` property.'');
  }

  if (this.options.gfm) {
    if (this.options.breaks) {
      this.rules = inline.breaks;
    } else {
      this.rules = inline.gfm;
    }
  } else if (this.options.pedantic) {
    this.rules = inline.pedantic;
  }
}

/**
 * Expose Inline Rules
 */

InlineLexer.rules = inline;

/**
 * Static Lexing/Compiling Method
 */

InlineLexer.output = function(src, links, options) {
  var inline = new InlineLexer(links, options);
  return inline.output(src);
};

/**
 * Lexing/Compiling
 */

InlineLexer.prototype.output = function(src) {
  var out = ''''
    , link
    , text
    , href
    , cap;

  while (src) {
    // escape
    if (cap = this.rules.escape.exec(src)) {
      src = src.substring(cap[0].length);
      out += cap[1];
      continue;
    }

    // autolink
    if (cap = this.rules.autolink.exec(src)) {
      src = src.substring(cap[0].length);
      if (cap[2] === ''@'') {
        text = cap[1].charAt(6) === '':''
          ? this.mangle(cap[1].substring(7))
          : this.mangle(cap[1]);
        href = this.mangle(''mailto:'') + text;
      } else {
        text = escape(cap[1]);
        href = text;
      }
      out += this.renderer.link(href, null, text);
      continue;
    }

    // url (gfm)
    if (!this.inLink && (cap = this.rules.url.exec(src))) {
      src = src.substring(cap[0].length);
      text = escape(cap[1]);
      href = text;
      out += this.renderer.link(href, null, text);
      continue;
    }

    // tag
    if (cap = this.rules.tag.exec(src)) {
      if (!this.inLink && /^<a /i.test(cap[0])) {
        this.inLink = true;
      } else if (this.inLink && /^<\/a>/i.test(cap[0])) {
        this.inLink = false;
      }
      src = src.substring(cap[0].length);
      out += this.options.sanitize
        ? escape(cap[0])
        : cap[0];
      continue;
    }

    // link
    if (cap = this.rules.link.exec(src)) {
      src = src.substring(cap[0].length);
      this.inLink = true;
      out += this.outputLink(cap, {
        href: cap[2],
        title: cap[3]
      });
      this.inLink = false;
      continue;
    }

    // reflink, nolink
    if ((cap = this.rules.reflink.exec(src))
        || (cap = this.rules.nolink.exec(src))) {
      src = src.substring(cap[0].length);
      link = (cap[2] || cap[1]).replace(/\s+/g, '' '');
      link = this.links[link.toLowerCase()];
      if (!link || !link.href) {
        out += cap[0].charAt(0);
        src = cap[0].substring(1) + src;
        continue;
      }
      this.inLink = true;
      out += this.outputLink(cap, link);
      this.inLink = false;
      continue;
    }

    // strong
    if (cap = this.rules.strong.exec(src)) {
      src = src.substring(cap[0].length);
      out += this.renderer.strong(this.output(cap[2] || cap[1]));
      continue;
    }

    // em
    if (cap = this.rules.em.exec(src)) {
      src = src.substring(cap[0].length);
      out += this.renderer.em(this.output(cap[2] || cap[1]));
      continue;
    }

    // code
    if (cap = this.rules.code.exec(src)) {
      src = src.substring(cap[0].length);
      out += this.renderer.codespan(escape(cap[2], true));
      continue;
    }

    // br
    if (cap = this.rules.br.exec(src)) {
      src = src.substring(cap[0].length);
      out += this.renderer.br();
      continue;
    }

    // del (gfm)
    if (cap = this.rules.del.exec(src)) {
      src = src.substring(cap[0].length);
      out += this.renderer.del(this.output(cap[1]));
      continue;
    }

    // text
    if (cap = this.rules.text.exec(src)) {
      src = src.substring(cap[0].length);
      out += escape(this.smartypants(cap[0]));
      continue;
    }

    if (src) {
      throw new
        Error(''Infinite loop on byte: '' + src.charCodeAt(0));
    }
  }

  return out;
};

/**
 * Compile Link
 */

InlineLexer.prototype.outputLink = function(cap, link) {
  var href = escape(link.href)
    , title = link.title ? escape(link.title) : null;

  return cap[0].charAt(0) !== ''!''
    ? this.renderer.link(href, title, this.output(cap[1]))
    : this.renderer.image(href, title, escape(cap[1]));
};

/**
 * Smartypants Transformations
 */

InlineLexer.prototype.smartypants = function(text) {
  if (!this.options.smartypants) return text;
  return text
    // em-dashes
    .replace(/--/g, ''\u2014'')
    // opening singles
    .replace(/(^|[-\u2014/(\[{"\s])''/g, ''$1\u2018'')
    // closing singles & apostrophes
    .replace(/''/g, ''\u2019'')
    // opening doubles
    .replace(/(^|[-\u2014/(\[{\u2018\s])"/g, ''$1\u201c'')
    // closing doubles
    .replace(/"/g, ''\u201d'')
    // ellipses
    .replace(/\.{3}/g, ''\u2026'');
};

/**
 * Mangle Links
 */

InlineLexer.prototype.mangle = function(text) {
  var out = ''''
    , l = text.length
    , i = 0
    , ch;

  for (; i < l; i++) {
    ch = text.charCodeAt(i);
    if (Math.random() > 0.5) {
      ch = ''x'' + ch.toString(16);
    }
    out += ''&#'' + ch + '';'';
  }

  return out;
};

/**
 * Renderer
 */

function Renderer(options) {
  this.options = options || {};
}

Renderer.prototype.code = function(code, lang, escaped) {
  if (this.options.highlight) {
    var out = this.options.highlight(code, lang);
    if (out != null && out !== code) {
      escaped = true;
      code = out;
    }
  }

  if (!lang) {
    return ''<pre><code>''
      + (escaped ? code : escape(code, true))
      + ''\n</code></pre>'';
  }

  return ''<pre><code class="''
    + this.options.langPrefix
    + escape(lang, true)
    + ''">''
    + (escaped ? code : escape(code, true))
    + ''\n</code></pre>\n'';
};

Renderer.prototype.blockquote = function(quote) {
  return ''<blockquote>\n'' + quote + ''</blockquote>\n'';
};

Renderer.prototype.html = function(html) {
  return html;
};

Renderer.prototype.heading = function(text, level, raw) {
  return ''<h''
    + level
    + '' id="''
    + this.options.headerPrefix
    + raw.toLowerCase().replace(/[^\w]+/g, ''-'')
    + ''">''
    + text
    + ''</h''
    + level
    + ''>\n'';
};

Renderer.prototype.hr = function() {
  return this.options.xhtml ? ''<hr/>\n'' : ''<hr>\n'';
};

Renderer.prototype.list = function(body, ordered) {
  var type = ordered ? ''ol'' : ''ul'';
  return ''<'' + type + ''>\n'' + body + ''</'' + type + ''>\n'';
};

Renderer.prototype.listitem = function(text) {
  return ''<li>'' + text + ''</li>\n'';
};

Renderer.prototype.paragraph = function(text) {
  return ''<p>'' + text + ''</p>\n'';
};

Renderer.prototype.table = function(header, body) {
  return ''<table>\n''
    + ''<thead>\n''
    + header
    + ''</thead>\n''
    + ''<tbody>\n''
    + body
    + ''</tbody>\n''
    + ''</table>\n'';
};

Renderer.prototype.tablerow = function(content) {
  return ''<tr>\n'' + content + ''</tr>\n'';
};

Renderer.prototype.tablecell = function(content, flags) {
  var type = flags.header ? ''th'' : ''td'';
  var tag = flags.align
    ? ''<'' + type + '' style="text-align:'' + flags.align + ''">''
    : ''<'' + type + ''>'';
  return tag + content + ''</'' + type + ''>\n'';
};

// span level renderer
Renderer.prototype.strong = function(text) {
  return ''<strong>'' + text + ''</strong>'';
};

Renderer.prototype.em = function(text) {
  return ''<em>'' + text + ''</em>'';
};

Renderer.prototype.codespan = function(text) {
  return ''<code>'' + text + ''</code>'';
};

Renderer.prototype.br = function() {
  return this.options.xhtml ? ''<br/>'' : ''<br>'';
};

Renderer.prototype.del = function(text) {
  return ''<del>'' + text + ''</del>'';
};

Renderer.prototype.link = function(href, title, text) {
  if (this.options.sanitize) {
    try {
      var prot = decodeURIComponent(unescape(href))
        .replace(/[^\w:]/g, '''')
        .toLowerCase();
    } catch (e) {
      return '''';
    }
    if (prot.indexOf(''javascript:'') === 0) {
      return '''';
    }
  }
  var out = ''<a href="'' + href + ''"'';
  if (title) {
    out += '' title="'' + title + ''"'';
  }
  out += ''>'' + text + ''</a>'';
  return out;
};

Renderer.prototype.image = function(href, title, text) {
  var out = ''<img src="'' + href + ''" alt="'' + text + ''"'';
  if (title) {
    out += '' title="'' + title + ''"'';
  }
  out += this.options.xhtml ? ''/>'' : ''>'';
  return out;
};

/**
 * Parsing & Compiling
 */

function Parser(options) {
  this.tokens = [];
  this.token = null;
  this.options = options || marked.defaults;
  this.options.renderer = this.options.renderer || new Renderer;
  this.renderer = this.options.renderer;
  this.renderer.options = this.options;
}

/**
 * Static Parse Method
 */

Parser.parse = function(src, options, renderer) {
  var parser = new Parser(options, renderer);
  return parser.parse(src);
};

/**
 * Parse Loop
 */

Parser.prototype.parse = function(src) {
  this.inline = new InlineLexer(src.links, this.options, this.renderer);
  this.tokens = src.reverse();

  var out = '''';
  while (this.next()) {
    out += this.tok();
  }

  return out;
};

/**
 * Next Token
 */

Parser.prototype.next = function() {
  return this.token = this.tokens.pop();
};

/**
 * Preview Next Token
 */

Parser.prototype.peek = function() {
  return this.tokens[this.tokens.length - 1] || 0;
};

/**
 * Parse Text Tokens
 */

Parser.prototype.parseText = function() {
  var body = this.token.text;

  while (this.peek().type === ''text'') {
    body += ''\n'' + this.next().text;
  }

  return this.inline.output(body);
};

/**
 * Parse Current Token
 */

Parser.prototype.tok = function() {
  switch (this.token.type) {
    case ''space'': {
      return '''';
    }
    case ''hr'': {
      return this.renderer.hr();
    }
    case ''heading'': {
      return this.renderer.heading(
        this.inline.output(this.token.text),
        this.token.depth,
        this.token.text);
    }
    case ''code'': {
      return this.renderer.code(this.token.text,
        this.token.lang,
        this.token.escaped);
    }
    case ''table'': {
      var header = ''''
        , body = ''''
        , i
        , row
        , cell
        , flags
        , j;

      // header
      cell = '''';
      for (i = 0; i < this.token.header.length; i++) {
        flags = { header: true, align: this.token.align[i] };
        cell += this.renderer.tablecell(
          this.inline.output(this.token.header[i]),
          { header: true, align: this.token.align[i] }
        );
      }
      header += this.renderer.tablerow(cell);

      for (i = 0; i < this.token.cells.length; i++) {
        row = this.token.cells[i];

        cell = '''';
        for (j = 0; j < row.length; j++) {
          cell += this.renderer.tablecell(
            this.inline.output(row[j]),
            { header: false, align: this.token.align[j] }
          );
        }

        body += this.renderer.tablerow(cell);
      }
      return this.renderer.table(header, body);
    }
    case ''blockquote_start'': {
      var body = '''';

      while (this.next().type !== ''blockquote_end'') {
        body += this.tok();
      }

      return this.renderer.blockquote(body);
    }
    case ''list_start'': {
      var body = ''''
        , ordered = this.token.ordered;

      while (this.next().type !== ''list_end'') {
        body += this.tok();
      }

      return this.renderer.list(body, ordered);
    }
    case ''list_item_start'': {
      var body = '''';

      while (this.next().type !== ''list_item_end'') {
        body += this.token.type === ''text''
          ? this.parseText()
          : this.tok();
      }

      return this.renderer.listitem(body);
    }
    case ''loose_item_start'': {
      var body = '''';

      while (this.next().type !== ''list_item_end'') {
        body += this.tok();
      }

      return this.renderer.listitem(body);
    }
    case ''html'': {
      var html = !this.token.pre && !this.options.pedantic
        ? this.inline.output(this.token.text)
        : this.token.text;
      return this.renderer.html(html);
    }
    case ''paragraph'': {
      return this.renderer.paragraph(this.inline.output(this.token.text));
    }
    case ''text'': {
      return this.renderer.paragraph(this.parseText());
    }
  }
};

/**
 * Helpers
 */

function escape(html, encode) {
  return html
    .replace(!encode ? /&(?!#?\w+;)/g : /&/g, ''&amp;'')
    .replace(/</g, ''&lt;'')
    .replace(/>/g, ''&gt;'')
    .replace(/"/g, ''&quot;'')
    .replace(/''/g, ''&#39;'');
}

function unescape(html) {
  return html.replace(/&([#\w]+);/g, function(_, n) {
    n = n.toLowerCase();
    if (n === ''colon'') return '':'';
    if (n.charAt(0) === ''#'') {
      return n.charAt(1) === ''x''
        ? String.fromCharCode(parseInt(n.substring(2), 16))
        : String.fromCharCode(+n.substring(1));
    }
    return '''';
  });
}

function replace(regex, opt) {
  regex = regex.source;
  opt = opt || '''';
  return function self(name, val) {
    if (!name) return new RegExp(regex, opt);
    val = val.source || val;
    val = val.replace(/(^|[^\[])\^/g, ''$1'');
    regex = regex.replace(name, val);
    return self;
  };
}

function noop() {}
noop.exec = noop;

function merge(obj) {
  var i = 1
    , target
    , key;

  for (; i < arguments.length; i++) {
    target = arguments[i];
    for (key in target) {
      if (Object.prototype.hasOwnProperty.call(target, key)) {
        obj[key] = target[key];
      }
    }
  }

  return obj;
}


/**
 * Marked
 */

function marked(src, opt, callback) {
  if (callback || typeof opt === ''function'') {
    if (!callback) {
      callback = opt;
      opt = null;
    }

    opt = merge({}, marked.defaults, opt || {});

    var highlight = opt.highlight
      , tokens
      , pending
      , i = 0;

    try {
      tokens = Lexer.lex(src, opt)
    } catch (e) {
      return callback(e);
    }

    pending = tokens.length;

    var done = function(err) {
      if (err) {
        opt.highlight = highlight;
        return callback(err);
      }

      var out;

      try {
        out = Parser.parse(tokens, opt);
      } catch (e) {
        err = e;
      }

      opt.highlight = highlight;

      return err
        ? callback(err)
        : callback(null, out);
    };

    if (!highlight || highlight.length < 3) {
      return done();
    }

    delete opt.highlight;

    if (!pending) return done();

    for (; i < tokens.length; i++) {
      (function(token) {
        if (token.type !== ''code'') {
          return --pending || done();
        }
        return highlight(token.text, token.lang, function(err, code) {
          if (err) return done(err);
          if (code == null || code === token.text) {
            return --pending || done();
          }
          token.text = code;
          token.escaped = true;
          --pending || done();
        });
      })(tokens[i]);
    }

    return;
  }
  try {
    if (opt) opt = merge({}, marked.defaults, opt);
    return Parser.parse(Lexer.lex(src, opt), opt);
  } catch (e) {
    e.message += ''\nPlease report this to https://github.com/chjj/marked.'';
    if ((opt || marked.defaults).silent) {
      return ''<p>An error occured:</p><pre>''
        + escape(e.message + '''', true)
        + ''</pre>'';
    }
    throw e;
  }
}

/**
 * Options
 */

marked.options =
marked.setOptions = function(opt) {
  merge(marked.defaults, opt);
  return marked;
};

marked.defaults = {
  gfm: true,
  tables: true,
  breaks: false,
  pedantic: false,
  sanitize: false,
  smartLists: false,
  silent: false,
  highlight: null,
  langPrefix: ''lang-'',
  smartypants: false,
  headerPrefix: '''',
  renderer: new Renderer,
  xhtml: false
};

/**
 * Expose
 */

marked.Parser = Parser;
marked.parser = Parser.parse;

marked.Renderer = Renderer;

marked.Lexer = Lexer;
marked.lexer = Lexer.lex;

marked.InlineLexer = InlineLexer;
marked.inlineLexer = InlineLexer.output;

marked.parse = marked;

if (typeof module !== ''undefined'' && typeof exports === ''object'') {
  module.exports = marked;
} else if (typeof define === ''function'' && define.amd) {
  define(function() { return marked; });
} else {
  this.marked = marked;
}

}).call(function() {
  return this || (typeof window !== ''undefined'' ? window : global);
}());'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> petstoreapiPng [
	^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 24 0 0 0 24 8 6 0 0 0 224 119 61 248 0 0 0 4 115 66 73 84 8 8 8 8 124 8 100 136 0 0 0 9 112 72 89 115 0 0 11 18 0 0 11 18 1 210 221 126 252 0 0 0 28 116 69 88 116 83 111 102 116 119 97 114 101 0 65 100 111 98 101 32 70 105 114 101 119 111 114 107 115 32 67 83 53 113 181 227 54 0 0 2 178 73 68 65 84 72 137 173 149 73 104 20 65 20 64 95 85 119 103 166 98 150 137 98 22 240 96 212 136 78 198 253 34 8 25 15 222 4 131 151 128 11 184 38 70 81 48 40 81 241 44 46 209 81 8 42 34 46 7 81 240 34 232 65 4 151 232 81 196 5 178 8 3 49 184 96 18 147 201 98 146 174 204 100 186 188 152 91 6 167 157 252 107 253 255 222 175 207 47 74 0 52 159 56 229 196 227 241 19 174 235 30 246 60 83 70 14 33 165 232 83 74 93 173 170 170 58 119 225 252 217 148 104 60 120 72 245 247 255 186 27 12 6 234 34 145 8 197 69 197 185 240 25 25 29 161 189 189 3 173 245 195 210 210 249 187 237 222 222 254 147 115 230 228 215 213 239 223 75 52 26 205 9 62 29 175 223 188 225 230 205 91 117 189 189 253 159 165 214 110 125 56 188 124 214 224 0 209 154 26 170 195 97 180 118 15 72 207 51 21 161 80 104 214 224 211 17 10 133 240 60 83 38 1 48 217 23 166 128 223 239 30 160 91 106 153 124 17 203 88 106 254 158 216 126 59 147 223 223 147 190 214 128 55 12 124 120 140 93 177 24 43 92 155 49 223 183 64 36 83 200 36 152 226 50 132 149 71 186 243 17 38 57 142 88 189 29 107 166 134 252 10 8 24 68 129 64 24 3 246 60 244 211 39 76 180 236 100 234 101 108 198 116 95 2 51 210 141 123 125 31 102 114 30 216 96 116 26 147 42 193 76 42 76 252 249 140 53 89 143 200 12 116 49 222 178 153 244 143 9 68 160 0 38 134 145 133 73 240 60 200 183 176 214 215 255 191 192 27 232 194 189 184 133 244 215 49 132 163 16 118 2 209 120 153 252 69 203 0 3 182 66 150 175 202 94 144 2 196 151 79 136 164 198 224 161 239 53 144 254 246 27 145 167 16 206 32 78 195 13 2 235 118 32 178 104 110 70 129 126 251 128 169 216 1 228 20 96 73 68 126 9 66 21 96 244 16 206 209 219 4 214 212 101 5 207 40 8 124 188 135 49 105 40 172 0 105 64 0 238 48 98 239 21 130 62 224 144 97 139 196 210 77 224 104 144 67 224 88 48 5 162 112 146 130 21 43 125 193 51 222 192 217 216 132 8 149 227 197 159 161 159 61 193 80 2 99 96 198 52 148 250 19 100 124 7 246 234 109 88 213 91 193 77 192 120 31 4 37 34 207 241 71 231 31 107 106 133 107 81 13 49 210 93 109 216 27 246 32 23 172 253 63 129 16 153 39 235 68 155 112 162 77 190 193 211 76 41 165 248 153 72 12 250 6 252 43 134 18 9 164 148 125 82 41 213 218 209 217 197 171 87 109 179 6 111 107 123 77 123 71 39 74 169 86 113 236 120 179 211 211 211 115 39 16 12 236 88 17 137 80 84 84 148 19 124 116 116 116 250 211 191 191 100 201 194 93 2 224 216 241 102 167 187 187 251 180 235 234 35 158 231 205 205 69 32 165 76 40 21 108 173 172 172 60 19 187 212 146 250 3 177 185 250 28 90 55 239 86 0 0 0 0 73 69 78 68 174 66 96 130]
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> resetCss [
	^ '/* http://meyerweb.com/eric/tools/css/reset/ v2.0 | 20110126 */
html,
body,
div,
span,
applet,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
big,
cite,
code,
del,
dfn,
em,
img,
ins,
kbd,
q,
s,
samp,
small,
strike,
strong,
sub,
sup,
tt,
var,
b,
u,
i,
center,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
canvas,
details,
embed,
figure,
figcaption,
footer,
header,
hgroup,
menu,
nav,
output,
ruby,
section,
summary,
time,
mark,
audio,
video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
menu,
nav,
section {
  display: block;
}
body {
  line-height: 1;
}
ol,
ul {
  list-style: none;
}
blockquote,
q {
  quotes: none;
}
blockquote:before,
blockquote:after,
q:before,
q:after {
  content: '''';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}
'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> screenCss [
	^ '/* Original style from softwaremaniacs.org (c) Ivan Sagalaev <Maniac@SoftwareManiacs.Org> */
.swagger-section pre code {
  display: block;
  padding: 0.5em;
  background: #F0F0F0;
}
.swagger-section pre code,
.swagger-section pre .subst,
.swagger-section pre .tag .title,
.swagger-section pre .lisp .title,
.swagger-section pre .clojure .built_in,
.swagger-section pre .nginx .title {
  color: black;
}
.swagger-section pre .string,
.swagger-section pre .title,
.swagger-section pre .constant,
.swagger-section pre .parent,
.swagger-section pre .tag .value,
.swagger-section pre .rules .value,
.swagger-section pre .rules .value .number,
.swagger-section pre .preprocessor,
.swagger-section pre .ruby .symbol,
.swagger-section pre .ruby .symbol .string,
.swagger-section pre .aggregate,
.swagger-section pre .template_tag,
.swagger-section pre .django .variable,
.swagger-section pre .smalltalk .class,
.swagger-section pre .addition,
.swagger-section pre .flow,
.swagger-section pre .stream,
.swagger-section pre .bash .variable,
.swagger-section pre .apache .tag,
.swagger-section pre .apache .cbracket,
.swagger-section pre .tex .command,
.swagger-section pre .tex .special,
.swagger-section pre .erlang_repl .function_or_atom,
.swagger-section pre .markdown .header {
  color: #800;
}
.swagger-section pre .comment,
.swagger-section pre .annotation,
.swagger-section pre .template_comment,
.swagger-section pre .diff .header,
.swagger-section pre .chunk,
.swagger-section pre .markdown .blockquote {
  color: #888;
}
.swagger-section pre .number,
.swagger-section pre .date,
.swagger-section pre .regexp,
.swagger-section pre .literal,
.swagger-section pre .smalltalk .symbol,
.swagger-section pre .smalltalk .char,
.swagger-section pre .go .constant,
.swagger-section pre .change,
.swagger-section pre .markdown .bullet,
.swagger-section pre .markdown .link_url {
  color: #080;
}
.swagger-section pre .label,
.swagger-section pre .javadoc,
.swagger-section pre .ruby .string,
.swagger-section pre .decorator,
.swagger-section pre .filter .argument,
.swagger-section pre .localvars,
.swagger-section pre .array,
.swagger-section pre .attr_selector,
.swagger-section pre .important,
.swagger-section pre .pseudo,
.swagger-section pre .pi,
.swagger-section pre .doctype,
.swagger-section pre .deletion,
.swagger-section pre .envvar,
.swagger-section pre .shebang,
.swagger-section pre .apache .sqbracket,
.swagger-section pre .nginx .built_in,
.swagger-section pre .tex .formula,
.swagger-section pre .erlang_repl .reserved,
.swagger-section pre .prompt,
.swagger-section pre .markdown .link_label,
.swagger-section pre .vhdl .attribute,
.swagger-section pre .clojure .attribute,
.swagger-section pre .coffeescript .property {
  color: #8888ff;
}
.swagger-section pre .keyword,
.swagger-section pre .id,
.swagger-section pre .phpdoc,
.swagger-section pre .title,
.swagger-section pre .built_in,
.swagger-section pre .aggregate,
.swagger-section pre .css .tag,
.swagger-section pre .javadoctag,
.swagger-section pre .phpdoc,
.swagger-section pre .yardoctag,
.swagger-section pre .smalltalk .class,
.swagger-section pre .winutils,
.swagger-section pre .bash .variable,
.swagger-section pre .apache .tag,
.swagger-section pre .go .typename,
.swagger-section pre .tex .command,
.swagger-section pre .markdown .strong,
.swagger-section pre .request,
.swagger-section pre .status {
  font-weight: bold;
}
.swagger-section pre .markdown .emphasis {
  font-style: italic;
}
.swagger-section pre .nginx .built_in {
  font-weight: normal;
}
.swagger-section pre .coffeescript .javascript,
.swagger-section pre .javascript .xml,
.swagger-section pre .tex .formula,
.swagger-section pre .xml .javascript,
.swagger-section pre .xml .vbscript,
.swagger-section pre .xml .css,
.swagger-section pre .xml .cdata {
  opacity: 0.5;
}
.swagger-section .swagger-ui-wrap {
  line-height: 1;
  font-family: "Droid Sans", sans-serif;
  max-width: 960px;
  margin-left: auto;
  margin-right: auto;
}
.swagger-section .swagger-ui-wrap b,
.swagger-section .swagger-ui-wrap strong {
  font-family: "Droid Sans", sans-serif;
  font-weight: bold;
}
.swagger-section .swagger-ui-wrap q,
.swagger-section .swagger-ui-wrap blockquote {
  quotes: none;
}
.swagger-section .swagger-ui-wrap p {
  line-height: 1.4em;
  padding: 0 0 10px;
  color: #333333;
}
.swagger-section .swagger-ui-wrap q:before,
.swagger-section .swagger-ui-wrap q:after,
.swagger-section .swagger-ui-wrap blockquote:before,
.swagger-section .swagger-ui-wrap blockquote:after {
  content: none;
}
.swagger-section .swagger-ui-wrap .heading_with_menu h1,
.swagger-section .swagger-ui-wrap .heading_with_menu h2,
.swagger-section .swagger-ui-wrap .heading_with_menu h3,
.swagger-section .swagger-ui-wrap .heading_with_menu h4,
.swagger-section .swagger-ui-wrap .heading_with_menu h5,
.swagger-section .swagger-ui-wrap .heading_with_menu h6 {
  display: block;
  clear: none;
  float: left;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -ms-box-sizing: border-box;
  box-sizing: border-box;
  width: 60%;
}
.swagger-section .swagger-ui-wrap table {
  border-collapse: collapse;
  border-spacing: 0;
}
.swagger-section .swagger-ui-wrap table thead tr th {
  padding: 5px;
  font-size: 0.9em;
  color: #666666;
  border-bottom: 1px solid #999999;
}
.swagger-section .swagger-ui-wrap table tbody tr:last-child td {
  border-bottom: none;
}
.swagger-section .swagger-ui-wrap table tbody tr.offset {
  background-color: #f0f0f0;
}
.swagger-section .swagger-ui-wrap table tbody tr td {
  padding: 6px;
  font-size: 0.9em;
  border-bottom: 1px solid #cccccc;
  vertical-align: top;
  line-height: 1.3em;
}
.swagger-section .swagger-ui-wrap ol {
  margin: 0px 0 10px;
  padding: 0 0 0 18px;
  list-style-type: decimal;
}
.swagger-section .swagger-ui-wrap ol li {
  padding: 5px 0px;
  font-size: 0.9em;
  color: #333333;
}
.swagger-section .swagger-ui-wrap ol,
.swagger-section .swagger-ui-wrap ul {
  list-style: none;
}
.swagger-section .swagger-ui-wrap h1 a,
.swagger-section .swagger-ui-wrap h2 a,
.swagger-section .swagger-ui-wrap h3 a,
.swagger-section .swagger-ui-wrap h4 a,
.swagger-section .swagger-ui-wrap h5 a,
.swagger-section .swagger-ui-wrap h6 a {
  text-decoration: none;
}
.swagger-section .swagger-ui-wrap h1 a:hover,
.swagger-section .swagger-ui-wrap h2 a:hover,
.swagger-section .swagger-ui-wrap h3 a:hover,
.swagger-section .swagger-ui-wrap h4 a:hover,
.swagger-section .swagger-ui-wrap h5 a:hover,
.swagger-section .swagger-ui-wrap h6 a:hover {
  text-decoration: underline;
}
.swagger-section .swagger-ui-wrap h1 span.divider,
.swagger-section .swagger-ui-wrap h2 span.divider,
.swagger-section .swagger-ui-wrap h3 span.divider,
.swagger-section .swagger-ui-wrap h4 span.divider,
.swagger-section .swagger-ui-wrap h5 span.divider,
.swagger-section .swagger-ui-wrap h6 span.divider {
  color: #aaaaaa;
}
.swagger-section .swagger-ui-wrap a {
  color: #547f00;
}
.swagger-section .swagger-ui-wrap a img {
  border: none;
}
.swagger-section .swagger-ui-wrap article,
.swagger-section .swagger-ui-wrap aside,
.swagger-section .swagger-ui-wrap details,
.swagger-section .swagger-ui-wrap figcaption,
.swagger-section .swagger-ui-wrap figure,
.swagger-section .swagger-ui-wrap footer,
.swagger-section .swagger-ui-wrap header,
.swagger-section .swagger-ui-wrap hgroup,
.swagger-section .swagger-ui-wrap menu,
.swagger-section .swagger-ui-wrap nav,
.swagger-section .swagger-ui-wrap section,
.swagger-section .swagger-ui-wrap summary {
  display: block;
}
.swagger-section .swagger-ui-wrap pre {
  font-family: "Anonymous Pro", "Menlo", "Consolas", "Bitstream Vera Sans Mono", "Courier New", monospace;
  background-color: #fcf6db;
  border: 1px solid #e5e0c6;
  padding: 10px;
}
.swagger-section .swagger-ui-wrap pre code {
  line-height: 1.6em;
  background: none;
}
.swagger-section .swagger-ui-wrap .content > .content-type > div > label {
  clear: both;
  display: block;
  color: #0F6AB4;
  font-size: 1.1em;
  margin: 0;
  padding: 15px 0 5px;
}
.swagger-section .swagger-ui-wrap .content pre {
  font-size: 12px;
  margin-top: 5px;
  padding: 5px;
}
.swagger-section .swagger-ui-wrap .icon-btn {
  cursor: pointer;
}
.swagger-section .swagger-ui-wrap .info_title {
  padding-bottom: 10px;
  font-weight: bold;
  font-size: 25px;
}
.swagger-section .swagger-ui-wrap p.big,
.swagger-section .swagger-ui-wrap div.big p {
  font-size: 1em;
  margin-bottom: 10px;
}
.swagger-section .swagger-ui-wrap form.fullwidth ol li.string input,
.swagger-section .swagger-ui-wrap form.fullwidth ol li.url input,
.swagger-section .swagger-ui-wrap form.fullwidth ol li.text textarea,
.swagger-section .swagger-ui-wrap form.fullwidth ol li.numeric input {
  width: 500px !important;
}
.swagger-section .swagger-ui-wrap .info_license {
  padding-bottom: 5px;
}
.swagger-section .swagger-ui-wrap .info_tos {
  padding-bottom: 5px;
}
.swagger-section .swagger-ui-wrap .message-fail {
  color: #cc0000;
}
.swagger-section .swagger-ui-wrap .info_url {
  padding-bottom: 5px;
}
.swagger-section .swagger-ui-wrap .info_email {
  padding-bottom: 5px;
}
.swagger-section .swagger-ui-wrap .info_name {
  padding-bottom: 5px;
}
.swagger-section .swagger-ui-wrap .info_description {
  padding-bottom: 10px;
  font-size: 15px;
}
.swagger-section .swagger-ui-wrap .markdown ol li,
.swagger-section .swagger-ui-wrap .markdown ul li {
  padding: 3px 0px;
  line-height: 1.4em;
  color: #333333;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.string input,
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.url input,
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.numeric input {
  display: block;
  padding: 4px;
  width: auto;
  clear: both;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.string input.title,
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.url input.title,
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.numeric input.title {
  font-size: 1.3em;
}
.swagger-section .swagger-ui-wrap table.fullwidth {
  width: 100%;
}
.swagger-section .swagger-ui-wrap .model-signature {
  font-family: "Droid Sans", sans-serif;
  font-size: 1em;
  line-height: 1.5em;
}
.swagger-section .swagger-ui-wrap .model-signature .signature-nav a {
  text-decoration: none;
  color: #AAA;
}
.swagger-section .swagger-ui-wrap .model-signature .signature-nav a:hover {
  text-decoration: underline;
  color: black;
}
.swagger-section .swagger-ui-wrap .model-signature .signature-nav .selected {
  color: black;
  text-decoration: none;
}
.swagger-section .swagger-ui-wrap .model-signature .propType {
  color: #5555aa;
}
.swagger-section .swagger-ui-wrap .model-signature pre:hover {
  background-color: #ffffdd;
}
.swagger-section .swagger-ui-wrap .model-signature pre {
  font-size: .85em;
  line-height: 1.2em;
  overflow: auto;
  max-height: 200px;
  cursor: pointer;
}
.swagger-section .swagger-ui-wrap .model-signature ul.signature-nav {
  display: block;
  margin: 0;
  padding: 0;
}
.swagger-section .swagger-ui-wrap .model-signature ul.signature-nav li:last-child {
  padding-right: 0;
  border-right: none;
}
.swagger-section .swagger-ui-wrap .model-signature ul.signature-nav li {
  float: left;
  margin: 0 5px 5px 0;
  padding: 2px 5px 2px 0;
  border-right: 1px solid #ddd;
}
.swagger-section .swagger-ui-wrap .model-signature .propOpt {
  color: #555;
}
.swagger-section .swagger-ui-wrap .model-signature .snippet small {
  font-size: 0.75em;
}
.swagger-section .swagger-ui-wrap .model-signature .propOptKey {
  font-style: italic;
}
.swagger-section .swagger-ui-wrap .model-signature .description .strong {
  font-weight: bold;
  color: #000;
  font-size: .9em;
}
.swagger-section .swagger-ui-wrap .model-signature .description div {
  font-size: 0.9em;
  line-height: 1.5em;
  margin-left: 1em;
}
.swagger-section .swagger-ui-wrap .model-signature .description .stronger {
  font-weight: bold;
  color: #000;
}
.swagger-section .swagger-ui-wrap .model-signature .description .propWrap .optionsWrapper {
  border-spacing: 0;
  position: absolute;
  background-color: #ffffff;
  border: 1px solid #bbbbbb;
  display: none;
  font-size: 11px;
  max-width: 400px;
  line-height: 30px;
  color: black;
  padding: 5px;
  margin-left: 10px;
}
.swagger-section .swagger-ui-wrap .model-signature .description .propWrap .optionsWrapper th {
  text-align: center;
  background-color: #eeeeee;
  border: 1px solid #bbbbbb;
  font-size: 11px;
  color: #666666;
  font-weight: bold;
  padding: 5px;
  line-height: 15px;
}
.swagger-section .swagger-ui-wrap .model-signature .description .propWrap .optionsWrapper .optionName {
  font-weight: bold;
}
.swagger-section .swagger-ui-wrap .model-signature .propName {
  font-weight: bold;
}
.swagger-section .swagger-ui-wrap .model-signature .signature-container {
  clear: both;
}
.swagger-section .swagger-ui-wrap .body-textarea {
  width: 300px;
  height: 100px;
  border: 1px solid #aaa;
}
.swagger-section .swagger-ui-wrap .markdown p code,
.swagger-section .swagger-ui-wrap .markdown li code {
  font-family: "Anonymous Pro", "Menlo", "Consolas", "Bitstream Vera Sans Mono", "Courier New", monospace;
  background-color: #f0f0f0;
  color: black;
  padding: 1px 3px;
}
.swagger-section .swagger-ui-wrap .required {
  font-weight: bold;
}
.swagger-section .swagger-ui-wrap input.parameter {
  width: 300px;
  border: 1px solid #aaa;
}
.swagger-section .swagger-ui-wrap h1 {
  color: black;
  font-size: 1.5em;
  line-height: 1.3em;
  padding: 10px 0 10px 0;
  font-family: "Droid Sans", sans-serif;
  font-weight: bold;
}
.swagger-section .swagger-ui-wrap .heading_with_menu {
  float: none;
  clear: both;
  overflow: hidden;
  display: block;
}
.swagger-section .swagger-ui-wrap .heading_with_menu ul {
  display: block;
  clear: none;
  float: right;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -ms-box-sizing: border-box;
  box-sizing: border-box;
  margin-top: 10px;
}
.swagger-section .swagger-ui-wrap h2 {
  color: black;
  font-size: 1.3em;
  padding: 10px 0 10px 0;
}
.swagger-section .swagger-ui-wrap h2 a {
  color: black;
}
.swagger-section .swagger-ui-wrap h2 span.sub {
  font-size: 0.7em;
  color: #999999;
  font-style: italic;
}
.swagger-section .swagger-ui-wrap h2 span.sub a {
  color: #777777;
}
.swagger-section .swagger-ui-wrap span.weak {
  color: #666666;
}
.swagger-section .swagger-ui-wrap .message-success {
  color: #89BF04;
}
.swagger-section .swagger-ui-wrap caption,
.swagger-section .swagger-ui-wrap th,
.swagger-section .swagger-ui-wrap td {
  text-align: left;
  font-weight: normal;
  vertical-align: middle;
}
.swagger-section .swagger-ui-wrap .code {
  font-family: "Anonymous Pro", "Menlo", "Consolas", "Bitstream Vera Sans Mono", "Courier New", monospace;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.text textarea {
  font-family: "Droid Sans", sans-serif;
  height: 250px;
  padding: 4px;
  display: block;
  clear: both;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.select select {
  display: block;
  clear: both;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.boolean {
  float: none;
  clear: both;
  overflow: hidden;
  display: block;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.boolean label {
  display: block;
  float: left;
  clear: none;
  margin: 0;
  padding: 0;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.boolean input {
  display: block;
  float: left;
  clear: none;
  margin: 0 5px 0 0;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li.required label {
  color: black;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li label {
  display: block;
  clear: both;
  width: auto;
  padding: 0 0 3px;
  color: #666666;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li label abbr {
  padding-left: 3px;
  color: #888888;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.inputs ol li p.inline-hints {
  margin-left: 0;
  font-style: italic;
  font-size: 0.9em;
  margin: 0;
}
.swagger-section .swagger-ui-wrap form.formtastic fieldset.buttons {
  margin: 0;
  padding: 0;
}
.swagger-section .swagger-ui-wrap span.blank,
.swagger-section .swagger-ui-wrap span.empty {
  color: #888888;
  font-style: italic;
}
.swagger-section .swagger-ui-wrap .markdown h3 {
  color: #547f00;
}
.swagger-section .swagger-ui-wrap .markdown h4 {
  color: #666666;
}
.swagger-section .swagger-ui-wrap .markdown pre {
  font-family: "Anonymous Pro", "Menlo", "Consolas", "Bitstream Vera Sans Mono", "Courier New", monospace;
  background-color: #fcf6db;
  border: 1px solid #e5e0c6;
  padding: 10px;
  margin: 0 0 10px 0;
}
.swagger-section .swagger-ui-wrap .markdown pre code {
  line-height: 1.6em;
}
.swagger-section .swagger-ui-wrap div.gist {
  margin: 20px 0 25px 0 !important;
}
.swagger-section .swagger-ui-wrap ul#resources {
  font-family: "Droid Sans", sans-serif;
  font-size: 0.9em;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource {
  border-bottom: 1px solid #dddddd;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource:hover div.heading h2 a,
.swagger-section .swagger-ui-wrap ul#resources li.resource.active div.heading h2 a {
  color: black;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource:hover div.heading ul.options li a,
.swagger-section .swagger-ui-wrap ul#resources li.resource.active div.heading ul.options li a {
  color: #555555;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource:last-child {
  border-bottom: none;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading {
  border: 1px solid transparent;
  float: none;
  clear: both;
  overflow: hidden;
  display: block;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options {
  overflow: hidden;
  padding: 0;
  display: block;
  clear: none;
  float: right;
  margin: 14px 10px 0 0;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li {
  float: left;
  clear: none;
  margin: 0;
  padding: 2px 10px;
  border-right: 1px solid #dddddd;
  color: #666666;
  font-size: 0.9em;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li a {
  color: #aaaaaa;
  text-decoration: none;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li a:hover {
  text-decoration: underline;
  color: black;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li a:hover,
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li a:active,
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li a.active {
  text-decoration: underline;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li:first-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li.first {
  padding-left: 0;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li:last-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options li.last {
  padding-right: 0;
  border-right: none;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options:first-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading ul.options.first {
  padding-left: 0;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading h2 {
  color: #999999;
  padding-left: 0;
  display: block;
  clear: none;
  float: left;
  font-family: "Droid Sans", sans-serif;
  font-weight: bold;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading h2 a {
  color: #999999;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource div.heading h2 a:hover {
  color: black;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation {
  float: none;
  clear: both;
  overflow: hidden;
  display: block;
  margin: 0 0 10px;
  padding: 0;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading {
  float: none;
  clear: both;
  overflow: hidden;
  display: block;
  margin: 0;
  padding: 0;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading h3 {
  display: block;
  clear: none;
  float: left;
  width: auto;
  margin: 0;
  padding: 0;
  line-height: 1.1em;
  color: black;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading h3 span.path {
  padding-left: 10px;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading h3 span.path a {
  color: black;
  text-decoration: none;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading h3 span.path a:hover {
  text-decoration: underline;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading h3 span.http_method a {
  text-transform: uppercase;
  text-decoration: none;
  color: white;
  display: inline-block;
  width: 50px;
  font-size: 0.7em;
  text-align: center;
  padding: 7px 0 4px;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  -o-border-radius: 2px;
  -ms-border-radius: 2px;
  -khtml-border-radius: 2px;
  border-radius: 2px;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading h3 span {
  margin: 0;
  padding: 0;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading ul.options {
  overflow: hidden;
  padding: 0;
  display: block;
  clear: none;
  float: right;
  margin: 6px 10px 0 0;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading ul.options li {
  float: left;
  clear: none;
  margin: 0;
  padding: 2px 10px;
  font-size: 0.9em;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading ul.options li a {
  text-decoration: none;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.heading ul.options li.access {
  color: black;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.content {
  border-top: none;
  padding: 10px;
  -moz-border-radius-bottomleft: 6px;
  -webkit-border-bottom-left-radius: 6px;
  -o-border-bottom-left-radius: 6px;
  -ms-border-bottom-left-radius: 6px;
  -khtml-border-bottom-left-radius: 6px;
  border-bottom-left-radius: 6px;
  -moz-border-radius-bottomright: 6px;
  -webkit-border-bottom-right-radius: 6px;
  -o-border-bottom-right-radius: 6px;
  -ms-border-bottom-right-radius: 6px;
  -khtml-border-bottom-right-radius: 6px;
  border-bottom-right-radius: 6px;
  margin: 0 0 20px;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.content h4 {
  font-size: 1.1em;
  margin: 0;
  padding: 15px 0 5px;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.content div.sandbox_header {
  float: none;
  clear: both;
  overflow: hidden;
  display: block;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.content div.sandbox_header a {
  padding: 4px 0 0 10px;
  display: inline-block;
  font-size: 0.9em;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.content div.sandbox_header input.submit {
  display: block;
  clear: none;
  float: left;
  padding: 6px 8px;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.content div.sandbox_header span.response_throbber {
  background-image: url(''../images/throbber.gif'');
  width: 128px;
  height: 16px;
  display: block;
  clear: none;
  float: right;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.content form input[type=''text''].error {
  outline: 2px solid black;
  outline-color: #cc0000;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation div.content div.response div.block pre {
  font-family: "Anonymous Pro", "Menlo", "Consolas", "Bitstream Vera Sans Mono", "Courier New", monospace;
  padding: 10px;
  font-size: 0.9em;
  max-height: 400px;
  overflow-y: auto;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.heading {
  background-color: #f9f2e9;
  border: 1px solid #f0e0ca;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.heading h3 span.http_method a {
  background-color: #c5862b;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.heading ul.options li {
  border-right: 1px solid #dddddd;
  border-right-color: #f0e0ca;
  color: #c5862b;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.heading ul.options li a {
  color: #c5862b;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.content {
  background-color: #faf5ee;
  border: 1px solid #f0e0ca;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.content h4 {
  color: #c5862b;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.content div.sandbox_header a {
  color: #dcb67f;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.heading {
  background-color: #fcffcd;
  border: 1px solid black;
  border-color: #ffd20f;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.heading h3 span.http_method a {
  text-transform: uppercase;
  background-color: #ffd20f;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.heading ul.options li {
  border-right: 1px solid #dddddd;
  border-right-color: #ffd20f;
  color: #ffd20f;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.heading ul.options li a {
  color: #ffd20f;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.content {
  background-color: #fcffcd;
  border: 1px solid black;
  border-color: #ffd20f;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.content h4 {
  color: #ffd20f;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.content div.sandbox_header a {
  color: #6fc992;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.heading {
  background-color: #f5e8e8;
  border: 1px solid #e8c6c7;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.heading h3 span.http_method a {
  text-transform: uppercase;
  background-color: #a41e22;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.heading ul.options li {
  border-right: 1px solid #dddddd;
  border-right-color: #e8c6c7;
  color: #a41e22;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.heading ul.options li a {
  color: #a41e22;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.content {
  background-color: #f7eded;
  border: 1px solid #e8c6c7;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.content h4 {
  color: #a41e22;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.content div.sandbox_header a {
  color: #c8787a;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.heading {
  background-color: #e7f6ec;
  border: 1px solid #c3e8d1;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.heading h3 span.http_method a {
  background-color: #10a54a;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.heading ul.options li {
  border-right: 1px solid #dddddd;
  border-right-color: #c3e8d1;
  color: #10a54a;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.heading ul.options li a {
  color: #10a54a;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.content {
  background-color: #ebf7f0;
  border: 1px solid #c3e8d1;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.content h4 {
  color: #10a54a;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.content div.sandbox_header a {
  color: #6fc992;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.heading {
  background-color: #FCE9E3;
  border: 1px solid #F5D5C3;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.heading h3 span.http_method a {
  background-color: #D38042;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.heading ul.options li {
  border-right: 1px solid #dddddd;
  border-right-color: #f0cecb;
  color: #D38042;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.heading ul.options li a {
  color: #D38042;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.content {
  background-color: #faf0ef;
  border: 1px solid #f0cecb;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.content h4 {
  color: #D38042;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.content div.sandbox_header a {
  color: #dcb67f;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.heading {
  background-color: #e7f0f7;
  border: 1px solid #c3d9ec;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.heading h3 span.http_method a {
  background-color: #0f6ab4;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.heading ul.options li {
  border-right: 1px solid #dddddd;
  border-right-color: #c3d9ec;
  color: #0f6ab4;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.heading ul.options li a {
  color: #0f6ab4;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.content {
  background-color: #ebf3f9;
  border: 1px solid #c3d9ec;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.content h4 {
  color: #0f6ab4;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.content div.sandbox_header a {
  color: #6fa5d2;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.options div.heading {
  background-color: #e7f0f7;
  border: 1px solid #c3d9ec;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.options div.heading h3 span.http_method a {
  background-color: #0f6ab4;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.options div.heading ul.options li {
  border-right: 1px solid #dddddd;
  border-right-color: #c3d9ec;
  color: #0f6ab4;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.options div.heading ul.options li a {
  color: #0f6ab4;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.options div.content {
  background-color: #ebf3f9;
  border: 1px solid #c3d9ec;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.options div.content h4 {
  color: #0f6ab4;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.options div.content div.sandbox_header a {
  color: #6fa5d2;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.content,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.content,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.content,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.content,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.content,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.content {
  border-top: none;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.heading ul.options li:last-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.heading ul.options li:last-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.heading ul.options li:last-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.heading ul.options li:last-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.heading ul.options li:last-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.heading ul.options li:last-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.get div.heading ul.options li.last,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.post div.heading ul.options li.last,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.head div.heading ul.options li.last,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.put div.heading ul.options li.last,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.patch div.heading ul.options li.last,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations li.operation.delete div.heading ul.options li.last {
  padding-right: 0;
  border-right: none;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations ul.options li a:hover,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations ul.options li a:active,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations ul.options li a.active {
  text-decoration: underline;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations ul.options li:first-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations ul.options li.first {
  padding-left: 0;
}
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations:first-child,
.swagger-section .swagger-ui-wrap ul#resources li.resource ul.endpoints li.endpoint ul.operations.first {
  padding-left: 0;
}
.swagger-section .swagger-ui-wrap p#colophon {
  margin: 0 15px 40px 15px;
  padding: 10px 0;
  font-size: 0.8em;
  border-top: 1px solid #dddddd;
  font-family: "Droid Sans", sans-serif;
  color: #999999;
  font-style: italic;
}
.swagger-section .swagger-ui-wrap p#colophon a {
  text-decoration: none;
  color: #547f00;
}
.swagger-section .swagger-ui-wrap h3 {
  color: black;
  font-size: 1.1em;
  padding: 10px 0 10px 0;
}
.swagger-section .swagger-ui-wrap .markdown ol,
.swagger-section .swagger-ui-wrap .markdown ul {
  font-family: "Droid Sans", sans-serif;
  margin: 5px 0 10px;
  padding: 0 0 0 18px;
  list-style-type: disc;
}
.swagger-section .swagger-ui-wrap form.form_box {
  background-color: #ebf3f9;
  border: 1px solid #c3d9ec;
  padding: 10px;
}
.swagger-section .swagger-ui-wrap form.form_box label {
  color: #0f6ab4 !important;
}
.swagger-section .swagger-ui-wrap form.form_box input[type=submit] {
  display: block;
  padding: 10px;
}
.swagger-section .swagger-ui-wrap form.form_box p.weak {
  font-size: 0.8em;
}
.swagger-section .swagger-ui-wrap form.form_box p {
  font-size: 0.9em;
  padding: 0 0 15px;
  color: #7e7b6d;
}
.swagger-section .swagger-ui-wrap form.form_box p a {
  color: #646257;
}
.swagger-section .swagger-ui-wrap form.form_box p strong {
  color: black;
}
.swagger-section .title {
  font-style: bold;
}
.swagger-section .secondary_form {
  display: none;
}
.swagger-section .main_image {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
.swagger-section .oauth_body {
  margin-left: 100px;
  margin-right: 100px;
}
.swagger-section .oauth_submit {
  text-align: center;
}
.swagger-section .api-popup-dialog {
  z-index: 10000;
  position: absolute;
  width: 500px;
  background: #FFF;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  display: none;
  font-size: 13px;
  color: #777;
}
.swagger-section .api-popup-dialog .api-popup-title {
  font-size: 24px;
  padding: 10px 0;
}
.swagger-section .api-popup-dialog .api-popup-title {
  font-size: 24px;
  padding: 10px 0;
}
.swagger-section .api-popup-dialog p.error-msg {
  padding-left: 5px;
  padding-bottom: 5px;
}
.swagger-section .api-popup-dialog button.api-popup-authbtn {
  height: 30px;
}
.swagger-section .api-popup-dialog button.api-popup-cancel {
  height: 30px;
}
.swagger-section .api-popup-scopes {
  padding: 10px 20px;
}
.swagger-section .api-popup-scopes li {
  padding: 5px 0;
  line-height: 20px;
}
.swagger-section .api-popup-scopes .api-scope-desc {
  padding-left: 20px;
  font-style: italic;
}
.swagger-section .api-popup-scopes li input {
  position: relative;
  top: 2px;
}
.swagger-section .api-popup-actions {
  padding-top: 10px;
}
.swagger-section .access {
  float: right;
}
.swagger-section .auth {
  float: right;
}
.swagger-section #api_information_panel {
  position: absolute;
  background: #FFF;
  border: 1px solid #ccc;
  border-radius: 5px;
  display: none;
  font-size: 13px;
  max-width: 300px;
  line-height: 30px;
  color: black;
  padding: 5px;
}
.swagger-section #api_information_panel p .api-msg-enabled {
  color: green;
}
.swagger-section #api_information_panel p .api-msg-disabled {
  color: red;
}
.swagger-section .api-ic {
  height: 18px;
  vertical-align: middle;
  display: inline-block;
  background: url(../images/explorer_icons.png) no-repeat;
}
.swagger-section .ic-info {
  background-position: 0 0;
  width: 18px;
  margin-top: -7px;
  margin-left: 4px;
}
.swagger-section .ic-warning {
  background-position: -60px 0;
  width: 18px;
  margin-top: -7px;
  margin-left: 4px;
}
.swagger-section .ic-error {
  background-position: -30px 0;
  width: 18px;
  margin-top: -7px;
  margin-left: 4px;
}
.swagger-section .ic-off {
  background-position: -90px 0;
  width: 58px;
  margin-top: -4px;
  cursor: pointer;
}
.swagger-section .ic-on {
  background-position: -160px 0;
  width: 58px;
  margin-top: -4px;
  cursor: pointer;
}
.swagger-section #header {
  background-color: #89bf04;
  padding: 14px;
}
.swagger-section #header a#logo {
  font-size: 1.5em;
  font-weight: bold;
  text-decoration: none;
  background: transparent url(../images/logo_small.png) no-repeat left center;
  padding: 20px 0 20px 40px;
  color: white;
}
.swagger-section #header form#api_selector {
  display: block;
  clear: none;
  float: right;
}
.swagger-section #header form#api_selector .input {
  display: block;
  clear: none;
  float: left;
  margin: 0 10px 0 0;
}
.swagger-section #header form#api_selector .input input#input_apiKey {
  width: 200px;
}
.swagger-section #header form#api_selector .input input#input_baseUrl {
  width: 400px;
}
.swagger-section #header form#api_selector .input a#explore {
  display: block;
  text-decoration: none;
  font-weight: bold;
  padding: 6px 8px;
  font-size: 0.9em;
  color: white;
  background-color: #547f00;
  -moz-border-radius: 4px;
  -webkit-border-radius: 4px;
  -o-border-radius: 4px;
  -ms-border-radius: 4px;
  -khtml-border-radius: 4px;
  border-radius: 4px;
}
.swagger-section #header form#api_selector .input a#explore:hover {
  background-color: #547f00;
}
.swagger-section #header form#api_selector .input input {
  font-size: 0.9em;
  padding: 3px;
  margin: 0;
}
.swagger-section #content_message {
  margin: 10px 15px;
  font-style: italic;
  color: #999999;
}
.swagger-section #message-bar {
  min-height: 30px;
  text-align: center;
  padding-top: 10px;
}
'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> shredbundleJs [
	^ 'var require = function (file, cwd) {
    var resolved = require.resolve(file, cwd || ''/'');
    var mod = require.modules[resolved];
    if (!mod) throw new Error(
        ''Failed to resolve module '' + file + '', tried '' + resolved
    );
    var res = mod._cached ? mod._cached : mod();
    return res;
}

require.paths = [];
require.modules = {};
require.extensions = [".js",".coffee"];

require._core = {
    ''assert'': true,
    ''events'': true,
    ''fs'': true,
    ''path'': true,
    ''vm'': true
};

require.resolve = (function () {
    return function (x, cwd) {
        if (!cwd) cwd = ''/'';
        
        if (require._core[x]) return x;
        var path = require.modules.path();
        var y = cwd || ''.'';
        
        if (x.match(/^(?:\.\.?\/|\/)/)) {
            var m = loadAsFileSync(path.resolve(y, x))
                || loadAsDirectorySync(path.resolve(y, x));
            if (m) return m;
        }
        
        var n = loadNodeModulesSync(x, y);
        if (n) return n;
        
        throw new Error("Cannot find module ''" + x + "''");
        
        function loadAsFileSync (x) {
            if (require.modules[x]) {
                return x;
            }
            
            for (var i = 0; i < require.extensions.length; i++) {
                var ext = require.extensions[i];
                if (require.modules[x + ext]) return x + ext;
            }
        }
        
        function loadAsDirectorySync (x) {
            x = x.replace(/\/+$/, '''');
            var pkgfile = x + ''/package.json'';
            if (require.modules[pkgfile]) {
                var pkg = require.modules[pkgfile]();
                var b = pkg.browserify;
                if (typeof b === ''object'' && b.main) {
                    var m = loadAsFileSync(path.resolve(x, b.main));
                    if (m) return m;
                }
                else if (typeof b === ''string'') {
                    var m = loadAsFileSync(path.resolve(x, b));
                    if (m) return m;
                }
                else if (pkg.main) {
                    var m = loadAsFileSync(path.resolve(x, pkg.main));
                    if (m) return m;
                }
            }
            
            return loadAsFileSync(x + ''/index'');
        }
        
        function loadNodeModulesSync (x, start) {
            var dirs = nodeModulesPathsSync(start);
            for (var i = 0; i < dirs.length; i++) {
                var dir = dirs[i];
                var m = loadAsFileSync(dir + ''/'' + x);
                if (m) return m;
                var n = loadAsDirectorySync(dir + ''/'' + x);
                if (n) return n;
            }
            
            var m = loadAsFileSync(x);
            if (m) return m;
        }
        
        function nodeModulesPathsSync (start) {
            var parts;
            if (start === ''/'') parts = [ '''' ];
            else parts = path.normalize(start).split(''/'');
            
            var dirs = [];
            for (var i = parts.length - 1; i >= 0; i--) {
                if (parts[i] === ''node_modules'') continue;
                var dir = parts.slice(0, i + 1).join(''/'') + ''/node_modules'';
                dirs.push(dir);
            }
            
            return dirs;
        }
    };
})();

require.alias = function (from, to) {
    var path = require.modules.path();
    var res = null;
    try {
        res = require.resolve(from + ''/package.json'', ''/'');
    }
    catch (err) {
        res = require.resolve(from, ''/'');
    }
    var basedir = path.dirname(res);
    
    var keys = (Object.keys || function (obj) {
        var res = [];
        for (var key in obj) res.push(key)
        return res;
    })(require.modules);
    
    for (var i = 0; i < keys.length; i++) {
        var key = keys[i];
        if (key.slice(0, basedir.length + 1) === basedir + ''/'') {
            var f = key.slice(basedir.length);
            require.modules[to + f] = require.modules[basedir + f];
        }
        else if (key === basedir) {
            require.modules[to] = require.modules[basedir];
        }
    }
};

require.define = function (filename, fn) {
    var dirname = require._core[filename]
        ? ''''
        : require.modules.path().dirname(filename)
    ;
    
    var require_ = function (file) {
        return require(file, dirname)
    };
    require_.resolve = function (name) {
        return require.resolve(name, dirname);
    };
    require_.modules = require.modules;
    require_.define = require.define;
    var module_ = { exports : {} };
    
    require.modules[filename] = function () {
        require.modules[filename]._cached = module_.exports;
        fn.call(
            module_.exports,
            require_,
            module_,
            module_.exports,
            dirname,
            filename
        );
        require.modules[filename]._cached = module_.exports;
        return module_.exports;
    };
};

if (typeof process === ''undefined'') process = {};

if (!process.nextTick) process.nextTick = (function () {
    var queue = [];
    var canPost = typeof window !== ''undefined''
        && window.postMessage && window.addEventListener
    ;
    
    if (canPost) {
        window.addEventListener(''message'', function (ev) {
            if (ev.source === window && ev.data === ''browserify-tick'') {
                ev.stopPropagation();
                if (queue.length > 0) {
                    var fn = queue.shift();
                    fn();
                }
            }
        }, true);
    }
    
    return function (fn) {
        if (canPost) {
            queue.push(fn);
            window.postMessage(''browserify-tick'', ''*'');
        }
        else setTimeout(fn, 0);
    };
})();

if (!process.title) process.title = ''browser'';

if (!process.binding) process.binding = function (name) {
    if (name === ''evals'') return require(''vm'')
    else throw new Error(''No such module'')
};

if (!process.cwd) process.cwd = function () { return ''.'' };

require.define("path", function (require, module, exports, __dirname, __filename) {
    function filter (xs, fn) {
    var res = [];
    for (var i = 0; i < xs.length; i++) {
        if (fn(xs[i], i, xs)) res.push(xs[i]);
    }
    return res;
}

// resolves . and .. elements in a path array with directory names there
// must be no slashes, empty elements, or device names (c:\) in the array
// (so also no leading and trailing slashes - it does not distinguish
// relative and absolute paths)
function normalizeArray(parts, allowAboveRoot) {
  // if the path tries to go above the root, `up` ends up > 0
  var up = 0;
  for (var i = parts.length; i >= 0; i--) {
    var last = parts[i];
    if (last == ''.'') {
      parts.splice(i, 1);
    } else if (last === ''..'') {
      parts.splice(i, 1);
      up++;
    } else if (up) {
      parts.splice(i, 1);
      up--;
    }
  }

  // if the path is allowed to go above the root, restore leading ..s
  if (allowAboveRoot) {
    for (; up--; up) {
      parts.unshift(''..'');
    }
  }

  return parts;
}

// Regex to split a filename into [*, dir, basename, ext]
// posix version
var splitPathRe = /^(.+\/(?!$)|\/)?((?:.+?)?(\.[^.]*)?)$/;

// path.resolve([from ...], to)
// posix version
exports.resolve = function() {
var resolvedPath = '''',
    resolvedAbsolute = false;

for (var i = arguments.length; i >= -1 && !resolvedAbsolute; i--) {
  var path = (i >= 0)
      ? arguments[i]
      : process.cwd();

  // Skip empty and invalid entries
  if (typeof path !== ''string'' || !path) {
    continue;
  }

  resolvedPath = path + ''/'' + resolvedPath;
  resolvedAbsolute = path.charAt(0) === ''/'';
}

// At this point the path should be resolved to a full absolute path, but
// handle relative paths to be safe (might happen when process.cwd() fails)

// Normalize the path
resolvedPath = normalizeArray(filter(resolvedPath.split(''/''), function(p) {
    return !!p;
  }), !resolvedAbsolute).join(''/'');

  return ((resolvedAbsolute ? ''/'' : '''') + resolvedPath) || ''.'';
};

// path.normalize(path)
// posix version
exports.normalize = function(path) {
var isAbsolute = path.charAt(0) === ''/'',
    trailingSlash = path.slice(-1) === ''/'';

// Normalize the path
path = normalizeArray(filter(path.split(''/''), function(p) {
    return !!p;
  }), !isAbsolute).join(''/'');

  if (!path && !isAbsolute) {
    path = ''.'';
  }
  if (path && trailingSlash) {
    path += ''/'';
  }
  
  return (isAbsolute ? ''/'' : '''') + path;
};


// posix version
exports.join = function() {
  var paths = Array.prototype.slice.call(arguments, 0);
  return exports.normalize(filter(paths, function(p, index) {
    return p && typeof p === ''string'';
  }).join(''/''));
};


exports.dirname = function(path) {
  var dir = splitPathRe.exec(path)[1] || '''';
  var isWindows = false;
  if (!dir) {
    // No dirname
    return ''.'';
  } else if (dir.length === 1 ||
      (isWindows && dir.length <= 3 && dir.charAt(1) === '':'')) {
    // It is just a slash or a drive letter with a slash
    return dir;
  } else {
    // It is a full dirname, strip trailing slash
    return dir.substring(0, dir.length - 1);
  }
};


exports.basename = function(path, ext) {
  var f = splitPathRe.exec(path)[2] || '''';
  // TODO: make this comparison case-insensitive on windows?
  if (ext && f.substr(-1 * ext.length) === ext) {
    f = f.substr(0, f.length - ext.length);
  }
  return f;
};


exports.extname = function(path) {
  return splitPathRe.exec(path)[3] || '''';
};

});

require.define("/shred.js", function (require, module, exports, __dirname, __filename) {
    // Shred is an HTTP client library intended to simplify the use of Node''s
// built-in HTTP library. In particular, we wanted to make it easier to interact
// with HTTP-based APIs.
// 
// See the [examples](./examples.html) for more details.

// Ax is a nice logging library we wrote. You can use any logger, providing it
// has `info`, `warn`, `debug`, and `error` methods that take a string.
var Ax = require("ax")
  , CookieJarLib = require( "cookiejar" )
  , CookieJar = CookieJarLib.CookieJar
;

// Shred takes some options, including a logger and request defaults.

var Shred = function(options) {
  options = (options||{});
  this.agent = options.agent;
  this.defaults = options.defaults||{};
  this.log = options.logger||(new Ax({ level: "info" }));
  this._sharedCookieJar = new CookieJar();
  this.logCurl = options.logCurl || false;
};

// Most of the real work is done in the request and reponse classes.
 
Shred.Request = require("./shred/request");
Shred.Response = require("./shred/response");

// The `request` method kicks off a new request, instantiating a new `Request`
// object and passing along whatever default options we were given.

Shred.prototype = {
  request: function(options) {
    options.logger = this.log;
    options.logCurl = options.logCurl || this.logCurl;
    options.cookieJar = ( ''cookieJar'' in options ) ? options.cookieJar : this._sharedCookieJar; // let them set cookieJar = null
    options.agent = options.agent || this.agent;
    // fill in default options
    for (var key in this.defaults) {
      if (this.defaults.hasOwnProperty(key) && !options[key]) {
        options[key] = this.defaults[key]
      }
    }
    return new Shred.Request(options);
  }
};

// Define a bunch of convenience methods so that you don''t have to include
// a `method` property in your request options.

"get put post delete".split(" ").forEach(function(method) {
  Shred.prototype[method] = function(options) {
    options.method = method;
    return this.request(options);
  };
});


module.exports = Shred;

});

require.define("/node_modules/ax/package.json", function (require, module, exports, __dirname, __filename) {
    module.exports = {"main":"./lib/ax.js"}
});

require.define("/node_modules/ax/lib/ax.js", function (require, module, exports, __dirname, __filename) {
    var inspect = require("util").inspect
  , fs = require("fs")
;


// this is a quick-and-dirty logger. there are other nicer loggers out there
// but the ones i found were also somewhat involved. this one has a Ruby
// logger type interface
//
// we can easily replace this, provide the info, debug, etc. methods are the
// same. or, we can change Haiku to use a more standard node.js interface

var format = function(level,message) {
  var debug = (level=="debug"||level=="error");
  if (!message) { return message.toString(); }
  if (typeof(message) == "object") {
    if (message instanceof Error && debug) {
      return message.stack;
    } else {
      return inspect(message);
    }
  } else {
    return message.toString();
  }
};

var noOp = function(message) { return this; }
var makeLogger = function(level,fn) {
  return function(message) { 
    this.stream.write(this.format(level, message)+"\n");
    return this;
  }
};

var Logger = function(options) {
  var logger = this;
  var options = options||{};

  // Default options
  options.level = options.level || "info";
  options.timestamp = options.timestamp || true;
  options.prefix = options.prefix || "";
  logger.options = options;

  // Allows a prefix to be added to the message.
  //
  //    var logger = new Ax({ module: ''Haiku'' })
  //    logger.warn(''this is going to be awesome!'');
  //    //=> Haiku: this is going to be awesome!
  //
  if (logger.options.module){
    logger.options.prefix = logger.options.module;
  }

  // Write to stderr or a file
  if (logger.options.file){
    logger.stream = fs.createWriteStream(logger.options.file, {"flags": "a"});
  } else {
      if(process.title === "node")
    logger.stream = process.stderr;
      else if(process.title === "browser")
    logger.stream = function () {
      // Work around weird console context issue: http://code.google.com/p/chromium/issues/detail?id=48662
      return console[logger.options.level].apply(console, arguments);
    };
  }

  switch(logger.options.level){
    case ''debug'':
      [''debug'', ''info'', ''warn''].forEach(function (level) {
        logger[level] = Logger.writer(level);
      });
    case ''info'':
      [''info'', ''warn''].forEach(function (level) {
        logger[level] = Logger.writer(level);
      });
    case ''warn'':
      logger.warn = Logger.writer(''warn'');
  }
}

// Used to define logger methods
Logger.writer = function(level){
  return function(message){
    var logger = this;

    if(process.title === "node")
  logger.stream.write(logger.format(level, message) + ''\n'');
    else if(process.title === "browser")
  logger.stream(logger.format(level, message) + ''\n'');

  };
}


Logger.prototype = {
  info: function(){},
  debug: function(){},
  warn: function(){},
  error: Logger.writer(''error''),
  format: function(level, message){
    if (! message) return '''';

    var logger = this
      , prefix = logger.options.prefix
      , timestamp = logger.options.timestamp ? " " + (new Date().toISOString()) : ""
    ;

    return (prefix + timestamp + ": " + message);
  }
};

module.exports = Logger;

});

require.define("util", function (require, module, exports, __dirname, __filename) {
    // todo

});

require.define("fs", function (require, module, exports, __dirname, __filename) {
    // nothing to see here... no file methods for the browser

});

require.define("/node_modules/cookiejar/package.json", function (require, module, exports, __dirname, __filename) {
    module.exports = {"main":"cookiejar.js"}
});

require.define("/node_modules/cookiejar/cookiejar.js", function (require, module, exports, __dirname, __filename) {
    exports.CookieAccessInfo=CookieAccessInfo=function CookieAccessInfo(domain,path,secure,script) {
    if(this instanceof CookieAccessInfo) {
      this.domain=domain||undefined;
      this.path=path||"/";
      this.secure=!!secure;
      this.script=!!script;
      return this;
    }
    else {
        return new CookieAccessInfo(domain,path,secure,script)    
    }
}

exports.Cookie=Cookie=function Cookie(cookiestr) {
  if(cookiestr instanceof Cookie) {
    return cookiestr;
  }
    else {
        if(this instanceof Cookie) {
          this.name = null;
          this.value = null;
          this.expiration_date = Infinity;
          this.path = "/";
          this.domain = null;
          this.secure = false; //how to define?
          this.noscript = false; //httponly
          if(cookiestr) {
            this.parse(cookiestr)
          }
          return this;
        }
        return new Cookie(cookiestr)
    }
}

Cookie.prototype.toString = function toString() {
  var str=[this.name+"="+this.value];
  if(this.expiration_date !== Infinity) {
    str.push("expires="+(new Date(this.expiration_date)).toGMTString());
  }
  if(this.domain) {
    str.push("domain="+this.domain);
  }
  if(this.path) {
    str.push("path="+this.path);
  }
  if(this.secure) {
    str.push("secure");
  }
  if(this.noscript) {
    str.push("httponly");
  }
  return str.join("; ");
}

Cookie.prototype.toValueString = function toValueString() {
  return this.name+"="+this.value;
}

var cookie_str_splitter=/[:](?=\s*[a-zA-Z0-9_\-]+\s*[=])/g
Cookie.prototype.parse = function parse(str) {
  if(this instanceof Cookie) {
      var parts=str.split(";")
      , pair=parts[0].match(/([^=]+)=((?:.|\n)*)/)
      , key=pair[1]
      , value=pair[2];
      this.name = key;
      this.value = value;
    
      for(var i=1;i<parts.length;i++) {
        pair=parts[i].match(/([^=]+)(?:=((?:.|\n)*))?/)
        , key=pair[1].trim().toLowerCase()
        , value=pair[2];
        switch(key) {
          case "httponly":
            this.noscript = true;
          break;
          case "expires":
            this.expiration_date = value
              ? Number(Date.parse(value))
              : Infinity;
          break;
          case "path":
            this.path = value
              ? value.trim()
              : "";
          break;
          case "domain":
            this.domain = value
              ? value.trim()
              : "";
          break;
          case "secure":
            this.secure = true;
          break
        }
      }
    
      return this;
  }
    return new Cookie().parse(str)
}

Cookie.prototype.matches = function matches(access_info) {
  if(this.noscript && access_info.script
  || this.secure && !access_info.secure
  || !this.collidesWith(access_info)) {
    return false
  }
  return true;
}

Cookie.prototype.collidesWith = function collidesWith(access_info) {
  if((this.path && !access_info.path) || (this.domain && !access_info.domain)) {
    return false
  }
  if(this.path && access_info.path.indexOf(this.path) !== 0) {
    return false;
  }
  if (this.domain===access_info.domain) {
    return true;
  }
  else if(this.domain && this.domain.charAt(0)===".")
  {
    var wildcard=access_info.domain.indexOf(this.domain.slice(1))
    if(wildcard===-1 || wildcard!==access_info.domain.length-this.domain.length+1) {
      return false;
    }
  }
  else if(this.domain){
    return false
  }
  return true;
}

exports.CookieJar=CookieJar=function CookieJar() {
  if(this instanceof CookieJar) {
      var cookies = {} //name: [Cookie]
    
      this.setCookie = function setCookie(cookie) {
        cookie = Cookie(cookie);
        //Delete the cookie if the set is past the current time
        var remove = cookie.expiration_date <= Date.now();
        if(cookie.name in cookies) {
          var cookies_list = cookies[cookie.name];
          for(var i=0;i<cookies_list.length;i++) {
            var collidable_cookie = cookies_list[i];
            if(collidable_cookie.collidesWith(cookie)) {
              if(remove) {
                cookies_list.splice(i,1);
                if(cookies_list.length===0) {
                  delete cookies[cookie.name]
                }
                return false;
              }
              else {
                return cookies_list[i]=cookie;
              }
            }
          }
          if(remove) {
            return false;
          }
          cookies_list.push(cookie);
          return cookie;
        }
        else if(remove){
          return false;
        }
        else {
          return cookies[cookie.name]=[cookie];
        }
      }
      //returns a cookie
      this.getCookie = function getCookie(cookie_name,access_info) {
        var cookies_list = cookies[cookie_name];
        for(var i=0;i<cookies_list.length;i++) {
          var cookie = cookies_list[i];
          if(cookie.expiration_date <= Date.now()) {
            if(cookies_list.length===0) {
              delete cookies[cookie.name]
            }
            continue;
          }
          if(cookie.matches(access_info)) {
            return cookie;
          }
        }
      }
      //returns a list of cookies
      this.getCookies = function getCookies(access_info) {
        var matches=[];
        for(var cookie_name in cookies) {
          var cookie=this.getCookie(cookie_name,access_info);
          if (cookie) {
            matches.push(cookie);
          }
        }
        matches.toString=function toString(){return matches.join(":");}
            matches.toValueString=function() {return matches.map(function(c){return c.toValueString();}).join('';'');}
        return matches;
      }
    
      return this;
  }
    return new CookieJar()
}


//returns list of cookies that were set correctly
CookieJar.prototype.setCookies = function setCookies(cookies) {
  cookies=Array.isArray(cookies)
    ?cookies
    :cookies.split(cookie_str_splitter);
  var successful=[]
  for(var i=0;i<cookies.length;i++) {
    var cookie = Cookie(cookies[i]);
    if(this.setCookie(cookie)) {
      successful.push(cookie);
    }
  }
  return successful;
}

});

require.define("/shred/request.js", function (require, module, exports, __dirname, __filename) {
    // The request object encapsulates a request, creating a Node.js HTTP request and
// then handling the response.

var HTTP = require("http")
  , HTTPS = require("https")
  , parseUri = require("./parseUri")
  , Emitter = require(''events'').EventEmitter
  , sprintf = require("sprintf").sprintf
  , Response = require("./response")
  , HeaderMixins = require("./mixins/headers")
  , Content = require("./content")
;

var STATUS_CODES = HTTP.STATUS_CODES || {
    100 : ''Continue'',
    101 : ''Switching Protocols'',
    102 : ''Processing'', // RFC 2518, obsoleted by RFC 4918
    200 : ''OK'',
    201 : ''Created'',
    202 : ''Accepted'',
    203 : ''Non-Authoritative Information'',
    204 : ''No Content'',
    205 : ''Reset Content'',
    206 : ''Partial Content'',
    207 : ''Multi-Status'', // RFC 4918
    300 : ''Multiple Choices'',
    301 : ''Moved Permanently'',
    302 : ''Moved Temporarily'',
    303 : ''See Other'',
    304 : ''Not Modified'',
    305 : ''Use Proxy'',
    307 : ''Temporary Redirect'',
    400 : ''Bad Request'',
    401 : ''Unauthorized'',
    402 : ''Payment Required'',
    403 : ''Forbidden'',
    404 : ''Not Found'',
    405 : ''Method Not Allowed'',
    406 : ''Not Acceptable'',
    407 : ''Proxy Authentication Required'',
    408 : ''Request Time-out'',
    409 : ''Conflict'',
    410 : ''Gone'',
    411 : ''Length Required'',
    412 : ''Precondition Failed'',
    413 : ''Request Entity Too Large'',
    414 : ''Request-URI Too Large'',
    415 : ''Unsupported Media Type'',
    416 : ''Requested Range Not Satisfiable'',
    417 : ''Expectation Failed'',
    418 : ''I\''m a teapot'', // RFC 2324
    422 : ''Unprocessable Entity'', // RFC 4918
    423 : ''Locked'', // RFC 4918
    424 : ''Failed Dependency'', // RFC 4918
    425 : ''Unordered Collection'', // RFC 4918
    426 : ''Upgrade Required'', // RFC 2817
    500 : ''Internal Server Error'',
    501 : ''Not Implemented'',
    502 : ''Bad Gateway'',
    503 : ''Service Unavailable'',
    504 : ''Gateway Time-out'',
    505 : ''HTTP Version not supported'',
    506 : ''Variant Also Negotiates'', // RFC 2295
    507 : ''Insufficient Storage'', // RFC 4918
    509 : ''Bandwidth Limit Exceeded'',
    510 : ''Not Extended'' // RFC 2774
};

// The Shred object itself constructs the `Request` object. You should rarely
// need to do this directly.

var Request = function(options) {
  this.log = options.logger;
  this.cookieJar = options.cookieJar;
  this.encoding = options.encoding;
  this.logCurl = options.logCurl;
  processOptions(this,options||{});
  createRequest(this);
};

// A `Request` has a number of properties, many of which help with details like
// URL parsing or defaulting the port for the request.

Object.defineProperties(Request.prototype, {

// - **url**. You can set the `url` property with a valid URL string and all the
//   URL-related properties (host, port, etc.) will be automatically set on the
//   request object.

  url: {
    get: function() {
      if (!this.scheme) { return null; }
      return sprintf("%s://%s:%s%s",
          this.scheme, this.host, this.port,
          (this.proxy ? "/" : this.path) +
          (this.query ? ("?" + this.query) : ""));
    },
    set: function(_url) {
      _url = parseUri(_url);
      this.scheme = _url.protocol;
      this.host = _url.host;
      this.port = _url.port;
      this.path = _url.path;
      this.query = _url.query;
      return this;
    },
    enumerable: true
  },

// - **headers**. Returns a hash representing the request headers. You can''t set
//   this directly, only get it. You can add or modify headers by using the
//   `setHeader` or `setHeaders` method. This ensures that the headers are
//   normalized - that is, you don''t accidentally send `Content-Type` and
//   `content-type` headers. Keep in mind that if you modify the returned hash,
//   it will *not* modify the request headers.

  headers: {
    get: function() {
      return this.getHeaders();
    },
    enumerable: true
  },

// - **port**. Unless you set the `port` explicitly or include it in the URL, it
//   will default based on the scheme.

  port: {
    get: function() {
      if (!this._port) {
        switch(this.scheme) {
          case "https": return this._port = 443;
          case "http":
          default: return this._port = 80;
        }
      }
      return this._port;
    },
    set: function(value) { this._port = value; return this; },
    enumerable: true
  },

// - **method**. The request method - `get`, `put`, `post`, etc. that will be
//   used to make the request. Defaults to `get`.

  method: {
    get: function() {
      return this._method = (this._method||"GET");
    },
    set: function(value) {
      this._method = value; return this;
    },
    enumerable: true
  },

// - **query**. Can be set either with a query string or a hash (object). Get
//   will always return a properly escaped query string or null if there is no
//   query component for the request.

  query: {
    get: function() {return this._query;},
    set: function(value) {
      var stringify = function (hash) {
        var query = "";
        for (var key in hash) {
          query += encodeURIComponent(key) + ''='' + encodeURIComponent(hash[key]) + ''&'';
        }
        // Remove the last ''&''
        query = query.slice(0, -1);
        return query;
      }

      if (value) {
        if (typeof value === ''object'') {
          value = stringify(value);
        }
        this._query = value;
      } else {
        this._query = "";
      }
      return this;
    },
    enumerable: true
  },

// - **parameters**. This will return the query parameters in the form of a hash
//   (object).

  parameters: {
    get: function() { return QueryString.parse(this._query||""); },
    enumerable: true
  },

// - **content**. (Aliased as `body`.) Set this to add a content entity to the
//   request. Attempts to use the `content-type` header to determine what to do
//   with the content value. Get this to get back a [`Content`
//   object](./content.html).

  body: {
    get: function() { return this._body; },
    set: function(value) {
      this._body = new Content({
        data: value,
        type: this.getHeader("Content-Type")
      });
      this.setHeader("Content-Type",this.content.type);
      this.setHeader("Content-Length",this.content.length);
      return this;
    },
    enumerable: true
  },

// - **timeout**. Used to determine how long to wait for a response. Does not
//   distinguish between connect timeouts versus request timeouts. Set either in
//   milliseconds or with an object with temporal attributes (hours, minutes,
//   seconds) and convert it into milliseconds. Get will always return
//   milliseconds.

  timeout: {
    get: function() { return this._timeout; }, // in milliseconds
    set: function(timeout) {
      var request = this
        , milliseconds = 0;
      ;
      if (!timeout) return this;
      if (typeof timeout==="number") { milliseconds = timeout; }
      else {
        milliseconds = (timeout.milliseconds||0) +
          (1000 * ((timeout.seconds||0) +
              (60 * ((timeout.minutes||0) +
                (60 * (timeout.hours||0))))));
      }
      this._timeout = milliseconds;
      return this;
    },
    enumerable: true
  }
});

// Alias `body` property to `content`. Since the [content object](./content.html)
// has a `body` attribute, it''s preferable to use `content` since you can then
// access the raw content data using `content.body`.

Object.defineProperty(Request.prototype,"content",
    Object.getOwnPropertyDescriptor(Request.prototype, "body"));

// The `Request` object can be pretty overwhelming to view using the built-in
// Node.js inspect method. We want to make it a bit more manageable. This
// probably goes [too far in the other
// direction](https://github.com/spire-io/shred/issues/2).

Request.prototype.inspect = function () {
  var request = this;
  var headers = this.format_headers();
  var summary = ["<Shred Request> ", request.method.toUpperCase(),
      request.url].join(" ")
  return [ summary, "- Headers:", headers].join("\n");
};

Request.prototype.format_headers = function () {
  var array = []
  var headers = this._headers
  for (var key in headers) {
    if (headers.hasOwnProperty(key)) {
      var value = headers[key]
      array.push("\t" + key + ": " + value);
    }
  }
  return array.join("\n");
};

// Allow chainable ''on''s:  shred.get({ ... }).on( ... ).  You can pass in a
// single function, a pair (event, function), or a hash:
// { event: function, event: function }
Request.prototype.on = function (eventOrHash, listener) {
  var emitter = this.emitter;
  // Pass in a single argument as a function then make it the default response handler
  if (arguments.length === 1 && typeof(eventOrHash) === ''function'') {
    emitter.on(''response'', eventOrHash);
  } else if (arguments.length === 1 && typeof(eventOrHash) === ''object'') {
    for (var key in eventOrHash) {
      if (eventOrHash.hasOwnProperty(key)) {
        emitter.on(key, eventOrHash[key]);
      }
    }
  } else {
    emitter.on(eventOrHash, listener);
  }
  return this;
};

// Add in the header methods. Again, these ensure we don''t get the same header
// multiple times with different case conventions.
HeaderMixins.gettersAndSetters(Request);

// `processOptions` is called from the constructor to handle all the work
// associated with making sure we do our best to ensure we have a valid request.

var processOptions = function(request,options) {

  request.log.debug("Processing request options ..");

  // We''ll use `request.emitter` to manage the `on` event handlers.
  request.emitter = (new Emitter);

  request.agent = options.agent;

  // Set up the handlers ...
  if (options.on) {
    for (var key in options.on) {
      if (options.on.hasOwnProperty(key)) {
        request.emitter.on(key, options.on[key]);
      }
    }
  }

  // Make sure we were give a URL or a host
  if (!options.url && !options.host) {
    request.emitter.emit("request_error",
        new Error("No url or url options (host, port, etc.)"));
    return;
  }

  // Allow for the [use of a proxy](http://www.jmarshall.com/easy/http/#proxies).

  if (options.url) {
    if (options.proxy) {
      request.url = options.proxy;
      request.path = options.url;
    } else {
      request.url = options.url;
    }
  }

  // Set the remaining options.
  request.query = options.query||options.parameters||request.query ;
  request.method = options.method;
  request.setHeader("user-agent",options.agent||"Shred");
  request.setHeaders(options.headers);

  if (request.cookieJar) {
    var cookies = request.cookieJar.getCookies( CookieAccessInfo( request.host, request.path ) );
    if (cookies.length) {
      var cookieString = request.getHeader(''cookie'')||'''';
      for (var cookieIndex = 0; cookieIndex < cookies.length; ++cookieIndex) {
          if ( cookieString.length && cookieString[ cookieString.length - 1 ] != '';'' )
          {
              cookieString += '';'';
          }
          cookieString += cookies[ cookieIndex ].name + ''='' + cookies[ cookieIndex ].value + '';'';
      }
      request.setHeader("cookie", cookieString);
    }
  }
  
  // The content entity can be set either using the `body` or `content` attributes.
  if (options.body||options.content) {
    request.content = options.body||options.content;
  }
  request.timeout = options.timeout;

};

// `createRequest` is also called by the constructor, after `processOptions`.
// This actually makes the request and processes the response, so `createRequest`
// is a bit of a misnomer.

var createRequest = function(request) {
  var timeout ;

  request.log.debug("Creating request ..");
  request.log.debug(request);

  var reqParams = {
    host: request.host,
    port: request.port,
    method: request.method,
    path: request.path + (request.query ? ''?''+request.query : ""),
    headers: request.getHeaders(),
    // Node''s HTTP/S modules will ignore this, but we are using the
    // browserify-http module in the browser for both HTTP and HTTPS, and this
    // is how you differentiate the two.
    scheme: request.scheme,
    // Use a provided agent.  ''Undefined'' is the default, which uses a global
    // agent.
    agent: request.agent
  };

  if (request.logCurl) {
    logCurl(request);
  }

  var http = request.scheme == "http" ? HTTP : HTTPS;

  // Set up the real request using the selected library. The request won''t be
  // sent until we call `.end()`.
  request._raw = http.request(reqParams, function(response) {
    request.log.debug("Received response ..");

    // We haven''t timed out and we have a response, so make sure we clear the
    // timeout so it doesn''t fire while we''re processing the response.
    clearTimeout(timeout);

    // Construct a Shred `Response` object from the response. This will stream
    // the response, thus the need for the callback. We can access the response
    // entity safely once we''re in the callback.
    response = new Response(response, request, function(response) {

      // Set up some event magic. The precedence is given first to
      // status-specific handlers, then to responses for a given event, and then
      // finally to the more general `response` handler. In the last case, we
      // need to first make sure we''re not dealing with a a redirect.
      var emit = function(event) {
        var emitter = request.emitter;
        var textStatus = STATUS_CODES[response.status] ? STATUS_CODES[response.status].toLowerCase() : null;
        if (emitter.listeners(response.status).length > 0 || emitter.listeners(textStatus).length > 0) {
          emitter.emit(response.status, response);
          emitter.emit(textStatus, response);
        } else {
          if (emitter.listeners(event).length>0) {
            emitter.emit(event, response);
          } else if (!response.isRedirect) {
            emitter.emit("response", response);
            //console.warn("Request has no event listener for status code " + response.status);
          }
        }
      };

      // Next, check for a redirect. We simply repeat the request with the URL
      // given in the `Location` header. We fire a `redirect` event.
      if (response.isRedirect) {
        request.log.debug("Redirecting to "
            + response.getHeader("Location"));
        request.url = response.getHeader("Location");
        emit("redirect");
        createRequest(request);

      // Okay, it''s not a redirect. Is it an error of some kind?
      } else if (response.isError) {
        emit("error");
      } else {
      // It looks like we''re good shape. Trigger the `success` event.
        emit("success");
      }
    });
  });

  // We''re still setting up the request. Next, we''re going to handle error cases
  // where we have no response. We don''t emit an error event because that event
  // takes a response. We don''t response handlers to have to check for a null
  // value. However, we [should introduce a different event
  // type](https://github.com/spire-io/shred/issues/3) for this type of error.
  request._raw.on("error", function(error) {
    request.emitter.emit("request_error", error);
  });

  request._raw.on("socket", function(socket) {
    request.emitter.emit("socket", socket);
  });

  // TCP timeouts should also trigger the "response_error" event.
  request._raw.on(''socket'', function () {
    request._raw.socket.on(''timeout'', function () {
      // This should trigger the "error" event on the raw request, which will
      // trigger the "response_error" on the shred request.
      request._raw.abort();
    });
  });


  // We''re almost there. Next, we need to write the request entity to the
  // underlying request object.
  if (request.content) {
    request.log.debug("Streaming body: ''" +
        request.content.data.slice(0,59) + "'' ... ");
    request._raw.write(request.content.data);
  }

  // Finally, we need to set up the timeout. We do this last so that we don''t
  // start the clock ticking until the last possible moment.
  if (request.timeout) {
    timeout = setTimeout(function() {
      request.log.debug("Timeout fired, aborting request ...");
      request._raw.abort();
      request.emitter.emit("timeout", request);
    },request.timeout);
  }

  // The `.end()` method will cause the request to fire. Technically, it might
  // have already sent the headers and body.
  request.log.debug("Sending request ...");
  request._raw.end();
};

// Logs the curl command for the request.
var logCurl = function (req) {
  var headers = req.getHeaders();
  var headerString = "";

  for (var key in headers) {
    headerString += ''-H "'' + key + ": " + headers[key] + ''" '';
  }

  var bodyString = ""

  if (req.content) {
    bodyString += "-d ''" + req.content.body + "'' ";
  }

  var query = req.query ? ''?'' + req.query : "";

  console.log("curl " +
    "-X " + req.method.toUpperCase() + " " +
    req.scheme + "://" + req.host + ":" + req.port + req.path + query + " " +
    headerString +
    bodyString
  );
};


module.exports = Request;

});

require.define("http", function (require, module, exports, __dirname, __filename) {
    // todo

});

require.define("https", function (require, module, exports, __dirname, __filename) {
    // todo

});

require.define("/shred/parseUri.js", function (require, module, exports, __dirname, __filename) {
    // parseUri 1.2.2
// (c) Steven Levithan <stevenlevithan.com>
// MIT License

function parseUri (str) {
  var o   = parseUri.options,
    m   = o.parser[o.strictMode ? "strict" : "loose"].exec(str),
    uri = {},
    i   = 14;

  while (i--) uri[o.key[i]] = m[i] || "";

  uri[o.q.name] = {};
  uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
    if ($1) uri[o.q.name][$1] = $2;
  });

  return uri;
};

parseUri.options = {
  strictMode: false,
  key: ["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],
  q:   {
    name:   "queryKey",
    parser: /(?:^|&)([^&=]*)=?([^&]*)/g
  },
  parser: {
    strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
    loose:  /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
  }
};

module.exports = parseUri;

});

require.define("events", function (require, module, exports, __dirname, __filename) {
    if (!process.EventEmitter) process.EventEmitter = function () {};

var EventEmitter = exports.EventEmitter = process.EventEmitter;
var isArray = typeof Array.isArray === ''function''
    ? Array.isArray
    : function (xs) {
        return Object.toString.call(xs) === ''[object Array]''
    }
;

// By default EventEmitters will print a warning if more than
// 10 listeners are added to it. This is a useful default which
// helps finding memory leaks.
//
// Obviously not all Emitters should be limited to 10. This function allows
// that to be increased. Set to zero for unlimited.
var defaultMaxListeners = 10;
EventEmitter.prototype.setMaxListeners = function(n) {
  if (!this._events) this._events = {};
  this._events.maxListeners = n;
};


EventEmitter.prototype.emit = function(type) {
  // If there is no ''error'' event listener then throw.
  if (type === ''error'') {
    if (!this._events || !this._events.error ||
        (isArray(this._events.error) && !this._events.error.length))
    {
      if (arguments[1] instanceof Error) {
        throw arguments[1]; // Unhandled ''error'' event
      } else {
        throw new Error("Uncaught, unspecified ''error'' event.");
      }
      return false;
    }
  }

  if (!this._events) return false;
  var handler = this._events[type];
  if (!handler) return false;

  if (typeof handler == ''function'') {
    switch (arguments.length) {
      // fast cases
      case 1:
        handler.call(this);
        break;
      case 2:
        handler.call(this, arguments[1]);
        break;
      case 3:
        handler.call(this, arguments[1], arguments[2]);
        break;
      // slower
      default:
        var args = Array.prototype.slice.call(arguments, 1);
        handler.apply(this, args);
    }
    return true;

  } else if (isArray(handler)) {
    var args = Array.prototype.slice.call(arguments, 1);

    var listeners = handler.slice();
    for (var i = 0, l = listeners.length; i < l; i++) {
      listeners[i].apply(this, args);
    }
    return true;

  } else {
    return false;
  }
};

// EventEmitter is defined in src/node_events.cc
// EventEmitter.prototype.emit() is also defined there.
EventEmitter.prototype.addListener = function(type, listener) {
  if (''function'' !== typeof listener) {
    throw new Error(''addListener only takes instances of Function'');
  }

  if (!this._events) this._events = {};

  // To avoid recursion in the case that type == "newListeners"! Before
  // adding it to the listeners, first emit "newListeners".
  this.emit(''newListener'', type, listener);

  if (!this._events[type]) {
    // Optimize the case of one listener. Don''t need the extra array object.
    this._events[type] = listener;
  } else if (isArray(this._events[type])) {

    // Check for listener leak
    if (!this._events[type].warned) {
      var m;
      if (this._events.maxListeners !== undefined) {
        m = this._events.maxListeners;
      } else {
        m = defaultMaxListeners;
      }

      if (m && m > 0 && this._events[type].length > m) {
        this._events[type].warned = true;
        console.error(''(node) warning: possible EventEmitter memory '' +
                      ''leak detected. %d listeners added. '' +
                      ''Use emitter.setMaxListeners() to increase limit.'',
                      this._events[type].length);
        console.trace();
      }
    }

    // If we''ve already got an array, just append.
    this._events[type].push(listener);
  } else {
    // Adding the second element, need to change to array.
    this._events[type] = [this._events[type], listener];
  }

  return this;
};

EventEmitter.prototype.on = EventEmitter.prototype.addListener;

EventEmitter.prototype.once = function(type, listener) {
  var self = this;
  self.on(type, function g() {
    self.removeListener(type, g);
    listener.apply(this, arguments);
  });

  return this;
};

EventEmitter.prototype.removeListener = function(type, listener) {
  if (''function'' !== typeof listener) {
    throw new Error(''removeListener only takes instances of Function'');
  }

  // does not use listeners(), so no side effect of creating _events[type]
  if (!this._events || !this._events[type]) return this;

  var list = this._events[type];

  if (isArray(list)) {
    var i = list.indexOf(listener);
    if (i < 0) return this;
    list.splice(i, 1);
    if (list.length == 0)
      delete this._events[type];
  } else if (this._events[type] === listener) {
    delete this._events[type];
  }

  return this;
};

EventEmitter.prototype.removeAllListeners = function(type) {
  // does not use listeners(), so no side effect of creating _events[type]
  if (type && this._events && this._events[type]) this._events[type] = null;
  return this;
};

EventEmitter.prototype.listeners = function(type) {
  if (!this._events) this._events = {};
  if (!this._events[type]) this._events[type] = [];
  if (!isArray(this._events[type])) {
    this._events[type] = [this._events[type]];
  }
  return this._events[type];
};

});

require.define("/node_modules/sprintf/package.json", function (require, module, exports, __dirname, __filename) {
    module.exports = {"main":"./lib/sprintf"}
});

require.define("/node_modules/sprintf/lib/sprintf.js", function (require, module, exports, __dirname, __filename) {
    /**
sprintf() for JavaScript 0.7-beta1
http://www.diveintojavascript.com/projects/javascript-sprintf

Copyright (c) Alexandru Marasteanu <alexaholic [at) gmail (dot] com>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of sprintf() for JavaScript nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Alexandru Marasteanu BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


Changelog:
2010.11.07 - 0.7-beta1-node
  - converted it to a node.js compatible module

2010.09.06 - 0.7-beta1
  - features: vsprintf, support for named placeholders
  - enhancements: format cache, reduced global namespace pollution

2010.05.22 - 0.6:
 - reverted to 0.4 and fixed the bug regarding the sign of the number 0
 Note:
 Thanks to Raphael Pigulla <raph (at] n3rd [dot) org> (http://www.n3rd.org/)
 who warned me about a bug in 0.5, I discovered that the last update was
 a regress. I appologize for that.

2010.05.09 - 0.5:
 - bug fix: 0 is now preceeded with a + sign
 - bug fix: the sign was not at the right position on padded results (Kamal Abdali)
 - switched from GPL to BSD license

2007.10.21 - 0.4:
 - unit test and patch (David Baird)

2007.09.17 - 0.3:
 - bug fix: no longer throws exception on empty paramenters (Hans Pufal)

2007.09.11 - 0.2:
 - feature: added argument swapping

2007.04.03 - 0.1:
 - initial release
**/

var sprintf = (function() {
  function get_type(variable) {
    return Object.prototype.toString.call(variable).slice(8, -1).toLowerCase();
  }
  function str_repeat(input, multiplier) {
    for (var output = []; multiplier > 0; output[--multiplier] = input) {/* do nothing */}
    return output.join('''');
  }

  var str_format = function() {
    if (!str_format.cache.hasOwnProperty(arguments[0])) {
      str_format.cache[arguments[0]] = str_format.parse(arguments[0]);
    }
    return str_format.format.call(null, str_format.cache[arguments[0]], arguments);
  };

  str_format.format = function(parse_tree, argv) {
    var cursor = 1, tree_length = parse_tree.length, node_type = '''', arg, output = [], i, k, match, pad, pad_character, pad_length;
    for (i = 0; i < tree_length; i++) {
      node_type = get_type(parse_tree[i]);
      if (node_type === ''string'') {
        output.push(parse_tree[i]);
      }
      else if (node_type === ''array'') {
        match = parse_tree[i]; // convenience purposes only
        if (match[2]) { // keyword argument
          arg = argv[cursor];
          for (k = 0; k < match[2].length; k++) {
            if (!arg.hasOwnProperty(match[2][k])) {
              throw(sprintf(''[sprintf] property "%s" does not exist'', match[2][k]));
            }
            arg = arg[match[2][k]];
          }
        }
        else if (match[1]) { // positional argument (explicit)
          arg = argv[match[1]];
        }
        else { // positional argument (implicit)
          arg = argv[cursor++];
        }

        if (/[^s]/.test(match[8]) && (get_type(arg) != ''number'')) {
          throw(sprintf(''[sprintf] expecting number but found %s'', get_type(arg)));
        }
        switch (match[8]) {
          case ''b'': arg = arg.toString(2); break;
          case ''c'': arg = String.fromCharCode(arg); break;
          case ''d'': arg = parseInt(arg, 10); break;
          case ''e'': arg = match[7] ? arg.toExponential(match[7]) : arg.toExponential(); break;
          case ''f'': arg = match[7] ? parseFloat(arg).toFixed(match[7]) : parseFloat(arg); break;
          case ''o'': arg = arg.toString(8); break;
          case ''s'': arg = ((arg = String(arg)) && match[7] ? arg.substring(0, match[7]) : arg); break;
          case ''u'': arg = Math.abs(arg); break;
          case ''x'': arg = arg.toString(16); break;
          case ''X'': arg = arg.toString(16).toUpperCase(); break;
        }
        arg = (/[def]/.test(match[8]) && match[3] && arg >= 0 ? ''+''+ arg : arg);
        pad_character = match[4] ? match[4] == ''0'' ? ''0'' : match[4].charAt(1) : '' '';
        pad_length = match[6] - String(arg).length;
        pad = match[6] ? str_repeat(pad_character, pad_length) : '''';
        output.push(match[5] ? arg + pad : pad + arg);
      }
    }
    return output.join('''');
  };

  str_format.cache = {};

  str_format.parse = function(fmt) {
    var _fmt = fmt, match = [], parse_tree = [], arg_names = 0;
    while (_fmt) {
      if ((match = /^[^\x25]+/.exec(_fmt)) !== null) {
        parse_tree.push(match[0]);
      }
      else if ((match = /^\x25{2}/.exec(_fmt)) !== null) {
        parse_tree.push(''%'');
      }
      else if ((match = /^\x25(?:([1-9]\d*)\$|\(([^\)]+)\))?(\+)?(0|''[^$])?(-)?(\d+)?(?:\.(\d+))?([b-fosuxX])/.exec(_fmt)) !== null) {
        if (match[2]) {
          arg_names |= 1;
          var field_list = [], replacement_field = match[2], field_match = [];
          if ((field_match = /^([a-z_][a-z_\d]*)/i.exec(replacement_field)) !== null) {
            field_list.push(field_match[1]);
            while ((replacement_field = replacement_field.substring(field_match[0].length)) !== '''') {
              if ((field_match = /^\.([a-z_][a-z_\d]*)/i.exec(replacement_field)) !== null) {
                field_list.push(field_match[1]);
              }
              else if ((field_match = /^\[(\d+)\]/.exec(replacement_field)) !== null) {
                field_list.push(field_match[1]);
              }
              else {
                throw(''[sprintf] huh?'');
              }
            }
          }
          else {
            throw(''[sprintf] huh?'');
          }
          match[2] = field_list;
        }
        else {
          arg_names |= 2;
        }
        if (arg_names === 3) {
          throw(''[sprintf] mixing positional and named placeholders is not (yet) supported'');
        }
        parse_tree.push(match);
      }
      else {
        throw(''[sprintf] huh?'');
      }
      _fmt = _fmt.substring(match[0].length);
    }
    return parse_tree;
  };

  return str_format;
})();

var vsprintf = function(fmt, argv) {
  argv.unshift(fmt);
  return sprintf.apply(null, argv);
};

exports.sprintf = sprintf;
exports.vsprintf = vsprintf;
});

require.define("/shred/response.js", function (require, module, exports, __dirname, __filename) {
    // The `Response object` encapsulates a Node.js HTTP response.

var Content = require("./content")
  , HeaderMixins = require("./mixins/headers")
  , CookieJarLib = require( "cookiejar" )
  , Cookie = CookieJarLib.Cookie
;

// Browser doesn''t have zlib.
var zlib = null;
try {
  zlib = require(''zlib'');
} catch (e) {
  // console.warn("no zlib library");
}

// Iconv doesn''t work in browser
var Iconv = null;
try {
  Iconv = require(''iconv-lite'');
} catch (e) {
  // console.warn("no iconv library");
}

// Construct a `Response` object. You should never have to do this directly. The
// `Request` object handles this, getting the raw response object and passing it
// in here, along with the request. The callback allows us to stream the response
// and then use the callback to let the request know when it''s ready.
var Response = function(raw, request, callback) { 
  var response = this;
  this._raw = raw;

  // The `._setHeaders` method is "private"; you can''t otherwise set headers on
  // the response.
  this._setHeaders.call(this,raw.headers);
  
  // store any cookies
  if (request.cookieJar && this.getHeader(''set-cookie'')) {
    var cookieStrings = this.getHeader(''set-cookie'');
    var cookieObjs = []
      , cookie;

    for (var i = 0; i < cookieStrings.length; i++) {
      var cookieString = cookieStrings[i];
      if (!cookieString) {
        continue;
      }

      if (!cookieString.match(/domain\=/i)) {
        cookieString += ''; domain='' + request.host;
      }

      if (!cookieString.match(/path\=/i)) {
        cookieString += ''; path='' + request.path;
      }

      try {
        cookie = new Cookie(cookieString);
        if (cookie) {
          cookieObjs.push(cookie);
        }
      } catch (e) {
        console.warn("Tried to set bad cookie: " + cookieString);
      }
    }

    request.cookieJar.setCookies(cookieObjs);
  }

  this.request = request;
  this.client = request.client;
  this.log = this.request.log;

  // Stream the response content entity and fire the callback when we''re done.
  // Store the incoming data in a array of Buffers which we concatinate into one
  // buffer at the end.  We need to use buffers instead of strings here in order
  // to preserve binary data.
  var chunkBuffers = [];
  var dataLength = 0;
  raw.on("data", function(chunk) {
    chunkBuffers.push(chunk);
    dataLength += chunk.length;
  });
  raw.on("end", function() {
    var body;
    if (typeof Buffer === ''undefined'') {
      // Just concatinate into a string
      body = chunkBuffers.join('''');
    } else {
      // Initialize new buffer and add the chunks one-at-a-time.
      body = new Buffer(dataLength);
      for (var i = 0, pos = 0; i < chunkBuffers.length; i++) {
        chunkBuffers[i].copy(body, pos);
        pos += chunkBuffers[i].length;
      }
    }

    var setBodyAndFinish = function (body) {
      response._body = new Content({ 
        body: body,
        type: response.getHeader("Content-Type")
      });
      callback(response);
    }

    if (zlib && response.getHeader("Content-Encoding") === ''gzip''){
      zlib.gunzip(body, function (err, gunzippedBody) {
        if (Iconv && response.request.encoding){
          body = Iconv.fromEncoding(gunzippedBody,response.request.encoding);
        } else {
          body = gunzippedBody.toString();
        }
        setBodyAndFinish(body);
      })
    }
    else{
       if (response.request.encoding){
            body = Iconv.fromEncoding(body,response.request.encoding);
        }        
      setBodyAndFinish(body);
    }
  });
};

// The `Response` object can be pretty overwhelming to view using the built-in
// Node.js inspect method. We want to make it a bit more manageable. This
// probably goes [too far in the other
// direction](https://github.com/spire-io/shred/issues/2).

Response.prototype = {
  inspect: function() {
    var response = this;
    var headers = this.format_headers();
    var summary = ["<Shred Response> ", response.status].join(" ")
    return [ summary, "- Headers:", headers].join("\n");
  },
  format_headers: function () {
    var array = []
    var headers = this._headers
    for (var key in headers) {
      if (headers.hasOwnProperty(key)) {
        var value = headers[key]
        array.push("\t" + key + ": " + value);
      }
    }
    return array.join("\n");
  }
};

// `Response` object properties, all of which are read-only:
Object.defineProperties(Response.prototype, {
  
// - **status**. The HTTP status code for the response. 
  status: {
    get: function() { return this._raw.statusCode; },
    enumerable: true
  },

// - **content**. The HTTP content entity, if any. Provided as a [content
//   object](./content.html), which will attempt to convert the entity based upon
//   the `content-type` header. The converted value is available as
//   `content.data`. The original raw content entity is available as
//   `content.body`.
  body: {
    get: function() { return this._body; }
  },
  content: {
    get: function() { return this.body; },
    enumerable: true
  },

// - **isRedirect**. Is the response a redirect? These are responses with 3xx
//   status and a `Location` header.
  isRedirect: {
    get: function() {
      return (this.status>299
          &&this.status<400
          &&this.getHeader("Location"));
    },
    enumerable: true
  },

// - **isError**. Is the response an error? These are responses with status of
//   400 or greater.
  isError: {
    get: function() {
      return (this.status === 0 || this.status > 399)
    },
    enumerable: true
  }
});

// Add in the [getters for accessing the normalized headers](./headers.js).
HeaderMixins.getters(Response);
HeaderMixins.privateSetters(Response);

// Work around Mozilla bug #608735 [https://bugzil.la/608735], which causes
// getAllResponseHeaders() to return {} if the response is a CORS request.
// xhr.getHeader still works correctly.
var getHeader = Response.prototype.getHeader;
Response.prototype.getHeader = function (name) {
  return (getHeader.call(this,name) ||
    (typeof this._raw.getHeader === ''function'' && this._raw.getHeader(name)));
};

module.exports = Response;

});

require.define("/shred/content.js", function (require, module, exports, __dirname, __filename) {
    
// The purpose of the `Content` object is to abstract away the data conversions
// to and from raw content entities as strings. For example, you want to be able
// to pass in a Javascript object and have it be automatically converted into a
// JSON string if the `content-type` is set to a JSON-based media type.
// Conversely, you want to be able to transparently get back a Javascript object
// in the response if the `content-type` is a JSON-based media-type.

// One limitation of the current implementation is that it [assumes the `charset` is UTF-8](https://github.com/spire-io/shred/issues/5).

// The `Content` constructor takes an options object, which *must* have either a
// `body` or `data` property and *may* have a `type` property indicating the
// media type. If there is no `type` attribute, a default will be inferred.
var Content = function(options) {
  this.body = options.body;
  this.data = options.data;
  this.type = options.type;
};

Content.prototype = {
  // Treat `toString()` as asking for the `content.body`. That is, the raw content entity.
  //
  //     toString: function() { return this.body; }
  //
  // Commented out, but I''ve forgotten why. :/
};


// `Content` objects have the following attributes:
Object.defineProperties(Content.prototype,{
  
// - **type**. Typically accessed as `content.type`, reflects the `content-type`
//   header associated with the request or response. If not passed as an options
//   to the constructor or set explicitly, it will infer the type the `data`
//   attribute, if possible, and, failing that, will default to `text/plain`.
  type: {
    get: function() {
      if (this._type) {
        return this._type;
      } else {
        if (this._data) {
          switch(typeof this._data) {
            case "string": return "text/plain";
            case "object": return "application/json";
          }
        }
      }
      return "text/plain";
    },
    set: function(value) {
      this._type = value;
      return this;
    },
    enumerable: true
  },

// - **data**. Typically accessed as `content.data`, reflects the content entity
//   converted into Javascript data. This can be a string, if the `type` is, say,
//   `text/plain`, but can also be a Javascript object. The conversion applied is
//   based on the `processor` attribute. The `data` attribute can also be set
//   directly, in which case the conversion will be done the other way, to infer
//   the `body` attribute.
  data: {
    get: function() {
      if (this._body) {
        return this.processor.parser(this._body);
      } else {
        return this._data;
      }
    },
    set: function(data) {
      if (this._body&&data) Errors.setDataWithBody(this);
      this._data = data;
      return this;
    },
    enumerable: true
  },

// - **body**. Typically accessed as `content.body`, reflects the content entity
//   as a UTF-8 string. It is the mirror of the `data` attribute. If you set the
//   `data` attribute, the `body` attribute will be inferred and vice-versa. If
//   you attempt to set both, an exception is raised.
  body: {
    get: function() {
      if (this._data) {
        return this.processor.stringify(this._data);
      } else {
        return this.processor.stringify(this._body);
      }
    },
    set: function(body) {
      if (this._data&&body) Errors.setBodyWithData(this);
      this._body = body;
      return this;
    },
    enumerable: true
  },

// - **processor**. The functions that will be used to convert to/from `data` and
//   `body` attributes. You can add processors. The two that are built-in are for
//   `text/plain`, which is basically an identity transformation and
//   `application/json` and other JSON-based media types (including custom media
//   types with `+json`). You can add your own processors. See below.
  processor: {
    get: function() {
      var processor = Content.processors[this.type];
      if (processor) {
        return processor;
      } else {
        // Return the first processor that matches any part of the
        // content type. ex: application/vnd.foobar.baz+json will match json.
        var main = this.type.split(";")[0];
        var parts = main.split(/\+|\//);
        for (var i=0, l=parts.length; i < l; i++) {
          processor = Content.processors[parts[i]]
        }
        return processor || {parser:identity,stringify:toString};
      }
    },
    enumerable: true
  },

// - **length**. Typically accessed as `content.length`, returns the length in
//   bytes of the raw content entity.
  length: {
    get: function() {
      if (typeof Buffer !== ''undefined'') {
        return Buffer.byteLength(this.body);
      }
      return this.body.length;
    }
  }
});

Content.processors = {};

// The `registerProcessor` function allows you to add your own processors to
// convert content entities. Each processor consists of a Javascript object with
// two properties:
// - **parser**. The function used to parse a raw content entity and convert it
//   into a Javascript data type.
// - **stringify**. The function used to convert a Javascript data type into a
//   raw content entity.
Content.registerProcessor = function(types,processor) {
  
// You can pass an array of types that will trigger this processor, or just one.
// We determine the array via duck-typing here.
  if (types.forEach) {
    types.forEach(function(type) {
      Content.processors[type] = processor;
    });
  } else {
    // If you didn''t pass an array, we just use what you pass in.
    Content.processors[types] = processor;
  }
};

// Register the identity processor, which is used for text-based media types.
var identity = function(x) { return x; }
  , toString = function(x) { return x.toString(); }
Content.registerProcessor(
  ["text/html","text/plain","text"],
  { parser: identity, stringify: toString });

// Register the JSON processor, which is used for JSON-based media types.
Content.registerProcessor(
  ["application/json; charset=utf-8","application/json","json"],
  {
    parser: function(string) {
      return JSON.parse(string);
    },
    stringify: function(data) {
      return JSON.stringify(data); }});

// Error functions are defined separately here in an attempt to make the code
// easier to read.
var Errors = {
  setDataWithBody: function(object) {
    throw new Error("Attempt to set data attribute of a content object " +
        "when the body attributes was already set.");
  },
  setBodyWithData: function(object) {
    throw new Error("Attempt to set body attribute of a content object " +
        "when the data attributes was already set.");
  }
}
module.exports = Content;

});

require.define("/shred/mixins/headers.js", function (require, module, exports, __dirname, __filename) {
    // The header mixins allow you to add HTTP header support to any object. This
// might seem pointless: why not simply use a hash? The main reason is that, per
// the [HTTP spec](http://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.2),
// headers are case-insensitive. So, for example, `content-type` is the same as
// `CONTENT-TYPE` which is the same as `Content-Type`. Since there is no way to
// overload the index operator in Javascript, using a hash to represent the
// headers means it''s possible to have two conflicting values for a single
// header.
// 
// The solution to this is to provide explicit methods to set or get headers.
// This also has the benefit of allowing us to introduce additional variations,
// including snake case, which we automatically convert to what Matthew King has
// dubbed "corset case" - the hyphen-separated names with initial caps:
// `Content-Type`. We use corset-case just in case we''re dealing with servers
// that haven''t properly implemented the spec.

// Convert headers to corset-case. **Example:** `CONTENT-TYPE` will be converted
// to `Content-Type`.

var corsetCase = function(string) {
  return string;//.toLowerCase()
      //.replace("_","-")
      // .replace(/(^|-)(\w)/g, 
          // function(s) { return s.toUpperCase(); });
};

// We suspect that `initializeHeaders` was once more complicated ...
var initializeHeaders = function(object) {
  return {};
};

// Access the `_headers` property using lazy initialization. **Warning:** If you
// mix this into an object that is using the `_headers` property already, you''re
// going to have trouble.
var $H = function(object) {
  return object._headers||(object._headers=initializeHeaders(object));
};

// Hide the implementations as private functions, separate from how we expose them.

// The "real" `getHeader` function: get the header after normalizing the name.
var getHeader = function(object,name) {
  return $H(object)[corsetCase(name)];
};

// The "real" `getHeader` function: get one or more headers, or all of them
// if you don''t ask for any specifics. 
var getHeaders = function(object,names) {
  var keys = (names && names.length>0) ? names : Object.keys($H(object));
  var hash = keys.reduce(function(hash,key) {
    hash[key] = getHeader(object,key);
    return hash;
  },{});
  // Freeze the resulting hash so you don''t mistakenly think you''re modifying
  // the real headers.
  Object.freeze(hash);
  return hash;
};

// The "real" `setHeader` function: set a header, after normalizing the name.
var setHeader = function(object,name,value) {
  $H(object)[corsetCase(name)] = value;
  return object;
};

// The "real" `setHeaders` function: set multiple headers based on a hash.
var setHeaders = function(object,hash) {
  for( var key in hash ) { setHeader(object,key,hash[key]); };
  return this;
};

// Here''s where we actually bind the functionality to an object. These mixins work by
// exposing mixin functions. Each function mixes in a specific batch of features.
module.exports = {
  
  // Add getters.
  getters: function(constructor) {
    constructor.prototype.getHeader = function(name) { return getHeader(this,name); };
    constructor.prototype.getHeaders = function() { return getHeaders(this,arguments); };
  },
  // Add setters but as "private" methods.
  privateSetters: function(constructor) {
    constructor.prototype._setHeader = function(key,value) { return setHeader(this,key,value); };
    constructor.prototype._setHeaders = function(hash) { return setHeaders(this,hash); };
  },
  // Add setters.
  setters: function(constructor) {
    constructor.prototype.setHeader = function(key,value) { return setHeader(this,key,value); };
    constructor.prototype.setHeaders = function(hash) { return setHeaders(this,hash); };
  },
  // Add both getters and setters.
  gettersAndSetters: function(constructor) {
    constructor.prototype.getHeader = function(name) { return getHeader(this,name); };
    constructor.prototype.getHeaders = function() { return getHeaders(this,arguments); };
    constructor.prototype.setHeader = function(key,value) { return setHeader(this,key,value); };
    constructor.prototype.setHeaders = function(hash) { return setHeaders(this,hash); };
  }
};

});

require.define("/node_modules/iconv-lite/package.json", function (require, module, exports, __dirname, __filename) {
    module.exports = {}
});

require.define("/node_modules/iconv-lite/index.js", function (require, module, exports, __dirname, __filename) {
    // Module exports
var iconv = module.exports = {
    toEncoding: function(str, encoding) {
        return iconv.getCodec(encoding).toEncoding(str);
    },
    fromEncoding: function(buf, encoding) {
        return iconv.getCodec(encoding).fromEncoding(buf);
    },
    
    defaultCharUnicode: ''�'',
    defaultCharSingleByte: ''?'',
    
    // Get correct codec for given encoding.
    getCodec: function(encoding) {
        var enc = encoding || "utf8";
        var codecOptions = undefined;
        while (1) {
            if (getType(enc) === "String")
                enc = enc.replace(/[- ]/g, "").toLowerCase();
            var codec = iconv.encodings[enc];
            var type = getType(codec);
            if (type === "String") {
                // Link to other encoding.
                codecOptions = {originalEncoding: enc};
                enc = codec;
            }
            else if (type === "Object" && codec.type != undefined) {
                // Options for other encoding.
                codecOptions = codec;
                enc = codec.type;
            } 
            else if (type === "Function")
                // Codec itself.
                return codec(codecOptions);
            else
                throw new Error("Encoding not recognized: ''" + encoding + "'' (searched as: ''"+enc+"'')");
        }
    },
    
    // Define basic encodings
    encodings: {
        internal: function(options) {
            return {
                toEncoding: function(str) {
                    return new Buffer(ensureString(str), options.originalEncoding);
                },
                fromEncoding: function(buf) {
                    return ensureBuffer(buf).toString(options.originalEncoding);
                }
            };
        },
        utf8: "internal",
        ucs2: "internal",
        binary: "internal",
        ascii: "internal",
        base64: "internal",
        
        // Codepage single-byte encodings.
        singlebyte: function(options) {
            // Prepare chars if needed
            if (!options.chars || (options.chars.length !== 128 && options.chars.length !== 256))
                throw new Error("Encoding ''"+options.type+"'' has incorrect ''chars'' (must be of len 128 or 256)");
            
            if (options.chars.length === 128)
                options.chars = asciiString + options.chars;
            
            if (!options.charsBuf) {
                options.charsBuf = new Buffer(options.chars, ''ucs2'');
            }
            
            if (!options.revCharsBuf) {
                options.revCharsBuf = new Buffer(65536);
                var defChar = iconv.defaultCharSingleByte.charCodeAt(0);
                for (var i = 0; i < options.revCharsBuf.length; i++)
                    options.revCharsBuf[i] = defChar;
                for (var i = 0; i < options.chars.length; i++)
                    options.revCharsBuf[options.chars.charCodeAt(i)] = i;
            }
            
            return {
                toEncoding: function(str) {
                    str = ensureString(str);
                    
                    var buf = new Buffer(str.length);
                    var revCharsBuf = options.revCharsBuf;
                    for (var i = 0; i < str.length; i++)
                        buf[i] = revCharsBuf[str.charCodeAt(i)];
                    
                    return buf;
                },
                fromEncoding: function(buf) {
                    buf = ensureBuffer(buf);
                    
                    // Strings are immutable in JS -> we use ucs2 buffer to speed up computations.
                    var charsBuf = options.charsBuf;
                    var newBuf = new Buffer(buf.length*2);
                    var idx1 = 0, idx2 = 0;
                    for (var i = 0, _len = buf.length; i < _len; i++) {
                        idx1 = buf[i]*2; idx2 = i*2;
                        newBuf[idx2] = charsBuf[idx1];
                        newBuf[idx2+1] = charsBuf[idx1+1];
                    }
                    return newBuf.toString(''ucs2'');
                }
            };
        },

        // Codepage double-byte encodings.
        table: function(options) {
            var table = options.table, key, revCharsTable = options.revCharsTable;
            if (!table) {
                throw new Error("Encoding ''" + options.type +"'' has incorect ''table'' option");
            }
            if(!revCharsTable) {
                revCharsTable = options.revCharsTable = {};
                for (key in table) {
                    revCharsTable[table[key]] = parseInt(key);
                }
            }
            
            return {
                toEncoding: function(str) {
                    str = ensureString(str);
                    var strLen = str.length;
                    var bufLen = strLen;
                    for (var i = 0; i < strLen; i++)
                        if (str.charCodeAt(i) >> 7)
                            bufLen++;

                    var newBuf = new Buffer(bufLen), gbkcode, unicode, 
                        defaultChar = revCharsTable[iconv.defaultCharUnicode.charCodeAt(0)];

                    for (var i = 0, j = 0; i < strLen; i++) {
                        unicode = str.charCodeAt(i);
                        if (unicode >> 7) {
                            gbkcode = revCharsTable[unicode] || defaultChar;
                            newBuf[j++] = gbkcode >> 8; //high byte;
                            newBuf[j++] = gbkcode & 0xFF; //low byte
                        } else {//ascii
                            newBuf[j++] = unicode;
                        }
                    }
                    return newBuf;
                },
                fromEncoding: function(buf) {
                    buf = ensureBuffer(buf);
                    var bufLen = buf.length, strLen = 0;
                    for (var i = 0; i < bufLen; i++) {
                        strLen++;
                        if (buf[i] & 0x80) //the high bit is 1, so this byte is gbkcode''s high byte.skip next byte
                            i++;
                    }
                    var newBuf = new Buffer(strLen*2), unicode, gbkcode,
                        defaultChar = iconv.defaultCharUnicode.charCodeAt(0);
                    
                    for (var i = 0, j = 0; i < bufLen; i++, j+=2) {
                        gbkcode = buf[i];
                        if (gbkcode & 0x80) {
                            gbkcode = (gbkcode << 8) + buf[++i];
                            unicode = table[gbkcode] || defaultChar;
                        } else {
                            unicode = gbkcode;
                        }
                        newBuf[j] = unicode & 0xFF; //low byte
                        newBuf[j+1] = unicode >> 8; //high byte
                    }
                    return newBuf.toString(''ucs2'');
                }
            }
        }
    }
};

// Add aliases to convert functions
iconv.encode = iconv.toEncoding;
iconv.decode = iconv.fromEncoding;

// Load other encodings from files in /encodings dir.
var encodingsDir = __dirname+"/encodings/",
    fs = require(''fs'');
fs.readdirSync(encodingsDir).forEach(function(file) {
    if(fs.statSync(encodingsDir + file).isDirectory()) return;
    var encodings = require(encodingsDir + file)
    for (var key in encodings)
        iconv.encodings[key] = encodings[key]
});

// Utilities
var asciiString = ''\x00\x01\x02\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f''+
              '' !"#$%&\''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\x7f'';

var ensureBuffer = function(buf) {
    buf = buf || new Buffer(0);
    return (buf instanceof Buffer) ? buf : new Buffer(buf.toString(), "utf8");
}

var ensureString = function(str) {
    str = str || "";
    return (str instanceof String) ? str : str.toString((str instanceof Buffer) ? ''utf8'' : undefined);
}

var getType = function(obj) {
    return Object.prototype.toString.call(obj).slice(8, -1);
}


});

require.define("/node_modules/http-browserify/package.json", function (require, module, exports, __dirname, __filename) {
    module.exports = {"main":"index.js","browserify":"browser.js"}
});

require.define("/node_modules/http-browserify/browser.js", function (require, module, exports, __dirname, __filename) {
    var http = module.exports;
var EventEmitter = require(''events'').EventEmitter;
var Request = require(''./lib/request'');

http.request = function (params, cb) {
    if (!params) params = {};
    if (!params.host) params.host = window.location.host.split('':'')[0];
    if (!params.port) params.port = window.location.port;
    
    var req = new Request(new xhrHttp, params);
    if (cb) req.on(''response'', cb);
    return req;
};

http.get = function (params, cb) {
    params.method = ''GET'';
    var req = http.request(params, cb);
    req.end();
    return req;
};

var xhrHttp = (function () {
    if (typeof window === ''undefined'') {
        throw new Error(''no window object present'');
    }
    else if (window.XMLHttpRequest) {
        return window.XMLHttpRequest;
    }
    else if (window.ActiveXObject) {
        var axs = [
            ''Msxml2.XMLHTTP.6.0'',
            ''Msxml2.XMLHTTP.3.0'',
            ''Microsoft.XMLHTTP''
        ];
        for (var i = 0; i < axs.length; i++) {
            try {
                var ax = new(window.ActiveXObject)(axs[i]);
                return function () {
                    if (ax) {
                        var ax_ = ax;
                        ax = null;
                        return ax_;
                    }
                    else {
                        return new(window.ActiveXObject)(axs[i]);
                    }
                };
            }
            catch (e) {}
        }
        throw new Error(''ajax not supported in this browser'')
    }
    else {
        throw new Error(''ajax not supported in this browser'');
    }
})();

http.STATUS_CODES = {
    100 : ''Continue'',
    101 : ''Switching Protocols'',
    102 : ''Processing'', // RFC 2518, obsoleted by RFC 4918
    200 : ''OK'',
    201 : ''Created'',
    202 : ''Accepted'',
    203 : ''Non-Authoritative Information'',
    204 : ''No Content'',
    205 : ''Reset Content'',
    206 : ''Partial Content'',
    207 : ''Multi-Status'', // RFC 4918
    300 : ''Multiple Choices'',
    301 : ''Moved Permanently'',
    302 : ''Moved Temporarily'',
    303 : ''See Other'',
    304 : ''Not Modified'',
    305 : ''Use Proxy'',
    307 : ''Temporary Redirect'',
    400 : ''Bad Request'',
    401 : ''Unauthorized'',
    402 : ''Payment Required'',
    403 : ''Forbidden'',
    404 : ''Not Found'',
    405 : ''Method Not Allowed'',
    406 : ''Not Acceptable'',
    407 : ''Proxy Authentication Required'',
    408 : ''Request Time-out'',
    409 : ''Conflict'',
    410 : ''Gone'',
    411 : ''Length Required'',
    412 : ''Precondition Failed'',
    413 : ''Request Entity Too Large'',
    414 : ''Request-URI Too Large'',
    415 : ''Unsupported Media Type'',
    416 : ''Requested Range Not Satisfiable'',
    417 : ''Expectation Failed'',
    418 : ''I\''m a teapot'', // RFC 2324
    422 : ''Unprocessable Entity'', // RFC 4918
    423 : ''Locked'', // RFC 4918
    424 : ''Failed Dependency'', // RFC 4918
    425 : ''Unordered Collection'', // RFC 4918
    426 : ''Upgrade Required'', // RFC 2817
    500 : ''Internal Server Error'',
    501 : ''Not Implemented'',
    502 : ''Bad Gateway'',
    503 : ''Service Unavailable'',
    504 : ''Gateway Time-out'',
    505 : ''HTTP Version not supported'',
    506 : ''Variant Also Negotiates'', // RFC 2295
    507 : ''Insufficient Storage'', // RFC 4918
    509 : ''Bandwidth Limit Exceeded'',
    510 : ''Not Extended'' // RFC 2774
};

});

require.define("/node_modules/http-browserify/lib/request.js", function (require, module, exports, __dirname, __filename) {
    var EventEmitter = require(''events'').EventEmitter;
var Response = require(''./response'');
var isSafeHeader = require(''./isSafeHeader'');

var Request = module.exports = function (xhr, params) {
    var self = this;
    self.xhr = xhr;
    self.body = '''';
    
    var uri = params.host + '':'' + params.port + (params.path || ''/'');
    
    xhr.open(
        params.method || ''GET'',
        (params.scheme || ''http'') + ''://'' + uri,
        true
    );
    
    if (params.headers) {
        Object.keys(params.headers).forEach(function (key) {
            if (!isSafeHeader(key)) return;
            var value = params.headers[key];
            if (Array.isArray(value)) {
                value.forEach(function (v) {
                    xhr.setRequestHeader(key, v);
                });
            }
            else xhr.setRequestHeader(key, value)
        });
    }
    
    var res = new Response(xhr);
    res.on(''ready'', function () {
        self.emit(''response'', res);
    });
    
    xhr.onreadystatechange = function () {
        res.handle(xhr);
    };
};

Request.prototype = new EventEmitter;

Request.prototype.setHeader = function (key, value) {
    if ((Array.isArray && Array.isArray(value))
    || value instanceof Array) {
        for (var i = 0; i < value.length; i++) {
            this.xhr.setRequestHeader(key, value[i]);
        }
    }
    else {
        this.xhr.setRequestHeader(key, value);
    }
};

Request.prototype.write = function (s) {
    this.body += s;
};

Request.prototype.end = function (s) {
    if (s !== undefined) this.write(s);
    this.xhr.send(this.body);
};

});

require.define("/node_modules/http-browserify/lib/response.js", function (require, module, exports, __dirname, __filename) {
    var EventEmitter = require(''events'').EventEmitter;
var isSafeHeader = require(''./isSafeHeader'');

var Response = module.exports = function (xhr) {
    this.xhr = xhr;
    this.offset = 0;
};

Response.prototype = new EventEmitter;

var capable = {
    streaming : true,
    status2 : true
};

function parseHeaders (xhr) {
    var lines = xhr.getAllResponseHeaders().split(/\r?\n/);
    var headers = {};
    for (var i = 0; i < lines.length; i++) {
        var line = lines[i];
        if (line === '''') continue;
        
        var m = line.match(/^([^:]+):\s*(.*)/);
        if (m) {
            var key = m[1].toLowerCase(), value = m[2];
            
            if (headers[key] !== undefined) {
                if ((Array.isArray && Array.isArray(headers[key]))
                || headers[key] instanceof Array) {
                    headers[key].push(value);
                }
                else {
                    headers[key] = [ headers[key], value ];
                }
            }
            else {
                headers[key] = value;
            }
        }
        else {
            headers[line] = true;
        }
    }
    return headers;
}

Response.prototype.getHeader = function (key) {
    var header = this.headers ? this.headers[key.toLowerCase()] : null;
    if (header) return header;

    // Work around Mozilla bug #608735 [https://bugzil.la/608735], which causes
    // getAllResponseHeaders() to return {} if the response is a CORS request.
    // xhr.getHeader still works correctly.
    if (isSafeHeader(key)) {
      return this.xhr.getResponseHeader(key);
    }
    return null;
};

Response.prototype.handle = function () {
    var xhr = this.xhr;
    if (xhr.readyState === 2 && capable.status2) {
        try {
            this.statusCode = xhr.status;
            this.headers = parseHeaders(xhr);
        }
        catch (err) {
            capable.status2 = false;
        }
        
        if (capable.status2) {
            this.emit(''ready'');
        }
    }
    else if (capable.streaming && xhr.readyState === 3) {
        try {
            if (!this.statusCode) {
                this.statusCode = xhr.status;
                this.headers = parseHeaders(xhr);
                this.emit(''ready'');
            }
        }
        catch (err) {}
        
        try {
            this.write();
        }
        catch (err) {
            capable.streaming = false;
        }
    }
    else if (xhr.readyState === 4) {
        if (!this.statusCode) {
            this.statusCode = xhr.status;
            this.emit(''ready'');
        }
        this.write();
        
        if (xhr.error) {
            this.emit(''error'', xhr.responseText);
        }
        else this.emit(''end'');
    }
};

Response.prototype.write = function () {
    var xhr = this.xhr;
    if (xhr.responseText.length > this.offset) {
        this.emit(''data'', xhr.responseText.slice(this.offset));
        this.offset = xhr.responseText.length;
    }
};

});

require.define("/node_modules/http-browserify/lib/isSafeHeader.js", function (require, module, exports, __dirname, __filename) {
    // Taken from http://dxr.mozilla.org/mozilla/mozilla-central/content/base/src/nsXMLHttpRequest.cpp.html
var unsafeHeaders = [
    "accept-charset",
    "accept-encoding",
    "access-control-request-headers",
    "access-control-request-method",
    "connection",
    "content-length",
    "cookie",
    "cookie2",
    "content-transfer-encoding",
    "date",
    "expect",
    "host",
    "keep-alive",
    "origin",
    "referer",
    "set-cookie",
    "te",
    "trailer",
    "transfer-encoding",
    "upgrade",
    "user-agent",
    "via"
];

module.exports = function (headerName) {
    if (!headerName) return false;
    return (unsafeHeaders.indexOf(headerName.toLowerCase()) === -1)
};

});

require.alias("http-browserify", "/node_modules/http");

require.alias("http-browserify", "/node_modules/https");'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> swaggerclientJs [
	^ '/**
 * swagger-client - swagger.js is a javascript client for use with swaggering APIs.
 * @version v2.1.9-M1
 * @link http://swagger.io
 * @license apache 2.0
 */
(function(){
var ArrayModel = function(definition) {
  this.name = "arrayModel";
  this.definition = definition || {};
  this.properties = [];
  
  var requiredFields = definition.enum || [];
  var innerType = definition.items;
  if(innerType) {
    if(innerType.type) {
      this.type = typeFromJsonSchema(innerType.type, innerType.format);
    }
    else {
      this.ref = innerType.$ref;
    }
  }
  return this;
};

ArrayModel.prototype.createJSONSample = function(modelsToIgnore) {
  var result;
  modelsToIgnore = (modelsToIgnore||{});
  if(this.type) {
    result = this.type;
  }
  else if (this.ref) {
    var name = simpleRef(this.ref);
    if(typeof modelsToIgnore[name] === ''undefined'') {
      modelsToIgnore[name] = this;
      result = models[name].createJSONSample(modelsToIgnore);
    }
    else {
      return name;
    }
  }
  return [ result ];
};

ArrayModel.prototype.getSampleValue = function(modelsToIgnore) {
  var result;
  modelsToIgnore = (modelsToIgnore || {});
  if(this.type) {
    result = type;
  }
  else if (this.ref) {
    var name = simpleRef(this.ref);
    result = models[name].getSampleValue(modelsToIgnore);
  }
  return [ result ];
};

ArrayModel.prototype.getMockSignature = function(modelsToIgnore) {
  var propertiesStr = [];
  var i, prop;
  for (i = 0; i < this.properties.length; i++) {
    prop = this.properties[i];
    propertiesStr.push(prop.toString());
  }

  var strong = ''<span class="strong">'';
  var stronger = ''<span class="stronger">'';
  var strongClose = ''</span>'';
  var classOpen = strong + ''array'' + '' {'' + strongClose;
  var classClose = strong + ''}'' + strongClose;
  var returnVal = classOpen + ''<div>'' + propertiesStr.join('',</div><div>'') + ''</div>'' + classClose;

  if (!modelsToIgnore)
    modelsToIgnore = {};
  modelsToIgnore[this.name] = this;
  for (i = 0; i < this.properties.length; i++) {
    prop = this.properties[i];
    var ref = prop.$ref;
    var model = models[ref];
    if (model && typeof modelsToIgnore[ref] === ''undefined'') {
      returnVal = returnVal + (''<br>'' + model.getMockSignature(modelsToIgnore));
    }
  }
  return returnVal;
};


/**
 * SwaggerAuthorizations applys the correct authorization to an operation being executed
 */
var SwaggerAuthorizations = function() {
  this.authz = {};
};

SwaggerAuthorizations.prototype.add = function(name, auth) {
  this.authz[name] = auth;
  return auth;
};

SwaggerAuthorizations.prototype.remove = function(name) {
  return delete this.authz[name];
};

SwaggerAuthorizations.prototype.apply = function (obj, authorizations) {
  var status = null;
  var key, name, value, result;

  // if the "authorizations" key is undefined, or has an empty array, add all keys
  if (typeof authorizations === ''undefined'' || Object.keys(authorizations).length === 0) {
    for (key in this.authz) {
      value = this.authz[key];
      result = value.apply(obj, authorizations);
      if (result === true)
        status = true;
    }
  }
  else {
    // 2.0 support
    if (Array.isArray(authorizations)) {

      for (var i = 0; i < authorizations.length; i++) {
        var auth = authorizations[i];
        for (name in auth) {
          for (key in this.authz) {
            if (key == name) {
              value = this.authz[key];
              result = value.apply(obj, authorizations);
              if (result === true)
                status = true;
            }
          }
        }
      }
    }
    else {
      // 1.2 support
      for (name in authorizations) {
        for (key in this.authz) {
          if (key == name) {
            value = this.authz[key];
            result = value.apply(obj, authorizations);
            if (result === true)
              status = true;
          }
        }
      }
    }
  }

  return status;
};

/**
 * ApiKeyAuthorization allows a query param or header to be injected
 */
var ApiKeyAuthorization = function(name, value, type) {
  this.name = name;
  this.value = value;
  this.type = type;
};

ApiKeyAuthorization.prototype.apply = function(obj, authorizations) {
  if (this.type === "query") {
    if (obj.url.indexOf(''?'') > 0)
      obj.url = obj.url + "&" + this.name + "=" + this.value;
    else
      obj.url = obj.url + "?" + this.name + "=" + this.value;
    return true;
  } else if (this.type === "header") {
    obj.headers[this.name] = this.value;
    return true;
  }
};

var CookieAuthorization = function(cookie) {
  this.cookie = cookie;
};

CookieAuthorization.prototype.apply = function(obj, authorizations) {
  obj.cookieJar = obj.cookieJar || CookieJar();
  obj.cookieJar.setCookie(this.cookie);
  return true;
};

/**
 * Password Authorization is a basic auth implementation
 */
var PasswordAuthorization = function(name, username, password) {
  this.name = name;
  this.username = username;
  this.password = password;
  this._btoa = null;
  if (typeof window !== ''undefined'')
    this._btoa = btoa;
  else
    this._btoa = require("btoa");
};

PasswordAuthorization.prototype.apply = function(obj, authorizations) {
  var base64encoder = this._btoa;
  obj.headers.Authorization = "Basic " + base64encoder(this.username + ":" + this.password);
  return true;
};
var __bind = function(fn, me){
  return function(){
    return fn.apply(me, arguments);
  };
};

fail = function(message) {
  log(message);
};

log = function(){
  log.history = log.history || [];
  log.history.push(arguments);
  if(this.console){
    console.log( Array.prototype.slice.call(arguments)[0] );
  }
};

if (!Array.prototype.indexOf) {
  Array.prototype.indexOf = function(obj, start) {
    for (var i = (start || 0), j = this.length; i < j; i++) {
      if (this[i] === obj) { return i; }
    }
    return -1;
  };
}

/**
 * allows override of the default value based on the parameter being
 * supplied
 **/
var applyParameterMacro = function (operation, parameter) {
  var e = (typeof window !== ''undefined'' ? window : exports);
  if(e.parameterMacro)
    return e.parameterMacro(operation, parameter);
  else
    return parameter.defaultValue;
};

/**
 * allows overriding the default value of an model property
 **/
var applyModelPropertyMacro = function (model, property) {
  var e = (typeof window !== ''undefined'' ? window : exports);
  if(e.modelPropertyMacro)
    return e.modelPropertyMacro(model, property);
  else
    return property.defaultValue;
};

/**
 * PrimitiveModel
 **/
var PrimitiveModel = function(definition) {
  this.name = "name";
  this.definition = definition || {};
  this.properties = [];

  var requiredFields = definition.enum || [];
  this.type = typeFromJsonSchema(definition.type, definition.format);
};

PrimitiveModel.prototype.createJSONSample = function(modelsToIgnore) {
  var result = this.type;
  return result;
};

PrimitiveModel.prototype.getSampleValue = function() {
  var result = this.type;
  return null;
};

PrimitiveModel.prototype.getMockSignature = function(modelsToIgnore) {
  var propertiesStr = [];
  var i, prop;
  for (i = 0; i < this.properties.length; i++) {
    prop = this.properties[i];
    propertiesStr.push(prop.toString());
  }

  var strong = ''<span class="strong">'';
  var stronger = ''<span class="stronger">'';
  var strongClose = ''</span>'';
  var classOpen = strong + this.name + '' {'' + strongClose;
  var classClose = strong + ''}'' + strongClose;
  var returnVal = classOpen + ''<div>'' + propertiesStr.join('',</div><div>'') + ''</div>'' + classClose;

  if (!modelsToIgnore)
    modelsToIgnore = {};
  modelsToIgnore[this.name] = this;
  for (i = 0; i < this.properties.length; i++) {
    prop = this.properties[i];
    var ref = prop.$ref;
    var model = models[ref];
    if (model && typeof modelsToIgnore[ref] === ''undefined'') {
      returnVal = returnVal + (''<br>'' + model.getMockSignature(modelsToIgnore));
    }
  }
  return returnVal;
};
/** 
 * Resolves a spec''s remote references
 */
var Resolver = function (){};

Resolver.prototype.resolve = function(spec, callback, scope) {
  this.scope = (scope || this);
  var host, name, path, property, propertyName, type;
  var processedCalls = 0, resolvedRefs = {}, unresolvedRefs = {};

  // store objects for dereferencing
  var resolutionTable = {};

  // models
  for(name in spec.definitions) {
    var model = spec.definitions[name];
    for(propertyName in model.properties) {
      property = model.properties[propertyName];
      this.resolveTo(property, resolutionTable);
    }
  }
  // operations
  for(name in spec.paths) {
    var method, operation, responseCode;
    path = spec.paths[name];
    for(method in path) {
      operation = path[method];
      var i, parameters = operation.parameters;
      for(i in parameters) {
        var parameter = parameters[i];
        if(parameter.in === ''body'' && parameter.schema) {
          this.resolveTo(parameter.schema, resolutionTable);
        }
        if(parameter.$ref) {
          this.resolveInline(spec, parameter, resolutionTable, unresolvedRefs);
        }
      }
      for(responseCode in operation.responses) {
        var response = operation.responses[responseCode];
        if(response.schema) {
          this.resolveTo(response.schema, resolutionTable);
        }
      }
    }
  }
  // get hosts
  var opts = {}, expectedCalls = 0;
  for(name in resolutionTable) {
    var parts = name.split(''#'');
    if(parts.length == 2) {
      host = parts[0]; path = parts[1];
      if(!Array.isArray(opts[host])) {
        opts[host] = [];
        expectedCalls += 1;
      }
      opts[host].push(path);
    }
  }

  for(name in opts) {
    var self = this, opt = opts[name];
    host = name;

    var obj = {
      useJQuery: false,  // TODO
      url: host,
      method: "get",
      headers: {
        accept: this.scope.swaggerRequestHeaders || ''application/json''
      },
      on: {
        error: function(response) {
          processedCalls += 1;
          var i;
          for(i = 0; i < opt.length; i++) {
            // fail all of these
            var resolved = host + ''#'' + opt[i];
            unresolvedRefs[resolved] = null;
          }
          if(processedCalls === expectedCalls)
            self.finish(spec, resolutionTable, resolvedRefs, unresolvedRefs, callback);
        },
        response: function(response) {
          var i, j, swagger = response.obj;
          processedCalls += 1;
          for(i = 0; i < opt.length; i++) {
            var location = swagger, path = opt[i], parts = path.split(''/'');
            for(j = 0; j < parts.length; j++) {
              var segment = parts[j];
              if(typeof location === ''undefined'')
                break;
              if(segment.length > 0)
                location = location[segment];
            }
            var resolved = host + ''#'' + path, resolvedName = parts[j-1];
            if(typeof location !== ''undefined'') {
              resolvedRefs[resolved] = {
                name: resolvedName,
                obj: location
              };
            }
            else unresolvedRefs[resolved] = null;
          }
          if(processedCalls === expectedCalls)
            self.finish(spec, resolutionTable, resolvedRefs, unresolvedRefs, callback);
        }
      }
    };
    authorizations.apply(obj);
    new SwaggerHttp().execute(obj);
  }
  if(Object.keys(opts).length === 0)
    callback.call(this.scope, spec, unresolvedRefs);
};

Resolver.prototype.finish = function(spec, resolutionTable, resolvedRefs, unresolvedRefs, callback) {
  // walk resolution table and replace with resolved refs
  var ref;
  for(ref in resolutionTable) {
    var i, locations = resolutionTable[ref];
    for(i = 0; i < locations.length; i++) {
      var resolvedTo = resolvedRefs[locations[i].obj.$ref];
      if(resolvedTo) {
        if(!spec.definitions)
          spec.definitions = {};
        if(locations[i].resolveAs === ''$ref'') {
          spec.definitions[resolvedTo.name] = resolvedTo.obj;
          locations[i].obj.$ref = ''#/definitions/'' + resolvedTo.name;
        }
        else if (locations[i].resolveAs === ''inline'') {
          var key;
          var targetObj = locations[i].obj;
          delete targetObj.$ref;
          for(key in resolvedTo.obj) {
            targetObj[key] = resolvedTo.obj[key];
          }
        }
      }
    }
  }
  callback.call(this.scope, spec, unresolvedRefs);
};

/**
 * immediately in-lines local refs, queues remote refs
 * for inline resolution
 */
Resolver.prototype.resolveInline = function (spec, property, objs, unresolvedRefs) {
  var ref = property.$ref;
  if(ref) {
    if(ref.indexOf(''http'') === 0) {
      if(Array.isArray(objs[ref])) {
        objs[ref].push({obj: property, resolveAs: ''inline''});
      }
      else {
        objs[ref] = [{obj: property, resolveAs: ''inline''}];
      }
    }
    else if (ref.indexOf(''#'') === 0) {
      // local resolve
      var shortenedRef = ref.substring(1);
      var i, parts = shortenedRef.split(''/''), location = spec;
      for(i = 0; i < parts.length; i++) {
        var part = parts[i];
        if(part.length > 0) {
          location = location[part];
        }
      }
      if(location) {
        delete property.$ref;
        var key;
        for(key in location) {
          property[key] = location[key];
        }
      }
      else unresolvedRefs[ref] = null;
    }
  }
  else if(property.type === ''array'') {
    this.resolveTo(property.items, objs);
  }
};

Resolver.prototype.resolveTo = function (property, objs) {
  var ref = property.$ref;
  if(ref) {
    if(ref.indexOf(''http'') === 0) {
      if(Array.isArray(objs[ref])) {
        objs[ref].push({obj: property, resolveAs: ''$ref''});
      }
      else {
        objs[ref] = [{obj: property, resolveAs: ''$ref''}];
      }
    }
  }
  else if(property.type === ''array'') {
    var items = property.items;
    this.resolveTo(items, objs);
  }
};
var addModel = function(name, model) {
  models[name] = model;
};

var SwaggerClient = function(url, options) {
  this.isBuilt = false;
  this.url = null;
  this.debug = false;
  this.basePath = null;
  this.modelsArray = [];
  this.authorizations = null;
  this.authorizationScheme = null;
  this.isValid = false;
  this.info = null;
  this.useJQuery = false;
  this.resourceCount = 0;

  if(typeof url !== ''undefined'')
    return this.initialize(url, options);
};

SwaggerClient.prototype.initialize = function (url, options) {
  this.models = models = {};

  options = (options||{});

  if(typeof url === ''string'')
    this.url = url;
  else if(typeof url === ''object'') {
    options = url;
    this.url = options.url;
  }
  this.swaggerRequstHeaders = options.swaggerRequstHeaders || ''application/json;charset=utf-8,*/*'';
  this.defaultSuccessCallback = options.defaultSuccessCallback || null;
  this.defaultErrorCallback = options.defaultErrorCallback || null;

  if (typeof options.success === ''function'')
    this.success = options.success;

  if (options.useJQuery)
    this.useJQuery = options.useJQuery;

  if (options.authorizations) {
    this.clientAuthorizations = options.authorizations;
  } else {
    this.clientAuthorizations = authorizations;
  }

  this.supportedSubmitMethods = options.supportedSubmitMethods || [];
  this.failure = options.failure || function() {};
  this.progress = options.progress || function() {};
  this.spec = options.spec;
  this.options = options;

  if (typeof options.success === ''function'') {
    this.ready = true;
    this.build();
  }
};

SwaggerClient.prototype.build = function(mock) {
  if (this.isBuilt) return this;
  var self = this;
  this.progress(''fetching resource list: '' + this.url);
  var obj = {
    useJQuery: this.useJQuery,
    url: this.url,
    method: "get",
    headers: {
      accept: this.swaggerRequstHeaders
    },
    on: {
      error: function(response) {
        if (self.url.substring(0, 4) !== ''http'')
          return self.fail(''Please specify the protocol for '' + self.url);
        else if (response.status === 0)
          return self.fail(''Can\''t read from server.  It may not have the appropriate access-control-origin settings.'');
        else if (response.status === 404)
          return self.fail(''Can\''t read swagger JSON from '' + self.url);
        else
          return self.fail(response.status + '' : '' + response.statusText + '' '' + self.url);
      },
      response: function(resp) {
        var responseObj = resp.obj || JSON.parse(resp.data);
        self.swaggerVersion = responseObj.swaggerVersion;

        if(responseObj.swagger && parseInt(responseObj.swagger) === 2) {
          self.swaggerVersion = responseObj.swagger;
          new Resolver().resolve(responseObj, self.buildFromSpec, self);
          self.isValid = true;
        }
        else {
          if (self.swaggerVersion === ''1.2'') {
            return self.buildFrom1_2Spec(responseObj);
          } else {
            return self.buildFrom1_1Spec(responseObj);
          }
        }
      }
    }
  };
  if(this.spec) {
    setTimeout(function() {
      new Resolver().resolve(self.spec, self.buildFromSpec, self);
   }, 10);
  }
  else {
    authorizations.apply(obj);
    if(mock)
      return obj;
    new SwaggerHttp().execute(obj);
  }
  return this;
};

SwaggerClient.prototype.buildFromSpec = function(response) {
  if(this.isBuilt) return this;

  this.info = response.info || {};
  this.title = response.title || '''';
  this.host = response.host || '''';
  this.schemes = response.schemes || [];
  this.basePath = response.basePath || '''';
  this.apis = {};
  this.apisArray = [];
  this.consumes = response.consumes;
  this.produces = response.produces;
  this.securityDefinitions = response.securityDefinitions;

  // legacy support
  this.authSchemes = response.securityDefinitions;

  var definedTags = {};
  if(Array.isArray(response.tags)) {
    definedTags = {};
    for(k = 0; k < response.tags.length; k++) {
      var t = response.tags[k];
      definedTags[t.name] = t;
    }
  }

  var location;
  if(typeof this.url === ''string'') {
    location = this.parseUri(this.url);
  }

  if(typeof this.schemes === ''undefined'' || this.schemes.length === 0) {
    this.scheme = location.scheme || ''http'';
  }
  else {
    this.scheme = this.schemes[0];
  }

  if(typeof this.host === ''undefined'' || this.host === '''') {
    this.host = location.host;
    if (location.port) {
      this.host = this.host + '':'' + location.port;
    }
  }

  this.definitions = response.definitions;
  var key;
  for(key in this.definitions) {
    var model = new Model(key, this.definitions[key]);
    if(model) {
      models[key] = model;
    }
  }

  // get paths, create functions for each operationId
  var path;
  var operations = [];
  for(path in response.paths) {
    if(typeof response.paths[path] === ''object'') {
      var httpMethod;
      for(httpMethod in response.paths[path]) {
        if([''delete'', ''get'', ''head'', ''options'', ''patch'', ''post'', ''put''].indexOf(httpMethod) === -1) {
          continue;
        }
        var operation = response.paths[path][httpMethod];
        var tags = operation.tags;
        if(typeof tags === ''undefined'') {
          operation.tags = [ ''default'' ];
          tags = operation.tags;
        }
        var operationId = this.idFromOp(path, httpMethod, operation);
        var operationObject = new Operation (
          this,
          operation.scheme,
          operationId,
          httpMethod,
          path,
          operation,
          this.definitions
        );
        // bind this operation''s execute command to the api
        if(tags.length > 0) {
          var i;
          for(i = 0; i < tags.length; i++) {
            var tag = this.tagFromLabel(tags[i]);
            var operationGroup = this[tag];
            if(typeof this.apis[tag] === ''undefined'')
              this.apis[tag] = {};
            if(typeof operationGroup === ''undefined'') {
              this[tag] = [];
              operationGroup = this[tag];
              operationGroup.operations = {};
              operationGroup.label = tag;
              operationGroup.apis = [];
              var tagObject = definedTags[tag];
              if(typeof tagObject === ''object'') {
                operationGroup.description = tagObject.description;
                operationGroup.externalDocs = tagObject.externalDocs;
              }
              this[tag].help = this.help.bind(operationGroup);
              this.apisArray.push(new OperationGroup(tag, operationGroup.description, operationGroup.externalDocs, operationObject));
            }
            if(typeof this.apis[tag].help !== ''function'')
              this.apis[tag].help = this.help.bind(operationGroup);
            // bind to the apis object
            this.apis[tag][operationId] = operationObject.execute.bind(operationObject);
            this.apis[tag][operationId].help = operationObject.help.bind(operationObject);
            this.apis[tag][operationId].asCurl = operationObject.asCurl.bind(operationObject);
            operationGroup[operationId] = operationObject.execute.bind(operationObject);
            operationGroup[operationId].help = operationObject.help.bind(operationObject);
            operationGroup[operationId].asCurl = operationObject.asCurl.bind(operationObject);

            operationGroup.apis.push(operationObject);
            operationGroup.operations[operationId] = operationObject;

            // legacy UI feature
            var j;
            var api;
            for(j = 0; j < this.apisArray.length; j++) {
              if(this.apisArray[j].tag === tag) {
                api = this.apisArray[j];
              }
            }
            if(api) {
              api.operationsArray.push(operationObject);
            }
          }
        }
        else {
          log(''no group to bind to'');
        }
      }
    }
  }
  this.isBuilt = true;
  if (this.success) {
    this.isValid = true;
    this.isBuilt = true;
    this.success();
  }
  return this;
};

SwaggerClient.prototype.parseUri = function(uri) {
  var urlParseRE = /^(((([^:\/#\?]+:)?(?:(\/\/)((?:(([^:@\/#\?]+)(?:\:([^:@\/#\?]+))?)@)?(([^:\/#\?\]\[]+|\[[^\/\]@#?]+\])(?:\:([0-9]+))?))?)?)?((\/?(?:[^\/\?#]+\/+)*)([^\?#]*)))?(\?[^#]+)?)(#.*)?/;
  var parts = urlParseRE.exec(uri);
  return {
    scheme: parts[4].replace('':'',''''),
    host: parts[11],
    port: parts[12],
    path: parts[15]
  };
};

SwaggerClient.prototype.help = function(dontPrint) {
  var i;
  var output = ''operations for the "'' + this.label + ''" tag'';
  for(i = 0; i < this.apis.length; i++) {
    var api = this.apis[i];
    output += ''\n  * '' + api.nickname + '': '' + api.operation.summary;
  }
  if(dontPrint)
    return output;
  else {
    log(output);
    return output;
  }
};

SwaggerClient.prototype.tagFromLabel = function(label) {
  return label;
};

SwaggerClient.prototype.idFromOp = function(path, httpMethod, op) {
  var opId = op.operationId || (path.substring(1) + ''_'' + httpMethod);
  return opId.replace(/[\.,-\/#!$%\^&\*;:{}=\-_`~()\+\s]/g,''_'');
};

SwaggerClient.prototype.fail = function(message) {
  this.failure(message);
  throw message;
};

var OperationGroup = function(tag, description, externalDocs, operation) {
  this.tag = tag;
  this.path = tag;
  this.description = description;
  this.externalDocs = externalDocs;
  this.name = tag;
  this.operation = operation;
  this.operationsArray = [];
};

var Operation = function(parent, scheme, operationId, httpMethod, path, args, definitions) {
  var errors = [];
  parent = parent||{};
  args = args||{};

  this.operations = {};
  this.operation = args;
  this.deprecated = args.deprecated;
  this.consumes = args.consumes;
  this.produces = args.produces;
  this.parent = parent;
  this.host = parent.host || ''localhost'';
  this.schemes = parent.schemes;
  this.scheme = scheme || parent.scheme || ''http'';
  this.basePath = parent.basePath || ''/'';
  this.nickname = (operationId||errors.push(''Operations must have a nickname.''));
  this.method = (httpMethod||errors.push(''Operation '' + operationId + '' is missing method.''));
  this.path = (path||errors.push(''Operation '' + this.nickname + '' is missing path.''));
  this.parameters = args !== null ? (args.parameters||[]) : {};
  this.summary = args.summary || '''';
  this.responses = (args.responses||{});
  this.type = null;
  this.security = args.security;
  this.authorizations = args.security;
  this.description = args.description;
  this.useJQuery = parent.useJQuery;

  if(typeof this.deprecated === ''string'') {
    switch(this.deprecated.toLowerCase()) {
      case ''true'': case ''yes'': case ''1'': {
        this.deprecated = true;
        break;
      }
      case ''false'': case ''no'': case ''0'': case null: {
        this.deprecated = false;
        break;
      }
      default: this.deprecated = Boolean(this.deprecated);
    }
  }

  var i, model;

  if(definitions) {
    // add to global models
    var key;
    for(key in this.definitions) {
      model = new Model(key, definitions[key]);
      if(model) {
        models[key] = model;
      }
    }
  }
  for(i = 0; i < this.parameters.length; i++) {
    var param = this.parameters[i];
    if(param.type === ''array'') {
      param.isList = true;
      param.allowMultiple = true;
    }
    var innerType = this.getType(param);
    if(innerType && innerType.toString().toLowerCase() === ''boolean'') {
      param.allowableValues = {};
      param.isList = true;
      param[''enum''] = ["true", "false"];
    }
    if(typeof param[''enum''] !== ''undefined'') {
      var id;
      param.allowableValues = {};
      param.allowableValues.values = [];
      param.allowableValues.descriptiveValues = [];
      for(id = 0; id < param[''enum''].length; id++) {
        var value = param[''enum''][id];
        var isDefault = (value === param.default) ? true : false;
        param.allowableValues.values.push(value);
        param.allowableValues.descriptiveValues.push({value : value, isDefault: isDefault});
      }
    }
    if(param.type === ''array'') {
      innerType = [innerType];
      if(typeof param.allowableValues === ''undefined'') {
        // can''t show as a list if no values to select from
        delete param.isList;
        delete param.allowMultiple;
      }
    }
    param.signature = this.getModelSignature(innerType, models).toString();
    param.sampleJSON = this.getModelSampleJSON(innerType, models);
    param.responseClassSignature = param.signature;
  }

  var defaultResponseCode, response, responses = this.responses;

  if(responses[''200'']) {
    response = responses[''200''];
    defaultResponseCode = ''200'';
  }
  else if(responses[''201'']) {
    response = responses[''201''];
    defaultResponseCode = ''201'';
  }
  else if(responses[''202'']) {
    response = responses[''202''];
    defaultResponseCode = ''202'';
  }
  else if(responses[''203'']) {
    response = responses[''203''];
    defaultResponseCode = ''203'';
  }
  else if(responses[''204'']) {
    response = responses[''204''];
    defaultResponseCode = ''204'';
  }
  else if(responses[''205'']) {
    response = responses[''205''];
    defaultResponseCode = ''205'';
  }
  else if(responses[''206'']) {
    response = responses[''206''];
    defaultResponseCode = ''206'';
  }
  else if(responses[''default'']) {
    response = responses[''default''];
    defaultResponseCode = ''default'';
  }

  if(response && response.schema) {
    var resolvedModel = this.resolveModel(response.schema, definitions);
    delete responses[defaultResponseCode];
    if(resolvedModel) {
      this.successResponse = {};
      this.successResponse[defaultResponseCode] = resolvedModel;
    }
    else {
      this.successResponse = {};
      this.successResponse[defaultResponseCode] = response.schema.type;
    }
    this.type = response;
  }

  if (errors.length > 0) {
    if(this.resource && this.resource.api && this.resource.api.fail)
      this.resource.api.fail(errors);
  }

  return this;
};

OperationGroup.prototype.sort = function(sorter) {

};

Operation.prototype.getType = function (param) {
  var type = param.type;
  var format = param.format;
  var isArray = false;
  var str;
  if(type === ''integer'' && format === ''int32'')
    str = ''integer'';
  else if(type === ''integer'' && format === ''int64'')
    str = ''long'';
  else if(type === ''integer'')
    str = ''integer'';
  else if(type === ''string'') {
    if(format === ''date-time'')
      str = ''date-time'';
    else if(format === ''date'')
      str = ''date'';
    else
      str = ''string'';
  }
  else if(type === ''number'' && format === ''float'')
    str = ''float'';
  else if(type === ''number'' && format === ''double'')
    str = ''double'';
  else if(type === ''number'')
    str = ''double'';
  else if(type === ''boolean'')
    str = ''boolean'';
  else if(type === ''array'') {
    isArray = true;
    if(param.items)
      str = this.getType(param.items);
  }
  if(param.$ref)
    str = param.$ref;

  var schema = param.schema;
  if(schema) {
    var ref = schema.$ref;
    if(ref) {
      ref = simpleRef(ref);
      if(isArray)
        return [ ref ];
      else
        return ref;
    }
    else
      return this.getType(schema);
  }
  if(isArray)
    return [ str ];
  else
    return str;
};

Operation.prototype.resolveModel = function (schema, definitions) {
  if(typeof schema.$ref !== ''undefined'') {
    var ref = schema.$ref;
    if(ref.indexOf(''#/definitions/'') === 0)
      ref = ref.substring(''#/definitions/''.length);
    if(definitions[ref]) {
      return new Model(ref, definitions[ref]);
    }
  }
  if(schema.type === ''array'')
    return new ArrayModel(schema);
  else
    return null;
};

Operation.prototype.help = function(dontPrint) {
  var out = this.nickname + '': '' + this.summary + ''\n'';
  for(var i = 0; i < this.parameters.length; i++) {
    var param = this.parameters[i];
    var typeInfo = param.signature;
    out += ''\n  * '' + param.name + '' ('' + typeInfo + ''): '' + param.description;
  }
  if(typeof dontPrint === ''undefined'')
    log(out);
  return out;
};

Operation.prototype.getModelSignature = function(type, definitions) {
  var isPrimitive, listType;

  if(type instanceof Array) {
    listType = true;
    type = type[0];
  }
  else if(typeof type === ''undefined'')
    type = ''undefined'';

  if(type === ''string'')
    isPrimitive = true;
  else
    isPrimitive = (listType && definitions[listType]) || (definitions[type]) ? false : true;
  if (isPrimitive) {
    if(listType)
      return ''Array['' + type + '']'';
    else
      return type.toString();
  } else {
    if (listType)
      return ''Array['' + definitions[type].getMockSignature() + '']'';
    else
      return definitions[type].getMockSignature();
  }
};

Operation.prototype.supportHeaderParams = function () {
  return true;
};

Operation.prototype.supportedSubmitMethods = function () {
  return this.parent.supportedSubmitMethods;
};

Operation.prototype.getHeaderParams = function (args) {
  var headers = this.setContentTypes(args, {});
  for(var i = 0; i < this.parameters.length; i++) {
    var param = this.parameters[i];
    if(typeof args[param.name] !== ''undefined'') {
      if (param.in === ''header'') {
        var value = args[param.name];
        if(Array.isArray(value))
          value = value.toString();
        headers[param.name] = value;
      }
    }
  }
  return headers;
};

Operation.prototype.urlify = function (args) {
  var formParams = {};
  var requestUrl = this.path;

  // grab params from the args, build the querystring along the way
  var querystring = '''';
  for(var i = 0; i < this.parameters.length; i++) {
    var param = this.parameters[i];
    if(typeof args[param.name] !== ''undefined'') {
      if(param.in === ''path'') {
        var reg = new RegExp(''\{'' + param.name + ''\}'', ''gi'');
        var value = args[param.name];
        if(Array.isArray(value))
          value = this.encodePathCollection(param.collectionFormat, param.name, value);
        else
          value = this.encodePathParam(value);
        requestUrl = requestUrl.replace(reg, value);
      }
      else if (param.in === ''query'' && typeof args[param.name] !== ''undefined'') {
        if(querystring === '''')
          querystring += ''?'';
        else
          querystring += ''&'';
        if(typeof param.collectionFormat !== ''undefined'') {
          var qp = args[param.name];
          if(Array.isArray(qp))
            querystring += this.encodeQueryCollection(param.collectionFormat, param.name, qp);
          else
            querystring += this.encodeQueryParam(param.name) + ''='' + this.encodeQueryParam(args[param.name]);
        }
        else
          querystring += this.encodeQueryParam(param.name) + ''='' + this.encodeQueryParam(args[param.name]);
      }
      else if (param.in === ''formData'')
        formParams[param.name] = args[param.name];
    }
  }
  var url = this.scheme + ''://'' + this.host;

  if(this.basePath !== ''/'')
    url += this.basePath;

  return url + requestUrl + querystring;
};

Operation.prototype.getMissingParams = function(args) {
  var missingParams = [];
  // check required params, track the ones that are missing
  var i;
  for(i = 0; i < this.parameters.length; i++) {
    var param = this.parameters[i];
    if(param.required === true) {
      if(typeof args[param.name] === ''undefined'')
        missingParams = param.name;
    }
  }
  return missingParams;
};

Operation.prototype.getBody = function(headers, args, opts) {
  var formParams = {}, body, key;

  for(var i = 0; i < this.parameters.length; i++) {
    var param = this.parameters[i];
    if(typeof args[param.name] !== ''undefined'') {
      if (param.in === ''body'') {
        body = args[param.name];
      } else if(param.in === ''formData'') {
        formParams[param.name] = args[param.name];
      }
    }
  }

  // handle form params
  if(headers[''Content-Type''] === ''application/x-www-form-urlencoded'') {
    var encoded = "";
    for(key in formParams) {
      value = formParams[key];
      if(typeof value !== ''undefined''){
        if(encoded !== "")
          encoded += "&";
        encoded += encodeURIComponent(key) + ''='' + encodeURIComponent(value);
      }
    }
    body = encoded;
  }
  else if (headers[''Content-Type''] && headers[''Content-Type''].indexOf(''multipart/form-data'') >= 0) {
    if(opts.useJQuery) {
      var bodyParam = new FormData();
      bodyParam.type = ''formData'';
      for (key in formParams) {
        value = args[key];
        if (typeof value !== ''undefined'') {
          // required for jquery file upload
          if(value.type === ''file'' && value.value) {
            delete headers[''Content-Type''];
            bodyParam.append(key, value.value);
          }
          else
            bodyParam.append(key, value);
        }
      }
      body = bodyParam;
    }
  }

  return body;
};

/**
 * gets sample response for a single operation
 **/
Operation.prototype.getModelSampleJSON = function(type, models) {
  var isPrimitive, listType, sampleJson;

  listType = (type instanceof Array);
  isPrimitive = models[type] ? false : true;
  sampleJson = isPrimitive ? void 0 : models[type].createJSONSample();
  if (sampleJson) {
    sampleJson = listType ? [sampleJson] : sampleJson;
    if(typeof sampleJson == ''string'')
      return sampleJson;
    else if(typeof sampleJson === ''object'') {
      var t = sampleJson;
      if(sampleJson instanceof Array && sampleJson.length > 0) {
        t = sampleJson[0];
      }
      if(t.nodeName) {
        var xmlString = new XMLSerializer().serializeToString(t);
        return this.formatXml(xmlString);
      }
      else
        return JSON.stringify(sampleJson, null, 2);
    }
    else
      return sampleJson;
  }
};

/**
 * legacy binding
 **/
Operation.prototype["do"] = function(args, opts, callback, error, parent) {
  return this.execute(args, opts, callback, error, parent);
};


/**
 * executes an operation
 **/
Operation.prototype.execute = function(arg1, arg2, arg3, arg4, parent) {
  var args = arg1 || {};
  var opts = {}, success, error;
  if(typeof arg2 === ''object'') {
    opts = arg2;
    success = arg3;
    error = arg4;
  }

  if(typeof arg2 === ''function'') {
    success = arg2;
    error = arg3;
  }

  success = (success||log);
  error = (error||log);

  if(opts.useJQuery)
    this.useJQuery = opts.useJQuery;

  var missingParams = this.getMissingParams(args);
  if(missingParams.length > 0) {
    var message = ''missing required params: '' + missingParams;
    fail(message);
    return;
  }
  var allHeaders = this.getHeaderParams(args);
  var contentTypeHeaders = this.setContentTypes(args, opts);

  var headers = {}, attrname;
  for (attrname in allHeaders) { headers[attrname] = allHeaders[attrname]; }
  for (attrname in contentTypeHeaders) { headers[attrname] = contentTypeHeaders[attrname]; }

  var body = this.getBody(headers, args, opts);
  var url = this.urlify(args);

  var obj = {
    url: url,
    method: this.method.toUpperCase(),
    body: body,
    useJQuery: this.useJQuery,
    headers: headers,
    on: {
      response: function(response) {
        return success(response, parent);
      },
      error: function(response) {
        return error(response, parent);
      }
    }
  };
  var status = authorizations.apply(obj, this.operation.security);
  if(opts.mock === true)
    return obj;
  else
    new SwaggerHttp().execute(obj, opts);
};

Operation.prototype.setContentTypes = function(args, opts) {
  // default type
  var accepts = ''application/json'';
  var consumes = args.parameterContentType || ''application/json'';
  var allDefinedParams = this.parameters;
  var definedFormParams = [];
  var definedFileParams = [];
  var body;
  var headers = {};

  // get params from the operation and set them in definedFileParams, definedFormParams, headers
  var i;
  for(i = 0; i < allDefinedParams.length; i++) {
    var param = allDefinedParams[i];
    if(param.in === ''formData'') {
      if(param.type === ''file'')
        definedFileParams.push(param);
      else
        definedFormParams.push(param);
    }
    else if(param.in === ''header'' && opts) {
      var key = param.name;
      var headerValue = opts[param.name];
      if(typeof opts[param.name] !== ''undefined'')
        headers[key] = headerValue;
    }
    else if(param.in === ''body'' && typeof args[param.name] !== ''undefined'') {
      body = args[param.name];
    }
  }

  // if there''s a body, need to set the consumes header via requestContentType
  if (body && (this.method === ''post'' || this.method === ''put'' || this.method === ''patch'' || this.method === ''delete'')) {
    if (opts.requestContentType)
      consumes = opts.requestContentType;
  } else {
    // if any form params, content type must be set
    if(definedFormParams.length > 0) {
      if(opts.requestContentType)           // override if set
        consumes = opts.requestContentType;
      else if(definedFileParams.length > 0) // if a file, must be multipart/form-data
        consumes = ''multipart/form-data'';
      else                                  // default to x-www-from-urlencoded
        consumes = ''application/x-www-form-urlencoded'';
    }
    else if (this.type == ''DELETE'')
      body = ''{}'';
    else if (this.type != ''DELETE'')
      consumes = null;
  }

  if (consumes && this.consumes) {
    if (this.consumes.indexOf(consumes) === -1) {
      log(''server doesn\''t consume '' + consumes + '', try '' + JSON.stringify(this.consumes));
    }
  }

  if (opts.responseContentType) {
    accepts = opts.responseContentType;
  } else {
    accepts = ''application/json'';
  }
  if (accepts && this.produces) {
    if (this.produces.indexOf(accepts) === -1) {
      log(''server can\''t produce '' + accepts);
    }
  }

  if ((consumes && body !== '''') || (consumes === ''application/x-www-form-urlencoded''))
    headers[''Content-Type''] = consumes;
  if (accepts)
    headers.Accept = accepts;
  return headers;
};

Operation.prototype.asCurl = function (args) {
  var obj = this.execute(args, {mock: true});
  authorizations.apply(obj);
  var results = [];
  results.push(''-X '' + this.method.toUpperCase());
  if (obj.headers) {
    var key;
    for (key in obj.headers)
      results.push(''--header "'' + key + '': '' + obj.headers[key] + ''"'');
  }
  if(obj.body) {
    var body;
    if(typeof obj.body === ''object'')
      body = JSON.stringify(obj.body);
    else
      body = obj.body;
    results.push(''-d "'' + body.replace(/"/g, ''\\"'') + ''"'');
  }
  return ''curl '' + (results.join('' '')) + '' "'' + obj.url + ''"'';
};

Operation.prototype.encodePathCollection = function(type, name, value) {
  var encoded = '''';
  var i;
  var separator = '''';
  if(type === ''ssv'')
    separator = ''%20'';
  else if(type === ''tsv'')
    separator = ''\\t'';
  else if(type === ''pipes'')
    separator = ''|'';
  else
    separator = '','';

  for(i = 0; i < value.length; i++) {
    if(i === 0)
      encoded = this.encodeQueryParam(value[i]);
    else
      encoded += separator + this.encodeQueryParam(value[i]);
  }
  return encoded;
};

Operation.prototype.encodeQueryCollection = function(type, name, value) {
  var encoded = '''';
  var i;
  if(type === ''default'' || type === ''multi'') {
    for(i = 0; i < value.length; i++) {
      if(i > 0) encoded += ''&'';
      encoded += this.encodeQueryParam(name) + ''='' + this.encodeQueryParam(value[i]);
    }
  }
  else {
    var separator = '''';
    if(type === ''csv'')
      separator = '','';
    else if(type === ''ssv'')
      separator = ''%20'';
    else if(type === ''tsv'')
      separator = ''\\t'';
    else if(type === ''pipes'')
      separator = ''|'';
    else if(type === ''brackets'') {
      for(i = 0; i < value.length; i++) {
        if(i !== 0)
          encoded += ''&'';
        encoded += this.encodeQueryParam(name) + ''[]='' + this.encodeQueryParam(value[i]);
      }
    }
    if(separator !== '''') {
      for(i = 0; i < value.length; i++) {
        if(i === 0)
          encoded = this.encodeQueryParam(name) + ''='' + this.encodeQueryParam(value[i]);
        else
          encoded += separator + this.encodeQueryParam(value[i]);
      }
    }
  }
  return encoded;
};

Operation.prototype.encodeQueryParam = function(arg) {
  return encodeURIComponent(arg);
};

/**
 * TODO revisit, might not want to leave ''/''
 **/
Operation.prototype.encodePathParam = function(pathParam) {
  var encParts, part, parts, i, len;
  pathParam = pathParam.toString();
  if (pathParam.indexOf(''/'') === -1) {
    return encodeURIComponent(pathParam);
  } else {
    parts = pathParam.split(''/'');
    encParts = [];
    for (i = 0, len = parts.length; i < len; i++) {
      encParts.push(encodeURIComponent(parts[i]));
    }
    return encParts.join(''/'');
  }
};

var Model = function(name, definition) {
  this.name = name;
  this.definition = definition || {};
  this.properties = [];
  var requiredFields = definition.required || [];
  if(definition.type === ''array'') {
    var out = new ArrayModel(definition);
    return out;
  }
  var key;
  var props = definition.properties;
  if(props) {
    for(key in props) {
      var required = false;
      var property = props[key];
      if(requiredFields.indexOf(key) >= 0)
        required = true;
      this.properties.push(new Property(key, property, required));
    }
  }
};

Model.prototype.createJSONSample = function(modelsToIgnore) {
  var i, result = {}, representations = {};
  modelsToIgnore = (modelsToIgnore||{});
  modelsToIgnore[this.name] = this;
  for (i = 0; i < this.properties.length; i++) {
    prop = this.properties[i];
    var sample = prop.getSampleValue(modelsToIgnore, representations);
    result[prop.name] = sample;
  }
  delete modelsToIgnore[this.name];
  return result;
};

Model.prototype.getSampleValue = function(modelsToIgnore) {
  var i, obj = {}, representations = {};
  for(i = 0; i < this.properties.length; i++ ) {
    var property = this.properties[i];
    obj[property.name] = property.sampleValue(false, modelsToIgnore, representations);
  }
  return obj;
};

Model.prototype.getMockSignature = function(modelsToIgnore) {
  var i, prop, propertiesStr = [];
  for (i = 0; i < this.properties.length; i++) {
    prop = this.properties[i];
    propertiesStr.push(prop.toString());
  }
  var strong = ''<span class="strong">'';
  var stronger = ''<span class="stronger">'';
  var strongClose = ''</span>'';
  var classOpen = strong + this.name + '' {'' + strongClose;
  var classClose = strong + ''}'' + strongClose;
  var returnVal = classOpen + ''<div>'' + propertiesStr.join('',</div><div>'') + ''</div>'' + classClose;
  if (!modelsToIgnore)
    modelsToIgnore = {};

  modelsToIgnore[this.name] = this;
  for (i = 0; i < this.properties.length; i++) {
    prop = this.properties[i];
    var ref = prop.$ref;
    var model = models[ref];
    if (model && typeof modelsToIgnore[model.name] === ''undefined'') {
      returnVal = returnVal + (''<br>'' + model.getMockSignature(modelsToIgnore));
    }
  }
  return returnVal;
};

var Property = function(name, obj, required) {
  this.schema = obj;
  this.required = required;
  if(obj.$ref)
    this.$ref = simpleRef(obj.$ref);
  else if (obj.type === ''array'' && obj.items) {
    if(obj.items.$ref)
      this.$ref = simpleRef(obj.items.$ref);
    else
      obj = obj.items;
  }
  this.name = name;
  this.description = obj.description;
  this.obj = obj;
  this.optional = true;
  this.optional = !required;
  this.default = obj.default || null;
  this.example = obj.example !== undefined ? obj.example : null;
  this.collectionFormat = obj.collectionFormat || null;
  this.maximum = obj.maximum || null;
  this.exclusiveMaximum = obj.exclusiveMaximum || null;
  this.minimum = obj.minimum || null;
  this.exclusiveMinimum = obj.exclusiveMinimum || null;
  this.maxLength = obj.maxLength || null;
  this.minLength = obj.minLength || null;
  this.pattern = obj.pattern || null;
  this.maxItems = obj.maxItems || null;
  this.minItems = obj.minItems || null;
  this.uniqueItems = obj.uniqueItems || null;
  this[''enum''] = obj[''enum''] || null;
  this.multipleOf = obj.multipleOf || null;
};

Property.prototype.getSampleValue = function (modelsToIgnore, representations) {
  return this.sampleValue(false, modelsToIgnore, representations);
};

Property.prototype.isArray = function () {
  var schema = this.schema;
  if(schema.type === ''array'')
    return true;
  else
    return false;
};

Property.prototype.sampleValue = function(isArray, ignoredModels, representations) {
  isArray = (isArray || this.isArray());
  ignoredModels = (ignoredModels || {});
  // representations = (representations || {});

  var type = getStringSignature(this.obj, true);
  var output;

  if(this.$ref) {
    var refModelName = simpleRef(this.$ref);
    var refModel = models[refModelName];
    if(typeof representations[type] !== ''undefined'') {
      return representations[type];
    }
    else

    if(refModel && typeof ignoredModels[type] === ''undefined'') {
      ignoredModels[type] = this;
      output = refModel.getSampleValue(ignoredModels, representations);
      representations[type] = output;
    }
    else {
      output = (representations[type] || refModelName);
    }
  }
  else if(this.example)
    output = this.example;
  else if(this.default)
    output = this.default;
  else if(type === ''date-time'')
    output = new Date().toISOString();
  else if(type === ''date'')
    output = new Date().toISOString().split("T")[0];
  else if(type === ''string'')
    output = ''string'';
  else if(type === ''integer'')
    output = 0;
  else if(type === ''long'')
    output = 0;
  else if(type === ''float'')
    output = 0.0;
  else if(type === ''double'')
    output = 0.0;
  else if(type === ''boolean'')
    output = true;
  else
    output = {};
  ignoredModels[type] = output;
  if(isArray)
    return [output];
  else
    return output;
};

getStringSignature = function(obj, baseComponent) {
  var str = '''';
  if(typeof obj.$ref !== ''undefined'')
    str += simpleRef(obj.$ref);
  else if(typeof obj.type === ''undefined'')
    str += ''object'';
  else if(obj.type === ''array'') {
    if(baseComponent)
      str += getStringSignature((obj.items || obj.$ref || {}));
    else {
      str += ''Array['';
      str += getStringSignature((obj.items || obj.$ref || {}));
      str += '']'';
    }
  }
  else if(obj.type === ''integer'' && obj.format === ''int32'')
    str += ''integer'';
  else if(obj.type === ''integer'' && obj.format === ''int64'')
    str += ''long'';
  else if(obj.type === ''integer'' && typeof obj.format === ''undefined'')
    str += ''long'';
  else if(obj.type === ''string'' && obj.format === ''date-time'')
    str += ''date-time'';
  else if(obj.type === ''string'' && obj.format === ''date'')
    str += ''date'';
  else if(obj.type === ''string'' && typeof obj.format === ''undefined'')
    str += ''string'';
  else if(obj.type === ''number'' && obj.format === ''float'')
    str += ''float'';
  else if(obj.type === ''number'' && obj.format === ''double'')
    str += ''double'';
  else if(obj.type === ''number'' && typeof obj.format === ''undefined'')
    str += ''double'';
  else if(obj.type === ''boolean'')
    str += ''boolean'';
  else if(obj.$ref)
    str += simpleRef(obj.$ref);
  else
    str += obj.type;
  return str;
};

simpleRef = function(name) {
  if(typeof name === ''undefined'')
    return null;
  if(name.indexOf("#/definitions/") === 0)
    return name.substring(''#/definitions/''.length);
  else
    return name;
};

Property.prototype.toString = function() {
  var str = getStringSignature(this.obj);
  if(str !== '''') {
    str = ''<span class="propName '' + this.required + ''">'' + this.name + ''</span> (<span class="propType">'' + str + ''</span>'';
    if(!this.required)
      str += '', <span class="propOptKey">optional</span>'';
    str += '')'';
  }
  else
    str = this.name + '' ('' + JSON.stringify(this.obj) + '')'';

  if(typeof this.description !== ''undefined'')
    str += '': '' + this.description;

  if (this[''enum'']) {
    str += '' = <span class="propVals">[\'''' + this[''enum''].join(''\'' or \'''') + ''\'']</span>'';
  }
  if (this.descr) {
    str += '': <span class="propDesc">'' + this.descr + ''</span>'';
  }


  var options = ''''; 
  var isArray = this.schema.type === ''array'';
  var type;

  if(isArray) {
    if(this.schema.items)
      type = this.schema.items.type;
    else
      type = '''';
  }
  else {
    type = this.schema.type;
  }

  if (this.default)
    options += optionHtml(''Default'', this.default);

  switch (type) {
    case ''string'':
      if (this.minLength)
        options += optionHtml(''Min. Length'', this.minLength);
      if (this.maxLength)
        options += optionHtml(''Max. Length'', this.maxLength);
      if (this.pattern)
        options += optionHtml(''Reg. Exp.'', this.pattern);
      break;
    case ''integer'':
    case ''number'':
      if (this.minimum)
        options += optionHtml(''Min. Value'', this.minimum);
      if (this.exclusiveMinimum)
        options += optionHtml(''Exclusive Min.'', "true");
      if (this.maximum)
        options += optionHtml(''Max. Value'', this.maximum);
      if (this.exclusiveMaximum)
        options += optionHtml(''Exclusive Max.'', "true");
      if (this.multipleOf)
        options += optionHtml(''Multiple Of'', this.multipleOf);
      break;
  }

  if (isArray) {
    if (this.minItems)
      options += optionHtml(''Min. Items'', this.minItems);
    if (this.maxItems)
      options += optionHtml(''Max. Items'', this.maxItems);
    if (this.uniqueItems)
      options += optionHtml(''Unique Items'', "true");
    if (this.collectionFormat)
      options += optionHtml(''Coll. Format'', this.collectionFormat);
  }

  if (this[''enum'']) {
    var enumString;

    if (type === ''number'' || type === ''integer'')
      enumString = this[''enum''].join('', '');
    else {
      enumString = ''"'' + this[''enum''].join(''", "'') + ''"'';
    }

    options += optionHtml(''Enum'', enumString);
  }     

  if (options.length > 0)
    str = ''<span class="propWrap">'' + str + ''<table class="optionsWrapper"><tr><th colspan="2">'' + this.name + ''</th></tr>'' + options + ''</table></span>'';
  
  return str;
};

optionHtml = function(label, value) {
  return ''<tr><td class="optionName">'' + label + '':</td><td>'' + value + ''</td></tr>'';
};

typeFromJsonSchema = function(type, format) {
  var str;
  if(type === ''integer'' && format === ''int32'')
    str = ''integer'';
  else if(type === ''integer'' && format === ''int64'')
    str = ''long'';
  else if(type === ''integer'' && typeof format === ''undefined'')
    str = ''long'';
  else if(type === ''string'' && format === ''date-time'')
    str = ''date-time'';
  else if(type === ''string'' && format === ''date'')
    str = ''date'';
  else if(type === ''number'' && format === ''float'')
    str = ''float'';
  else if(type === ''number'' && format === ''double'')
    str = ''double'';
  else if(type === ''number'' && typeof format === ''undefined'')
    str = ''double'';
  else if(type === ''boolean'')
    str = ''boolean'';
  else if(type === ''string'')
    str = ''string'';

  return str;
};

var sampleModels = {};
var cookies = {};
var models = {};

SwaggerClient.prototype.buildFrom1_2Spec = function (response) {
  if (response.apiVersion !== null) {
    this.apiVersion = response.apiVersion;
  }
  this.apis = {};
  this.apisArray = [];
  this.consumes = response.consumes;
  this.produces = response.produces;
  this.authSchemes = response.authorizations;
  this.info = this.convertInfo(response.info);

  var isApi = false, i, res;
  for (i = 0; i < response.apis.length; i++) {
    var api = response.apis[i];
    if (api.operations) {
      var j;
      for (j = 0; j < api.operations.length; j++) {
        operation = api.operations[j];
        isApi = true;
      }
    }
  }
  if (response.basePath)
    this.basePath = response.basePath;
  else if (this.url.indexOf(''?'') > 0)
    this.basePath = this.url.substring(0, this.url.lastIndexOf(''?''));
  else
    this.basePath = this.url;

  if (isApi) {
    var newName = response.resourcePath.replace(/\//g, '''');
    this.resourcePath = response.resourcePath;
    res = new SwaggerResource(response, this);
    this.apis[newName] = res;
    this.apisArray.push(res);
    this.finish();
  } else {
    var k;
    this.expectedResourceCount = response.apis.length;
    for (k = 0; k < response.apis.length; k++) {
      var resource = response.apis[k];
      res = new SwaggerResource(resource, this);
      this.apis[res.name] = res;
      this.apisArray.push(res);
    }
  }
  this.isValid = true;
  return this;
};

SwaggerClient.prototype.finish = function() {
  if (typeof this.success === ''function'') {
    this.isValid = true;
    this.ready = true;
    this.isBuilt = true;
    this.selfReflect();
    this.success();
  }  
};

SwaggerClient.prototype.buildFrom1_1Spec = function (response) {
  log(''This API is using a deprecated version of Swagger!  Please see http://github.com/wordnik/swagger-core/wiki for more info'');
  if (response.apiVersion !== null)
    this.apiVersion = response.apiVersion;
  this.apis = {};
  this.apisArray = [];
  this.produces = response.produces;
  this.info = this.convertInfo(response.info);
  var isApi = false, res;
  for (var i = 0; i < response.apis.length; i++) {
    var api = response.apis[i];
    if (api.operations) {
      for (var j = 0; j < api.operations.length; j++) {
        operation = api.operations[j];
        isApi = true;
      }
    }
  }
  if (response.basePath) {
    this.basePath = response.basePath;
  } else if (this.url.indexOf(''?'') > 0) {
    this.basePath = this.url.substring(0, this.url.lastIndexOf(''?''));
  } else {
    this.basePath = this.url;
  }
  if (isApi) {
    var newName = response.resourcePath.replace(/\//g, '''');
    this.resourcePath = response.resourcePath;
    res = new SwaggerResource(response, this);
    this.apis[newName] = res;
    this.apisArray.push(res);
    this.finish();
  } else {
    this.expectedResourceCount = response.apis.length;
    for (k = 0; k < response.apis.length; k++) {
      resource = response.apis[k];
      res = new SwaggerResource(resource, this);
      this.apis[res.name] = res;
      this.apisArray.push(res);
    }
  }
  this.isValid = true;
  return this;
};

SwaggerClient.prototype.convertInfo = function (resp) {
  if(typeof resp == ''object'') {
    var info = {};

    info.title = resp.title;
    info.description = resp.description;
    info.termsOfService = resp.termsOfServiceUrl;
    info.contact = {};
    info.contact.name = resp.contact;
    info.license = {};
    info.license.name = resp.license;
    info.license.url = resp.licenseUrl;

    return info;
  }
};

SwaggerClient.prototype.selfReflect = function () {
  var resource, tag, ref;
  if (this.apis === null) {
    return false;
  }
  ref = this.apis;
  for (tag in ref) {
    api = ref[tag];
    if (api.ready === null) {
      return false;
    }
    this[tag] = api;
    this[tag].help = __bind(api.help, api);
  }
  this.setConsolidatedModels();
  this.ready = true;
};

SwaggerClient.prototype.setConsolidatedModels = function () {
  var model, modelName, resource, resource_name, i, apis, models, results;
  this.models = {};
  apis = this.apis;
  for (resource_name in apis) {
    resource = apis[resource_name];
    for (modelName in resource.models) {
      if (typeof this.models[modelName] === ''undefined'') {
        this.models[modelName] = resource.models[modelName];
        this.modelsArray.push(resource.models[modelName]);
      }
    }
  }
  models = this.modelsArray;
  results = [];
  for (i = 0; i < models.length; i++) {
    model = models[i];
    results.push(model.setReferencedModels(this.models));
  }
  return results;
};

var SwaggerResource = function (resourceObj, api) {
  var _this = this;
  this.api = api;
  this.swaggerRequstHeaders = api.swaggerRequstHeaders;
  this.path = (typeof this.api.resourcePath === ''string'') ? this.api.resourcePath : resourceObj.path;
  this.description = resourceObj.description;
  this.authorizations = (resourceObj.authorizations || {});

  var parts = this.path.split(''/'');
  this.name = parts[parts.length - 1].replace(''.{format}'', '''');
  this.basePath = this.api.basePath;
  this.operations = {};
  this.operationsArray = [];
  this.modelsArray = [];
  this.models = api.models || {};
  this.rawModels = {};
  this.useJQuery = (typeof api.useJQuery !== ''undefined'') ? api.useJQuery : null;

  if ((resourceObj.apis) && this.api.resourcePath) {
    this.addApiDeclaration(resourceObj);
  } else {
    if (typeof this.path === ''undefined'') {
      this.api.fail(''SwaggerResources must have a path.'');
    }
    if (this.path.substring(0, 4) === ''http'') {
      this.url = this.path.replace(''{format}'', ''json'');
    } else {
      this.url = this.api.basePath + this.path.replace(''{format}'', ''json'');
    }
    this.api.progress(''fetching resource '' + this.name + '': '' + this.url);
    var obj = {
      url: this.url,
      method: ''GET'',
      useJQuery: this.useJQuery,
      headers: {
        accept: this.swaggerRequstHeaders
      },
      on: {
        response: function (resp) {
          var responseObj = resp.obj || JSON.parse(resp.data);
          _this.api.resourceCount += 1;
          return _this.addApiDeclaration(responseObj);
        },
        error: function (response) {
          _this.api.resourceCount += 1;
          return _this.api.fail(''Unable to read api \'''' +
          _this.name + ''\'' from path '' + _this.url + '' (server returned '' + response.statusText + '')'');
        }
      }
    };
    var e = typeof window !== ''undefined'' ? window : exports;
    e.authorizations.apply(obj);
    new SwaggerHttp().execute(obj);
  }
};

SwaggerResource.prototype.help = function (dontPrint) {
  var i;
  var output = ''operations for the "'' + this.name + ''" tag'';
  for(i = 0; i < this.operationsArray.length; i++) {
    var api = this.operationsArray[i];
    output += ''\n  * '' + api.nickname + '': '' + api.description;
  }
  if(dontPrint)
    return output;
  else {
    log(output);
    return output;
  }
};

SwaggerResource.prototype.getAbsoluteBasePath = function (relativeBasePath) {
  var pos, url;
  url = this.api.basePath;
  pos = url.lastIndexOf(relativeBasePath);
  var parts = url.split(''/'');
  var rootUrl = parts[0] + ''//'' + parts[2];

  if (relativeBasePath.indexOf(''http'') === 0)
    return relativeBasePath;
  if (relativeBasePath === ''/'')
    return rootUrl;
  if (relativeBasePath.substring(0, 1) == ''/'') {
    // use root + relative
    return rootUrl + relativeBasePath;
  }
  else {
    pos = this.basePath.lastIndexOf(''/'');
    var base = this.basePath.substring(0, pos);
    if (base.substring(base.length - 1) == ''/'')
      return base + relativeBasePath;
    else
      return base + ''/'' + relativeBasePath;
  }
};

SwaggerResource.prototype.addApiDeclaration = function (response) {
  if (typeof response.produces === ''string'')
    this.produces = response.produces;
  if (typeof response.consumes === ''string'')
    this.consumes = response.consumes;
  if ((typeof response.basePath === ''string'') && response.basePath.replace(/\s/g, '''').length > 0)
    this.basePath = response.basePath.indexOf(''http'') === -1 ? this.getAbsoluteBasePath(response.basePath) : response.basePath;
  this.resourcePath = response.resourcePath;
  this.addModels(response.models);
  if (response.apis) {
    for (var i = 0 ; i < response.apis.length; i++) {
      var endpoint = response.apis[i];
      this.addOperations(endpoint.path, endpoint.operations, response.consumes, response.produces);
    }
  }
  this.api[this.name] = this;
  this.ready = true;
  if(this.api.resourceCount === this.api.expectedResourceCount)
    this.api.finish();
  return this;
};

SwaggerResource.prototype.addModels = function (models) {
  if (typeof models === ''object'') {
    var modelName;
    for (modelName in models) {
      if (typeof this.models[modelName] === ''undefined'') {
        var swaggerModel = new SwaggerModel(modelName, models[modelName]);
        this.modelsArray.push(swaggerModel);
        this.models[modelName] = swaggerModel;
        this.rawModels[modelName] = models[modelName];
      }
    }
    var output = [];
    for (var i = 0; i < this.modelsArray.length; i++) {
      var model = this.modelsArray[i];
      output.push(model.setReferencedModels(this.models));
    }
    return output;
  }
};

SwaggerResource.prototype.addOperations = function (resource_path, ops, consumes, produces) {
  if (ops) {
    var output = [];
    for (var i = 0; i < ops.length; i++) {
      var o = ops[i];
      consumes = this.consumes;
      produces = this.produces;
      if (typeof o.consumes !== ''undefined'')
        consumes = o.consumes;
      else
        consumes = this.consumes;

      if (typeof o.produces !== ''undefined'')
        produces = o.produces;
      else
        produces = this.produces;
      var type = (o.type || o.responseClass);

      if (type === ''array'') {
        ref = null;
        if (o.items)
          ref = o.items.type || o.items.$ref;
        type = ''array['' + ref + '']'';
      }
      var responseMessages = o.responseMessages;
      var method = o.method;
      if (o.httpMethod) {
        method = o.httpMethod;
      }
      if (o.supportedContentTypes) {
        consumes = o.supportedContentTypes;
      }
      if (o.errorResponses) {
        responseMessages = o.errorResponses;
        for (var j = 0; j < responseMessages.length; j++) {
          r = responseMessages[j];
          r.message = r.reason;
          r.reason = null;
        }
      }
      o.nickname = this.sanitize(o.nickname);
      var op = new SwaggerOperation(o.nickname,
          resource_path,
          method,
          o.parameters,
          o.summary,
          o.notes,
          type,
          responseMessages, 
          this, 
          consumes, 
          produces, 
          o.authorizations, 
          o.deprecated);

      this.operations[op.nickname] = op;
      output.push(this.operationsArray.push(op));
    }
    return output;
  }
};

SwaggerResource.prototype.sanitize = function (nickname) {
  var op;
  op = nickname.replace(/[\s!@#$%^&*()_+=\[{\]};:<>|.\/?,\\''""-]/g, ''_'');
  op = op.replace(/((_){2,})/g, ''_'');
  op = op.replace(/^(_)*/g, '''');
  op = op.replace(/([_])*$/g, '''');
  return op;
};

var SwaggerModel = function (modelName, obj) {
  this.name = typeof obj.id !== ''undefined'' ? obj.id : modelName;
  this.properties = [];
  var propertyName;
  for (propertyName in obj.properties) {
    if (obj.required) {
      var value;
      for (value in obj.required) {
        if (propertyName === obj.required[value]) {
          obj.properties[propertyName].required = true;
        }
      }
    }
    var prop = new SwaggerModelProperty(propertyName, obj.properties[propertyName], this);
    this.properties.push(prop);
  }
};

SwaggerModel.prototype.setReferencedModels = function (allModels) {
  var results = [];
  for (var i = 0; i < this.properties.length; i++) {
    var property = this.properties[i];
    var type = property.type || property.dataType;
    if (allModels[type])
      results.push(property.refModel = allModels[type]);
    else if ((property.refDataType) && (allModels[property.refDataType]))
      results.push(property.refModel = allModels[property.refDataType]);
    else
      results.push(void 0);
  }
  return results;
};

SwaggerModel.prototype.getMockSignature = function (modelsToIgnore) {
  var i, prop, propertiesStr = [];
  for (i = 0; i < this.properties.length; i++) {
    prop = this.properties[i];
    propertiesStr.push(prop.toString());
  }

  var strong = ''<span class="strong">'';
  var strongClose = ''</span>'';
  var classOpen = strong + this.name + '' {'' + strongClose;
  var classClose = strong + ''}'' + strongClose;
  var returnVal = classOpen + ''<div>'' + propertiesStr.join('',</div><div>'') + ''</div>'' + classClose;
  if (!modelsToIgnore)
    modelsToIgnore = [];
  modelsToIgnore.push(this.name);

  for (i = 0; i < this.properties.length; i++) {
    prop = this.properties[i];
    if ((prop.refModel) && modelsToIgnore.indexOf(prop.refModel.name) === -1) {
      returnVal = returnVal + (''<br>'' + prop.refModel.getMockSignature(modelsToIgnore));
    }
  }
  return returnVal;
};

SwaggerModel.prototype.createJSONSample = function (modelsToIgnore) {
  if (sampleModels[this.name]) {
    return sampleModels[this.name];
  }
  else {
    var result = {};
    modelsToIgnore = (modelsToIgnore || []);
    modelsToIgnore.push(this.name);
    for (var i = 0; i < this.properties.length; i++) {
      var prop = this.properties[i];
      result[prop.name] = prop.getSampleValue(modelsToIgnore);
    }
    modelsToIgnore.pop(this.name);
    return result;
  }
};

var SwaggerModelProperty = function (name, obj, model) {
  this.name = name;
  this.dataType = obj.type || obj.dataType || obj.$ref;
  this.isCollection = this.dataType && (this.dataType.toLowerCase() === ''array'' || this.dataType.toLowerCase() === ''list'' || this.dataType.toLowerCase() === ''set'');
  this.descr = obj.description;
  this.required = obj.required;
  this.defaultValue = applyModelPropertyMacro(obj, model);
  if (obj.items) {
    if (obj.items.type) {
      this.refDataType = obj.items.type;
    }
    if (obj.items.$ref) {
      this.refDataType = obj.items.$ref;
    }
  }
  this.dataTypeWithRef = this.refDataType ? (this.dataType + ''['' + this.refDataType + '']'') : this.dataType;
  if (obj.allowableValues) {
    this.valueType = obj.allowableValues.valueType;
    this.values = obj.allowableValues.values;
    if (this.values) {
      this.valuesString = ''\'''' + this.values.join(''\'' or \'''') + ''\'''';
    }
  }
  if (obj[''enum'']) {
    this.valueType = ''string'';
    this.values = obj[''enum''];
    if (this.values) {
      this.valueString = ''\'''' + this.values.join(''\'' or \'''') + ''\'''';
    }
  }
};

SwaggerModelProperty.prototype.getSampleValue = function (modelsToIgnore) {
  var result;
  if ((this.refModel) && (modelsToIgnore.indexOf(this.refModel.name) === -1)) {
    result = this.refModel.createJSONSample(modelsToIgnore);
  } else {
    if (this.isCollection) {
      result = this.toSampleValue(this.refDataType);
    } else {
      result = this.toSampleValue(this.dataType);
    }
  }
  if (this.isCollection) {
    return [result];
  } else {
    return result;
  }
};

SwaggerModelProperty.prototype.toSampleValue = function (value) {
  var result;
  if ((typeof this.defaultValue !== ''undefined'') && this.defaultValue) {
    result = this.defaultValue;
  } else if (value === ''integer'') {
    result = 0;
  } else if (value === ''boolean'') {
    result = false;
  } else if (value === ''double'' || value === ''number'') {
    result = 0.0;
  } else if (value === ''string'') {
    result = '''';
  } else {
    result = value;
  }
  return result;
};

SwaggerModelProperty.prototype.toString = function () {
  var req = this.required ? ''propReq'' : ''propOpt'';
  var str = ''<span class="propName '' + req + ''">'' + this.name + ''</span> (<span class="propType">'' + this.dataTypeWithRef + ''</span>'';
  if (!this.required) {
    str += '', <span class="propOptKey">optional</span>'';
  }
  str += '')'';
  if (this.values) {
    str += '' = <span class="propVals">[\'''' + this.values.join(''\'' or \'''') + ''\'']</span>'';
  }
  if (this.descr) {
    str += '': <span class="propDesc">'' + this.descr + ''</span>'';
  }
  return str;
};

var SwaggerOperation = function (nickname, path, method, parameters, summary, notes, type, responseMessages, resource, consumes, produces, authorizations, deprecated) {
  var _this = this;

  var errors = [];
  this.nickname = (nickname || errors.push(''SwaggerOperations must have a nickname.''));
  this.path = (path || errors.push(''SwaggerOperation '' + nickname + '' is missing path.''));
  this.method = (method || errors.push(''SwaggerOperation '' + nickname + '' is missing method.''));
  this.parameters = parameters ? parameters : [];
  this.summary = summary;
  this.notes = notes;
  this.type = type;
  this.responseMessages = (responseMessages || []);
  this.resource = (resource || errors.push(''Resource is required''));
  this.consumes = consumes;
  this.produces = produces;
  this.authorizations = typeof authorizations !== ''undefined'' ? authorizations : resource.authorizations;
  this.deprecated = deprecated;
  this[''do''] = __bind(this[''do''], this);


  if(typeof this.deprecated === ''string'') {
    switch(this.deprecated.toLowerCase()) {
      case ''true'': case ''yes'': case ''1'': {
        this.deprecated = true;
        break;
      }
      case ''false'': case ''no'': case ''0'': case null: {
        this.deprecated = false;
        break;
      }
      default: this.deprecated = Boolean(this.deprecated);
    }
  }

  if (errors.length > 0) {
    console.error(''SwaggerOperation errors'', errors, arguments);
    this.resource.api.fail(errors);
  }

  this.path = this.path.replace(''{format}'', ''json'');
  this.method = this.method.toLowerCase();
  this.isGetMethod = this.method === ''get'';

  var i, j, v;
  this.resourceName = this.resource.name;
  if (typeof this.type !== ''undefined'' && this.type === ''void'')
    this.type = null;
  else {
    this.responseClassSignature = this.getSignature(this.type, this.resource.models);
    this.responseSampleJSON = this.getSampleJSON(this.type, this.resource.models);
  }

  for (i = 0; i < this.parameters.length; i++) {
    var param = this.parameters[i];
    // might take this away
    param.name = param.name || param.type || param.dataType;
    // for 1.1 compatibility
    type = param.type || param.dataType;
    if (type === ''array'') {
      type = ''array['' + (param.items.$ref ? param.items.$ref : param.items.type) + '']'';
    }
    param.type = type;

    if (type && type.toLowerCase() === ''boolean'') {
      param.allowableValues = {};
      param.allowableValues.values = [''true'', ''false''];
    }
    param.signature = this.getSignature(type, this.resource.models);
    param.sampleJSON = this.getSampleJSON(type, this.resource.models);

    var enumValue = param[''enum''];
    if (typeof enumValue !== ''undefined'') {
      param.isList = true;
      param.allowableValues = {};
      param.allowableValues.descriptiveValues = [];

      for (j = 0; j < enumValue.length; j++) {
        v = enumValue[j];
        if (param.defaultValue) {
          param.allowableValues.descriptiveValues.push({
            value: String(v),
            isDefault: (v === param.defaultValue)
          });
        }
        else {
          param.allowableValues.descriptiveValues.push({
            value: String(v),
            isDefault: false
          });
        }
      }
    }
    else if (param.allowableValues) {
      if (param.allowableValues.valueType === ''RANGE'')
        param.isRange = true;
      else
        param.isList = true;
      if (param.allowableValues) {
        param.allowableValues.descriptiveValues = [];
        if (param.allowableValues.values) {
          for (j = 0; j < param.allowableValues.values.length; j++) {
            v = param.allowableValues.values[j];
            if (param.defaultValue !== null) {
              param.allowableValues.descriptiveValues.push({
                value: String(v),
                isDefault: (v === param.defaultValue)
              });
            }
            else {
              param.allowableValues.descriptiveValues.push({
                value: String(v),
                isDefault: false
              });
            }
          }
        }
      }
    }
    param.defaultValue = applyParameterMacro(this, param);
  }
  var defaultSuccessCallback = this.resource.api.defaultSuccessCallback || null;
  var defaultErrorCallback = this.resource.api.defaultErrorCallback || null;

  this.resource[this.nickname] = function (args, opts, callback, error) {
    var arg1, arg2, arg3, arg4;
    if(typeof args === ''function'') {  // right shift 3
      arg1 = {}; arg2 = {}; arg3 = args; arg4 = opts;
    }
    else if(typeof args === ''object'' && typeof opts === ''function'') { // right shift 2
      arg1 = args; arg2 = {}; arg3 = opts; arg4 = callback;
    }
    else {
      arg1 = args; arg2 = opts; arg3 = callback; arg4 = error;
    }
    return _this[''do''](arg1 || {}, arg2 || {}, arg3 || defaultSuccessCallback, arg4 || defaultErrorCallback);
  };

  this.resource[this.nickname].help = function (dontPrint) {
    return _this.help(dontPrint);
  };
  this.resource[this.nickname].asCurl = function (args) {
    return _this.asCurl(args);
  };
};

SwaggerOperation.prototype.isListType = function (type) {
  if (type && type.indexOf(''['') >= 0) {
    return type.substring(type.indexOf(''['') + 1, type.indexOf('']''));
  } else {
    return void 0;
  }
};

SwaggerOperation.prototype.getSignature = function (type, models) {
  var isPrimitive, listType;
  listType = this.isListType(type);
  isPrimitive = ((typeof listType !== ''undefined'') && models[listType]) || (typeof models[type] !== ''undefined'') ? false : true;
  if (isPrimitive) {
    return type;
  } else {
    if (typeof listType !== ''undefined'') {
      return models[listType].getMockSignature();
    } else {
      return models[type].getMockSignature();
    }
  }
};

SwaggerOperation.prototype.getSampleJSON = function (type, models) {
  var isPrimitive, listType, val;
  listType = this.isListType(type);
  isPrimitive = ((typeof listType !== ''undefined'') && models[listType]) || (typeof models[type] !== ''undefined'') ? false : true;
  val = isPrimitive ? void 0 : (listType ? models[listType].createJSONSample() : models[type].createJSONSample());
  if (val) {
    val = listType ? [val] : val;
    if (typeof val == ''string'')
      return val;
    else if (typeof val === ''object'') {
      var t = val;
      if (val instanceof Array && val.length > 0) {
        t = val[0];
      }
      if (t.nodeName) {
        var xmlString = new XMLSerializer().serializeToString(t);
        return this.formatXml(xmlString);
      }
      else
        return JSON.stringify(val, null, 2);
    }
    else
      return val;
  }
};

SwaggerOperation.prototype[''do''] = function (args, opts, callback, error) {
  var key, param, params, possibleParams = [], req, value;

  if (typeof error !== ''function'') {
    error = function (xhr, textStatus, error) {
      return log(xhr, textStatus, error);
    };
  }

  if (typeof callback !== ''function'') {
    callback = function (response) {
      var content;
      content = null;
      if (response !== null) {
        content = response.data;
      } else {
        content = ''no data'';
      }
      return log(''default callback: '' + content);
    };
  }

  params = {};
  params.headers = [];
  if (args.headers) {
    params.headers = args.headers;
    delete args.headers;
  }
  // allow override from the opts
  if(opts && opts.responseContentType) {
    params.headers[''Content-Type''] = opts.responseContentType;
  }
  if(opts && opts.requestContentType) {
    params.headers.Accept = opts.requestContentType;
  }

  for (var i = 0; i < this.parameters.length; i++) {
    param = this.parameters[i];
    if (param.paramType === ''header'') {
      if (typeof args[param.name] !== ''undefined'')
        params.headers[param.name] = args[param.name];
    }
    else if (param.paramType === ''form'' || param.paramType.toLowerCase() === ''file'')
      possibleParams.push(param);
    else if (param.paramType === ''body'' && param.name !== ''body'' && typeof args[param.name] !== ''undefined'') {
      if (args.body) {
        throw new Error(''Saw two body params in an API listing; expecting a max of one.'');
      }
      args.body = args[param.name];
    }
  }

  if (typeof args.body !== ''undefined'') {
    params.body = args.body;
    delete args.body;
  }

  if (possibleParams) {
    for (key in possibleParams) {
      value = possibleParams[key];
      if (args[value.name]) {
        params[value.name] = args[value.name];
      }
    }
  }

  req = new SwaggerRequest(this.method, this.urlify(args), params, opts, callback, error, this);
  if (opts.mock) {
    return req;
  } else {
    return true;
  }
};

SwaggerOperation.prototype.pathJson = function () {
  return this.path.replace(''{format}'', ''json'');
};

SwaggerOperation.prototype.pathXml = function () {
  return this.path.replace(''{format}'', ''xml'');
};

SwaggerOperation.prototype.encodePathParam = function (pathParam) {
  var encParts, part, parts, _i, _len;
  pathParam = pathParam.toString();
  if (pathParam.indexOf(''/'') === -1) {
    return encodeURIComponent(pathParam);
  } else {
    parts = pathParam.split(''/'');
    encParts = [];
    for (_i = 0, _len = parts.length; _i < _len; _i++) {
      part = parts[_i];
      encParts.push(encodeURIComponent(part));
    }
    return encParts.join(''/'');
  }
};

SwaggerOperation.prototype.urlify = function (args) {
  var i, j, param, url;
  // ensure no double slashing...
  if(this.resource.basePath.length > 1 && this.resource.basePath.slice(-1) === ''/'' && this.pathJson().charAt(0) === ''/'')
    url = this.resource.basePath + this.pathJson().substring(1);
  else
    url = this.resource.basePath + this.pathJson();
  var params = this.parameters;
  for (i = 0; i < params.length; i++) {
    param = params[i];
    if (param.paramType === ''path'') {
      if (typeof args[param.name] !== ''undefined'') {
        // apply path params and remove from args
        var reg = new RegExp(''\\{\\s*?'' + param.name + ''[^\\{\\}\\/]*(?:\\{.*?\\}[^\\{\\}\\/]*)*\\}(?=(\\/?|$))'', ''gi'');
        url = url.replace(reg, this.encodePathParam(args[param.name]));
        delete args[param.name];
      }
      else
        throw '''' + param.name + '' is a required path param.'';
    }
  }

  var queryParams = '''';
  for (i = 0; i < params.length; i++) {
    param = params[i];
    if(param.paramType === ''query'') {
      if (queryParams !== '''')
        queryParams += ''&'';    
      if (Array.isArray(param)) {
        var output = '''';   
        for(j = 0; j < param.length; j++) {    
          if(j > 0)    
            output += '','';   
          output += encodeURIComponent(param[j]);    
        }    
        queryParams += encodeURIComponent(param.name) + ''='' + output;    
      }
      else {
        if (typeof args[param.name] !== ''undefined'') {
          queryParams += encodeURIComponent(param.name) + ''='' + encodeURIComponent(args[param.name]);
        } else {
          if (param.required)
            throw '''' + param.name + '' is a required query param.'';
        }
      }
    }
  }
  if ((queryParams) && queryParams.length > 0)
    url += ''?'' + queryParams;
  return url;
};

SwaggerOperation.prototype.supportHeaderParams = function () {
  return this.resource.api.supportHeaderParams;
};

SwaggerOperation.prototype.supportedSubmitMethods = function () {
  return this.resource.api.supportedSubmitMethods;
};

SwaggerOperation.prototype.getQueryParams = function (args) {
  return this.getMatchingParams([''query''], args);
};

SwaggerOperation.prototype.getHeaderParams = function (args) {
  return this.getMatchingParams([''header''], args);
};

SwaggerOperation.prototype.getMatchingParams = function (paramTypes, args) {
  var matchingParams = {};
  var params = this.parameters;
  for (var i = 0; i < params.length; i++) {
    param = params[i];
    if (args && args[param.name])
      matchingParams[param.name] = args[param.name];
  }
  var headers = this.resource.api.headers;
  var name;
  for (name in headers) {
    var value = headers[name];
    matchingParams[name] = value;
  }
  return matchingParams;
};

SwaggerOperation.prototype.help = function (dontPrint) {
  var msg = this.nickname + '': '' + this.summary;
  var params = this.parameters;
  for (var i = 0; i < params.length; i++) {
    var param = params[i];
    msg += ''\n* '' + param.name + (param.required ? '' (required)'' : '''') + " - " + param.description;
  }
  if(dontPrint)
    return msg;
  else {
    console.log(msg);
    return msg;
  }
};

SwaggerOperation.prototype.asCurl = function (args) {
  var results = [];
  var i;

  var headers = SwaggerRequest.prototype.setHeaders(args, {}, this);    
  for(i = 0; i < this.parameters.length; i++) {
    var param = this.parameters[i];
    if(param.paramType && param.paramType === ''header'' && args[param.name]) {
      headers[param.name] = args[param.name];
    }
  }

  var key;
  for (key in headers) {
    results.push(''--header "'' + key + '': '' + headers[key] + ''"'');
  }
  return ''curl '' + (results.join('' '')) + '' '' + this.urlify(args);
};

SwaggerOperation.prototype.formatXml = function (xml) {
  var contexp, formatted, indent, lastType, lines, ln, pad, reg, transitions, wsexp, _fn, _i, _len;
  reg = /(>)(<)(\/*)/g;
  wsexp = /[ ]*(.*)[ ]+\n/g;
  contexp = /(<.+>)(.+\n)/g;
  xml = xml.replace(reg, ''$1\n$2$3'').replace(wsexp, ''$1\n'').replace(contexp, ''$1\n$2'');
  pad = 0;
  formatted = '''';
  lines = xml.split(''\n'');
  indent = 0;
  lastType = ''other'';
  transitions = {
    ''single->single'': 0,
    ''single->closing'': -1,
    ''single->opening'': 0,
    ''single->other'': 0,
    ''closing->single'': 0,
    ''closing->closing'': -1,
    ''closing->opening'': 0,
    ''closing->other'': 0,
    ''opening->single'': 1,
    ''opening->closing'': 0,
    ''opening->opening'': 1,
    ''opening->other'': 1,
    ''other->single'': 0,
    ''other->closing'': -1,
    ''other->opening'': 0,
    ''other->other'': 0
  };
  _fn = function (ln) {
    var fromTo, j, key, padding, type, types, value;
    types = {
      single: Boolean(ln.match(/<.+\/>/)),
      closing: Boolean(ln.match(/<\/.+>/)),
      opening: Boolean(ln.match(/<[^!?].*>/))
    };
    type = ((function () {
      var _results;
      _results = [];
      for (key in types) {
        value = types[key];
        if (value) {
          _results.push(key);
        }
      }
      return _results;
    })())[0];
    type = type === void 0 ? ''other'' : type;
    fromTo = lastType + ''->'' + type;
    lastType = type;
    padding = '''';
    indent += transitions[fromTo];
    padding = ((function () {
      var _j, _ref5, _results;
      _results = [];
      for (j = _j = 0, _ref5 = indent; 0 <= _ref5 ? _j < _ref5 : _j > _ref5; j = 0 <= _ref5 ? ++_j : --_j) {
        _results.push(''  '');
      }
      return _results;
    })()).join('''');
    if (fromTo === ''opening->closing'') {
      formatted = formatted.substr(0, formatted.length - 1) + ln + ''\n'';
    } else {
      formatted += padding + ln + ''\n'';
    }
  };
  for (_i = 0, _len = lines.length; _i < _len; _i++) {
    ln = lines[_i];
    _fn(ln);
  }
  return formatted;
};

var SwaggerRequest = function (type, url, params, opts, successCallback, errorCallback, operation, execution) {
  var _this = this;
  var errors = [];

  this.useJQuery = (typeof operation.resource.useJQuery !== ''undefined'' ? operation.resource.useJQuery : null);
  this.type = (type || errors.push(''SwaggerRequest type is required (get/post/put/delete/patch/options).''));
  this.url = (url || errors.push(''SwaggerRequest url is required.''));
  this.params = params;
  this.opts = opts;
  this.successCallback = (successCallback || errors.push(''SwaggerRequest successCallback is required.''));
  this.errorCallback = (errorCallback || errors.push(''SwaggerRequest error callback is required.''));
  this.operation = (operation || errors.push(''SwaggerRequest operation is required.''));
  this.execution = execution;
  this.headers = (params.headers || {});

  if (errors.length > 0) {
    throw errors;
  }

  this.type = this.type.toUpperCase();

  // set request, response content type headers
  var headers = this.setHeaders(params, opts, this.operation);
  var body = params.body;

  // encode the body for form submits
  if (headers[''Content-Type'']) {
    var key, value, values = {}, i;
    var operationParams = this.operation.parameters;
    for (i = 0; i < operationParams.length; i++) {
      var param = operationParams[i];
      if (param.paramType === ''form'')
        values[param.name] = param;
    }

    if (headers[''Content-Type''].indexOf(''application/x-www-form-urlencoded'') === 0) {
      var encoded = '''';
      for (key in values) {
        value = this.params[key];
        if (typeof value !== ''undefined'') {
          if (encoded !== '''')
            encoded += ''&'';
          encoded += encodeURIComponent(key) + ''='' + encodeURIComponent(value);
        }
      }
      body = encoded;
    }
    else if (headers[''Content-Type''].indexOf(''multipart/form-data'') === 0) {
      // encode the body for form submits
      var data = '''';
      var boundary = ''----SwaggerFormBoundary'' + Date.now();
      for (key in values) {
        value = this.params[key];
        if (typeof value !== ''undefined'') {
          data += ''--'' + boundary + ''\n'';
          data += ''Content-Disposition: form-data; name="'' + key + ''"'';
          data += ''\n\n'';
          data += value + ''\n'';
        }
      }
      data += ''--'' + boundary + ''--\n'';
      headers[''Content-Type''] = ''multipart/form-data; boundary='' + boundary;
      body = data;
    }
  }

  var obj;
  if (!((this.headers) && (this.headers.mock))) {
    obj = {
      url: this.url,
      method: this.type,
      headers: headers,
      body: body,
      useJQuery: this.useJQuery,
      on: {
        error: function (response) {
          return _this.errorCallback(response, _this.opts.parent);
        },
        redirect: function (response) {
          return _this.successCallback(response, _this.opts.parent);
        },
        307: function (response) {
          return _this.successCallback(response, _this.opts.parent);
        },
        response: function (response) {
          return _this.successCallback(response, _this.opts.parent);
        }
      }
    };

    var status = false;
    if (this.operation.resource && this.operation.resource.api && this.operation.resource.api.clientAuthorizations) {
      // Get the client authorizations from the resource declaration
      status = this.operation.resource.api.clientAuthorizations.apply(obj, this.operation.authorizations);
    } else {
      // Get the client authorization from the default authorization declaration
      var e;
      if (typeof window !== ''undefined'') {
        e = window;
      } else {
        e = exports;
      }
      status = e.authorizations.apply(obj, this.operation.authorizations);
    }

    if (!opts.mock) {
      if (status !== false) {
        new SwaggerHttp().execute(obj);
      } else {
        obj.canceled = true;
      }
    } else {
      return obj;
    }
  }
  return obj;
};

SwaggerRequest.prototype.setHeaders = function (params, opts, operation) {
  // default type
  var accepts = opts.responseContentType || ''application/json'';
  var consumes = opts.requestContentType || ''application/json'';

  var allDefinedParams = operation.parameters;
  var definedFormParams = [];
  var definedFileParams = [];
  var body = params.body;
  var headers = {};

  // get params from the operation and set them in definedFileParams, definedFormParams, headers
  var i;
  for (i = 0; i < allDefinedParams.length; i++) {
    var param = allDefinedParams[i];
    if (param.paramType === ''form'')
      definedFormParams.push(param);
    else if (param.paramType === ''file'')
      definedFileParams.push(param);
    else if (param.paramType === ''header'' && this.params.headers) {
      var key = param.name;
      var headerValue = this.params.headers[param.name];
      if (typeof this.params.headers[param.name] !== ''undefined'')
        headers[key] = headerValue;
    }
  }

  // if there''s a body, need to set the accepts header via requestContentType
  if (body && (this.type === ''POST'' || this.type === ''PUT'' || this.type === ''PATCH'' || this.type === ''DELETE'')) {
    if (this.opts.requestContentType)
      consumes = this.opts.requestContentType;
  } else {
    // if any form params, content type must be set
    if (definedFormParams.length > 0) {
      if (definedFileParams.length > 0)
        consumes = ''multipart/form-data'';
      else
        consumes = ''application/x-www-form-urlencoded'';
    }
    else if (this.type === ''DELETE'')
      body = ''{}'';
    else if (this.type != ''DELETE'')
      consumes = null;
  }

  if (consumes && this.operation.consumes) {
    if (this.operation.consumes.indexOf(consumes) === -1) {
      log(''server doesn\''t consume '' + consumes + '', try '' + JSON.stringify(this.operation.consumes));
    }
  }

  if (this.opts && this.opts.responseContentType) {
    accepts = this.opts.responseContentType;
  } else {
    accepts = ''application/json'';
  }
  if (accepts && operation.produces) {
    if (operation.produces.indexOf(accepts) === -1) {
      log(''server can\''t produce '' + accepts);
    }
  }

  if ((consumes && body !== '''') || (consumes === ''application/x-www-form-urlencoded''))
    headers[''Content-Type''] = consumes;
  if (accepts)
    headers.Accept = accepts;
  return headers;
};

/**
 * SwaggerHttp is a wrapper for executing requests
 */
var SwaggerHttp = function() {};

SwaggerHttp.prototype.execute = function(obj, opts) {
  if(obj && (typeof obj.useJQuery === ''boolean''))
    this.useJQuery = obj.useJQuery;
  else
    this.useJQuery = this.isIE8();

  if(obj && typeof obj.body === ''object'') {
    if(obj.body.type && obj.body.type !== ''formData'')
      obj.body = JSON.stringify(obj.body);
    else {
      obj.contentType = false;
      obj.processData = false;
      // delete obj.cache;
      delete obj.headers[''Content-Type''];
    }
  }

  if(this.useJQuery)
    return new JQueryHttpClient(opts).execute(obj);
  else
    return new ShredHttpClient(opts).execute(obj);
};

SwaggerHttp.prototype.isIE8 = function() {
  var detectedIE = false;
  if (typeof navigator !== ''undefined'' && navigator.userAgent) {
    nav = navigator.userAgent.toLowerCase();
    if (nav.indexOf(''msie'') !== -1) {
      var version = parseInt(nav.split(''msie'')[1]);
      if (version <= 8) {
        detectedIE = true;
      }
    }
  }
  return detectedIE;
};

/*
 * JQueryHttpClient lets a browser take advantage of JQuery''s cross-browser magic.
 * NOTE: when jQuery is available it will export both ''$'' and ''jQuery'' to the global space.
 *       Since we are using closures here we need to alias it for internal use.
 */
var JQueryHttpClient = function(options) {
  "use strict";
  if(!jQuery){
    var jQuery = window.jQuery;
  }
};

JQueryHttpClient.prototype.execute = function(obj) {
  var cb = obj.on;
  var request = obj;

  obj.type = obj.method;
  obj.cache = false;
  delete obj.useJQuery;

  /*
  obj.beforeSend = function(xhr) {
    var key, results;
    if (obj.headers) {
      results = [];
      for (key in obj.headers) {
        if (key.toLowerCase() === "content-type") {
          results.push(obj.contentType = obj.headers[key]);
        } else if (key.toLowerCase() === "accept") {
          results.push(obj.accepts = obj.headers[key]);
        } else {
          results.push(xhr.setRequestHeader(key, obj.headers[key]));
        }
      }
      return results;
    }
  };*/

  obj.data = obj.body;
  delete obj.body;
  obj.complete = function(response, textStatus, opts) {
    var headers = {},
      headerArray = response.getAllResponseHeaders().split("\n");

    for(var i = 0; i < headerArray.length; i++) {
      var toSplit = headerArray[i].trim();
      if(toSplit.length === 0)
        continue;
      var separator = toSplit.indexOf(":");
      if(separator === -1) {
        // Name but no value in the header
        headers[toSplit] = null;
        continue;
      }
      var name = toSplit.substring(0, separator).trim(),
        value = toSplit.substring(separator + 1).trim();
      headers[name] = value;
    }

    var out = {
      url: request.url,
      method: request.method,
      status: response.status,
      statusText: response.statusText,
      data: response.responseText,
      headers: headers
    };

    var contentType = (headers["content-type"]||headers["Content-Type"]||null);
    if(contentType) {
      if(contentType.indexOf("application/json") === 0 || contentType.indexOf("+json") > 0) {
        try {
          out.obj = response.responseJSON || JSON.parse(out.data) || {};
        } catch (ex) {
          // do not set out.obj
          log("unable to parse JSON content");
        }
      }
    }

    if(response.status >= 200 && response.status < 300)
      cb.response(out);
    else if(response.status === 0 || (response.status >= 400 && response.status < 599))
      cb.error(out);
    else
      return cb.response(out);
  };

  jQuery.support.cors = true;
  return jQuery.ajax(obj);
};

/*
 * ShredHttpClient is a light-weight, node or browser HTTP client
 */
var ShredHttpClient = function(opts) {
  this.opts = (opts||{});
  this.isInitialized = false;

  var identity, toString;

  if (typeof window !== ''undefined'') {
    this.Shred = require("./shred");
    this.content = require("./shred/content");
  }
  else
    this.Shred = require("shred");
  this.shred = new this.Shred(opts);
};

ShredHttpClient.prototype.initShred = function () {
  this.isInitialized = true;
  this.registerProcessors(this.shred);
};

ShredHttpClient.prototype.registerProcessors = function(shred) {
  var identity = function(x) {
    return x;
  };
  var toString = function(x) {
    return x.toString();
  };

  if (typeof window !== ''undefined'') {
    this.content.registerProcessor(["application/json; charset=utf-8", "application/json", "json"], {
      parser: identity,
      stringify: toString
    });
  } else {
    this.Shred.registerProcessor(["application/json; charset=utf-8", "application/json", "json"], {
      parser: identity,
      stringify: toString
    });
  }
};

ShredHttpClient.prototype.execute = function(obj) {
  if(!this.isInitialized)
    this.initShred();

  var cb = obj.on, res;
  var transform = function(response) {
    var out = {
      headers: response._headers,
      url: response.request.url,
      method: response.request.method,
      status: response.status,
      data: response.content.data
    };

    var headers = response._headers.normalized || response._headers;
    var contentType = (headers["content-type"]||headers["Content-Type"]||null);

    if(contentType) {
      if(contentType.indexOf("application/json") === 0 || contentType.indexOf("+json") > 0) {
        if(response.content.data && response.content.data !== "")
          try{
            out.obj = JSON.parse(response.content.data);
          }
          catch (e) {
            // unable to parse
          }
        else
          out.obj = {};
      }
    }
    return out;
  };

  // Transform an error into a usable response-like object
  var transformError = function (error) {
    var out = {
      // Default to a status of 0 - The client will treat this as a generic permissions sort of error
      status: 0,
      data: error.message || error
    };

    if (error.code) {
      out.obj = error;

      if (error.code === ''ENOTFOUND'' || error.code === ''ECONNREFUSED'') {
        // We can tell the client that this should be treated as a missing resource and not as a permissions thing
        out.status = 404;
      }
    }
    return out;
  };

  res = {
    error: function (response) {
      if (obj)
        return cb.error(transform(response));
    },
    // Catch the Shred error raised when the request errors as it is made (i.e. No Response is coming)
    request_error: function (err) {
      if (obj)
        return cb.error(transformError(err));
    },
    response: function (response) {
      if (obj) {
        return cb.response(transform(response));
      }
    }
  };
  if (obj) {
    obj.on = res;
  }
  return this.shred.request(obj);
};


var e = (typeof window !== ''undefined'' ? window : exports);

e.authorizations = authorizations = new SwaggerAuthorizations();
e.ApiKeyAuthorization = ApiKeyAuthorization;
e.PasswordAuthorization = PasswordAuthorization;
e.CookieAuthorization = CookieAuthorization;
e.SwaggerClient = SwaggerClient;
e.SwaggerApi = SwaggerClient;
e.Operation = Operation;
e.Model = Model;
e.addModel = addModel;
e.Resolver = Resolver;
})();'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> swaggeroauthJs [
	^ 'var appName;
var popupMask;
var popupDialog;
var clientId;
var realm;
var oauth2KeyName;
var redirect_uri;

function handleLogin() {
  var scopes = [];

  var auths = window.swaggerUi.api.authSchemes || window.swaggerUi.api.securityDefinitions;
  if(auths) {
    var key;
    var defs = auths;
    for(key in defs) {
      var auth = defs[key];
      if(auth.type === ''oauth2'' && auth.scopes) {
        oauth2KeyName = key;
        var scope;
        if(Array.isArray(auth.scopes)) {
          // 1.2 support
          var i;
          for(i = 0; i < auth.scopes.length; i++) {
            scopes.push(auth.scopes[i]);
          }
        }
        else {
          // 2.0 support
          for(scope in auth.scopes) {
            scopes.push({scope: scope, description: auth.scopes[scope]});
          }
        }
      }
    }
  }

  if(window.swaggerUi.api
    && window.swaggerUi.api.info) {
    appName = window.swaggerUi.api.info.title;
  }

  popupDialog = $(
    [
      ''<div class="api-popup-dialog">'',
      ''<div class="api-popup-title">Select OAuth2.0 Scopes</div>'',
      ''<div class="api-popup-content">'',
        ''<p>Scopes are used to grant an application different levels of access to data on behalf of the end user. Each API may declare one or more scopes.'',
          ''<a href="#">Learn how to use</a>'',
        ''</p>'',
        ''<p><strong>'' + appName + ''</strong> API requires the following scopes. Select which ones you want to grant to Swagger UI.</p>'',
        ''<ul class="api-popup-scopes">'',
        ''</ul>'',
        ''<p class="error-msg"></p>'',
        ''<div class="api-popup-actions"><button class="api-popup-authbtn api-button green" type="button">Authorize</button><button class="api-popup-cancel api-button gray" type="button">Cancel</button></div>'',
      ''</div>'',
      ''</div>''].join(''''));
  $(document.body).append(popupDialog);

  popup = popupDialog.find(''ul.api-popup-scopes'').empty();
  for (i = 0; i < scopes.length; i ++) {
    scope = scopes[i];
    str = ''<li><input type="checkbox" id="scope_'' + i + ''" scope="'' + scope.scope + ''"/>'' + ''<label for="scope_'' + i + ''">'' + scope.scope;
    if (scope.description) {
      str += ''<br/><span class="api-scope-desc">'' + scope.description + ''</span>'';
    }
    str += ''</label></li>'';
    popup.append(str);
  }

  var $win = $(window),
    dw = $win.width(),
    dh = $win.height(),
    st = $win.scrollTop(),
    dlgWd = popupDialog.outerWidth(),
    dlgHt = popupDialog.outerHeight(),
    top = (dh -dlgHt)/2 + st,
    left = (dw - dlgWd)/2;

  popupDialog.css({
    top: (top < 0? 0 : top) + ''px'',
    left: (left < 0? 0 : left) + ''px''
  });

  popupDialog.find(''button.api-popup-cancel'').click(function() {
    popupMask.hide();
    popupDialog.hide();
    popupDialog.empty();
    popupDialog = [];
  });

  $(''button.api-popup-authbtn'').unbind();
  popupDialog.find(''button.api-popup-authbtn'').click(function() {
    popupMask.hide();
    popupDialog.hide();

    var authSchemes = window.swaggerUi.api.authSchemes;
    var host = window.location;
    var pathname = location.pathname.substring(0, location.pathname.lastIndexOf("/"));
    var redirectUrl = host.protocol + ''//'' + host.host + pathname + ''/o2c.html'';
    var url = null;

    for (var key in authSchemes) {
      if (authSchemes.hasOwnProperty(key)) {
        var flow = authSchemes[key].flow;
        
        if(authSchemes[key].type === ''oauth2'' && flow && (flow === ''implicit'' || flow === ''accessCode'')) {
          var dets = authSchemes[key];
          url = dets.authorizationUrl + ''?response_type='' + (flow === ''implicit'' ? ''token'' : ''code'');
          window.swaggerUi.tokenName = dets.tokenName || ''access_token'';
          window.swaggerUi.tokenUrl = (flow === ''accessCode'' ? dets.tokenUrl : null);          
        }
        else if(authSchemes[key].grantTypes) {
          // 1.2 support
          var o = authSchemes[key].grantTypes;
          for(var t in o) {
            if(o.hasOwnProperty(t) && t === ''implicit'') {
              var dets = o[t];
              var ep = dets.loginEndpoint.url;
              url = dets.loginEndpoint.url + ''?response_type=token'';
              window.swaggerUi.tokenName = dets.tokenName;
            }
            else if (o.hasOwnProperty(t) && t === ''accessCode'') {
              var dets = o[t];
              var ep = dets.tokenRequestEndpoint.url;
              url = dets.tokenRequestEndpoint.url + ''?response_type=code'';
              window.swaggerUi.tokenName = dets.tokenName;
            }
          }
        }
      }
    }
    var scopes = []
    var o = $(''.api-popup-scopes'').find(''input:checked'');

    for(k =0; k < o.length; k++) {
      var scope = $(o[k]).attr(''scope'');
      
      if (scopes.indexOf(scope) === -1)
        scopes.push(scope);
    }

    window.enabledScopes=scopes;

    redirect_uri = redirectUrl;

    url += ''&redirect_uri='' + encodeURIComponent(redirectUrl);
    url += ''&realm='' + encodeURIComponent(realm);
    url += ''&client_id='' + encodeURIComponent(clientId);
    url += ''&scope='' + encodeURIComponent(scopes);

    window.open(url);
  });

  popupMask.show();
  popupDialog.show();
  return;
}


function handleLogout() {
  for(key in window.authorizations.authz){
    window.authorizations.remove(key)
  }
  window.enabledScopes = null;
  $(''.api-ic.ic-on'').addClass(''ic-off'');
  $(''.api-ic.ic-on'').removeClass(''ic-on'');

  // set the info box
  $(''.api-ic.ic-warning'').addClass(''ic-error'');
  $(''.api-ic.ic-warning'').removeClass(''ic-warning'');
}

function initOAuth(opts) {
  var o = (opts||{});
  var errors = [];

  appName = (o.appName||errors.push(''missing appName''));
  popupMask = (o.popupMask||$(''#api-common-mask''));
  popupDialog = (o.popupDialog||$(''.api-popup-dialog''));
  clientId = (o.clientId||errors.push(''missing client id''));
  realm = (o.realm||errors.push(''missing realm''));

  if(errors.length > 0){
    log(''auth unable initialize oauth: '' + errors);
    return;
  }

  $(''pre code'').each(function(i, e) {hljs.highlightBlock(e)});
  $(''.api-ic'').unbind();
  $(''.api-ic'').click(function(s) {
    if($(s.target).hasClass(''ic-off''))
      handleLogin();
    else {
      handleLogout();
    }
    false;
  });
}

function processOAuthCode(data) {
  var params = {
    ''client_id'': clientId,
    ''code'': data.code,
    ''grant_type'': ''authorization_code'',
    ''redirect_uri'': redirect_uri
  }
  $.ajax(
  {
    url : window.swaggerUi.tokenUrl,
    type: "POST",
    data: params,
    success:function(data, textStatus, jqXHR) 
    {
      onOAuthComplete(data);
    },
    error: function(jqXHR, textStatus, errorThrown) 
    {
      onOAuthComplete("");
    }
  });
}

function onOAuthComplete(token) {
  if(token) {
    if(token.error) {
      var checkbox = $(''input[type=checkbox],.secured'')
      checkbox.each(function(pos){
        checkbox[pos].checked = false;
      });
      alert(token.error);
    }
    else {
      var b = token[window.swaggerUi.tokenName];
      if(b){
        // if all roles are satisfied
        var o = null;
        $.each($(''.auth #api_information_panel''), function(k, v) {
          var children = v;
          if(children && children.childNodes) {
            var requiredScopes = [];
            $.each((children.childNodes), function (k1, v1){
              var inner = v1.innerHTML;
              if(inner)
                requiredScopes.push(inner);
            });
            var diff = [];
            for(var i=0; i < requiredScopes.length; i++) {
              var s = requiredScopes[i];
              if(window.enabledScopes && window.enabledScopes.indexOf(s) == -1) {
                diff.push(s);
              }
            }
            if(diff.length > 0){
              o = v.parentNode;
              $(o.parentNode).find(''.api-ic.ic-on'').addClass(''ic-off'');
              $(o.parentNode).find(''.api-ic.ic-on'').removeClass(''ic-on'');

              // sorry, not all scopes are satisfied
              $(o).find(''.api-ic'').addClass(''ic-warning'');
              $(o).find(''.api-ic'').removeClass(''ic-error'');
            }
            else {
              o = v.parentNode;
              $(o.parentNode).find(''.api-ic.ic-off'').addClass(''ic-on'');
              $(o.parentNode).find(''.api-ic.ic-off'').removeClass(''ic-off'');

              // all scopes are satisfied
              $(o).find(''.api-ic'').addClass(''ic-info'');
              $(o).find(''.api-ic'').removeClass(''ic-warning'');
              $(o).find(''.api-ic'').removeClass(''ic-error'');          
            }
          }
        });
        window.authorizations.add(oauth2KeyName, new ApiKeyAuthorization(''Authorization'', ''Bearer '' + b, ''header''));
      }
    }
  }
}'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> swaggeruiminJs [
	^ 'function clippyCopiedCallback(){$("#api_key_copied").fadeIn().delay(1e3).fadeOut()}$(function(){$.fn.vAlign=function(){return this.each(function(){var e=$(this).height(),t=$(this).parent().height(),n=(t-e)/2;$(this).css("margin-top",n)})},$.fn.stretchFormtasticInputWidthToParent=function(){return this.each(function(){var e=$(this).closest("form").innerWidth(),t=parseInt($(this).closest("form").css("padding-left"),10)+parseInt($(this).closest("form").css("padding-right"),10),n=parseInt($(this).css("padding-left"),10)+parseInt($(this).css("padding-right"),10);$(this).css("width",e-t-n)})},$("form.formtastic li.string input, form.formtastic textarea").stretchFormtasticInputWidthToParent(),$("ul.downplayed li div.content p").vAlign(),$("form.sandbox").submit(function(){var e=!0;return $(this).find("input.required").each(function(){$(this).removeClass("error"),""==$(this).val()&&($(this).addClass("error"),$(this).wiggle(),e=!1)}),e})}),log=function(){log.history=log.history||[],log.history.push(arguments),this.console&&console.log(Array.prototype.slice.call(arguments)[0])},Function.prototype.bind&&console&&"object"==typeof console.log&&["log","info","warn","error","assert","dir","clear","profile","profileEnd"].forEach(function(e){console[e]=this.bind(console[e],console)},Function.prototype.call);var Docs={shebang:function(){var e=$.param.fragment().split("/");switch(e.shift(),e.length){case 1:var t="resource_"+e[0];Docs.expandEndpointListForResource(e[0]),$("#"+t).slideto({highlight:!1});break;case 2:Docs.expandEndpointListForResource(e[0]),$("#"+t).slideto({highlight:!1});var n=e.join("_"),a=n+"_content";Docs.expandOperation($("#"+a)),$("#"+n).slideto({highlight:!1})}},toggleEndpointListForResource:function(e){var t=$("li#resource_"+Docs.escapeResourceName(e)+" ul.endpoints");t.is(":visible")?Docs.collapseEndpointListForResource(e):Docs.expandEndpointListForResource(e)},expandEndpointListForResource:function(e){var e=Docs.escapeResourceName(e);if(""==e)return void $(".resource ul.endpoints").slideDown();$("li#resource_"+e).addClass("active");var t=$("li#resource_"+e+" ul.endpoints");t.slideDown()},collapseEndpointListForResource:function(e){var e=Docs.escapeResourceName(e);if(""==e)return void $(".resource ul.endpoints").slideUp();$("li#resource_"+e).removeClass("active");var t=$("li#resource_"+e+" ul.endpoints");t.slideUp()},expandOperationsForResource:function(e){return Docs.expandEndpointListForResource(e),""==e?void $(".resource ul.endpoints li.operation div.content").slideDown():void $("li#resource_"+Docs.escapeResourceName(e)+" li.operation div.content").each(function(){Docs.expandOperation($(this))})},collapseOperationsForResource:function(e){return Docs.expandEndpointListForResource(e),""==e?void $(".resource ul.endpoints li.operation div.content").slideUp():void $("li#resource_"+Docs.escapeResourceName(e)+" li.operation div.content").each(function(){Docs.collapseOperation($(this))})},escapeResourceName:function(e){return e.replace(/[!"#$%&''()*+,.\/:;<=>?@\[\\\]\^`{|}~]/g,"\\$&")},expandOperation:function(e){e.slideDown()},collapseOperation:function(e){e.slideUp()}};this.Handlebars=this.Handlebars||{},this.Handlebars.templates=this.Handlebars.templates||{},this.Handlebars.templates.apikey_button_view=Handlebars.template({compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"<!--div class=''auth_button'' id=''apikey_button''><img class=''auth_icon'' alt=''apply api key'' src=''images/apikey.jpeg''></div-->\n<div class=''auth_container'' id=''apikey_container''>\n  <div class=''key_input_container''>\n    <div class=''auth_label''>"+l((s=null!=(s=t.keyName||(null!=e?e.keyName:e))?s:r,typeof s===i?s.call(e,{name:"keyName",hash:{},data:a}):s))+''</div>\n    <input placeholder="api_key" class="auth_input" id="input_apiKey_entry" name="apiKey" type="text"/>\n    <div class=\''auth_submit\''><a class=\''auth_submit_button\'' id="apply_api_key" href="#">apply</a></div>\n  </div>\n</div>\n\n''},useData:!0});var SwaggerUi,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;SwaggerUi=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.dom_id="swagger_ui",t.prototype.options=null,t.prototype.api=null,t.prototype.headerView=null,t.prototype.mainView=null,t.prototype.initialize=function(e){return null==e&&(e={}),null!=e.dom_id&&(this.dom_id=e.dom_id,delete e.dom_id),null==e.supportedSubmitMethods&&(e.supportedSubmitMethods=["get","put","post","delete","head","options","patch"]),null==$("#"+this.dom_id)&&$("body").append(''<div id="''+this.dom_id+''"></div>''),this.options=e,this.options.success=function(e){return function(){return e.render()}}(this),this.options.progress=function(e){return function(t){return e.showMessage(t)}}(this),this.options.failure=function(e){return function(t){return e.onLoadFailure(t)}}(this),this.headerView=new HeaderView({el:$("#header")}),this.headerView.on("update-swagger-ui",function(e){return function(t){return e.updateSwaggerUi(t)}}(this))},t.prototype.setOption=function(e,t){return this.options[e]=t},t.prototype.getOption=function(e){return this.options[e]},t.prototype.updateSwaggerUi=function(e){return this.options.url=e.url,this.load()},t.prototype.load=function(){var e,t;return null!=(t=this.mainView)&&t.clear(),e=this.options.url,e&&0!==e.indexOf("http")&&(e=this.buildUrl(window.location.href.toString(),e)),this.options.url=e,this.headerView.update(e),this.api=new SwaggerClient(this.options)},t.prototype.collapseAll=function(){return Docs.collapseEndpointListForResource("")},t.prototype.listAll=function(){return Docs.collapseOperationsForResource("")},t.prototype.expandAll=function(){return Docs.expandOperationsForResource("")},t.prototype.render=function(){switch(this.showMessage("Finished Loading Resource Information. Rendering Swagger UI..."),this.mainView=new MainView({model:this.api,el:$("#"+this.dom_id),swaggerOptions:this.options}).render(),this.showMessage(),this.options.docExpansion){case"full":this.expandAll();break;case"list":this.listAll()}return this.renderGFM(),this.options.onComplete&&this.options.onComplete(this.api,this),setTimeout(function(){return function(){return Docs.shebang()}}(this),100)},t.prototype.buildUrl=function(e,t){var n,a;return 0===t.indexOf("/")?(a=e.split("/"),e=a[0]+"//"+a[2],e+t):(n=e.length,e.indexOf("?")>-1&&(n=Math.min(n,e.indexOf("?"))),e.indexOf("#")>-1&&(n=Math.min(n,e.indexOf("#"))),e=e.substring(0,n),-1!==e.indexOf("/",e.length-1)?e+t:e+"/"+t)},t.prototype.showMessage=function(e){return null==e&&(e=""),$("#message-bar").removeClass("message-fail"),$("#message-bar").addClass("message-success"),$("#message-bar").html(e)},t.prototype.onLoadFailure=function(e){var t;return null==e&&(e=""),$("#message-bar").removeClass("message-success"),$("#message-bar").addClass("message-fail"),t=$("#message-bar").html(e),null!=this.options.onFailure&&this.options.onFailure(e),t},t.prototype.renderGFM=function(e){return null==e&&(e=""),$(".markdown").each(function(){return $(this).html(marked($(this).html()))})},t}(Backbone.Router),window.SwaggerUi=SwaggerUi,this.Handlebars.templates.basic_auth_button_view=Handlebars.template({compiler:[6,">= 2.0.0-beta.1"],main:function(){return''<div class=\''auth_button\'' id=\''basic_auth_button\''><img class=\''auth_icon\'' src=\''images/password.jpeg\''></div>\n<div class=\''auth_container\'' id=\''basic_auth_container\''>\n  <div class=\''key_input_container\''>\n    <div class="auth_label">Username</div>\n    <input placeholder="username" class="auth_input" id="input_username" name="username" type="text"/>\n    <div class="auth_label">Password</div>\n    <input placeholder="password" class="auth_input" id="input_password" name="password" type="password"/>\n    <div class=\''auth_submit\''><a class=\''auth_submit_button\'' id="apply_basic_auth" href="#">apply</a></div>\n  </div>\n</div>\n\n''},useData:!0}),Handlebars.registerHelper("sanitize",function(e){return e=e.replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,""),new Handlebars.SafeString(e)}),this.Handlebars.templates.content_type=Handlebars.template({1:function(e,t,n,a){var s,i="";return s=t.each.call(e,null!=e?e.produces:e,{name:"each",hash:{},fn:this.program(2,a),inverse:this.noop,data:a}),null!=s&&(i+=s),i},2:function(e){var t,n=this.lambda,a=''	<option value="'';return t=n(e,e),null!=t&&(a+=t),a+=''">'',t=n(e,e),null!=t&&(a+=t),a+"</option>\n"},4:function(){return''  <option value="application/json">application/json</option>\n''},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i=''<label for="contentType"></label>\n<select name="contentType">\n'';return s=t["if"].call(e,null!=e?e.produces:e,{name:"if",hash:{},fn:this.program(1,a),inverse:this.program(4,a),data:a}),null!=s&&(i+=s),i+"</select>\n"},useData:!0});var ApiKeyButton,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;ApiKeyButton=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.initialize=function(){},t.prototype.render=function(){var e;return e=this.template(),$(this.el).html(e(this.model)),this},t.prototype.events={"click #apikey_button":"toggleApiKeyContainer","click #apply_api_key":"applyApiKey"},t.prototype.applyApiKey=function(){var e;return window.authorizations.add(this.model.name,new ApiKeyAuthorization(this.model.name,$("#input_apiKey_entry").val(),this.model["in"])),window.swaggerUi.load(),e=$("#apikey_container").show()},t.prototype.toggleApiKeyContainer=function(){var e;return $("#apikey_container").length>0?(e=$("#apikey_container").first(),e.is(":visible")?e.hide():($(".auth_container").hide(),e.show())):void 0},t.prototype.template=function(){return Handlebars.templates.apikey_button_view},t}(Backbone.View),this.Handlebars.templates.main=Handlebars.template({1:function(e,t,n,a){var s,i=this.lambda,r=this.escapeExpression,l=''  <div class="info_title">''+r(i(null!=(s=null!=e?e.info:e)?s.title:s,e))+''</div>\n  <div class="info_description markdown">'';return s=i(null!=(s=null!=e?e.info:e)?s.description:s,e),null!=s&&(l+=s),l+="</div>\n  ",s=t["if"].call(e,null!=(s=null!=e?e.info:e)?s.termsOfServiceUrl:s,{name:"if",hash:{},fn:this.program(2,a),inverse:this.noop,data:a}),null!=s&&(l+=s),l+="\n  ",s=t["if"].call(e,null!=(s=null!=(s=null!=e?e.info:e)?s.contact:s)?s.name:s,{name:"if",hash:{},fn:this.program(4,a),inverse:this.noop,data:a}),null!=s&&(l+=s),l+="\n  ",s=t["if"].call(e,null!=(s=null!=(s=null!=e?e.info:e)?s.contact:s)?s.url:s,{name:"if",hash:{},fn:this.program(6,a),inverse:this.noop,data:a}),null!=s&&(l+=s),l+="\n  ",s=t["if"].call(e,null!=(s=null!=(s=null!=e?e.info:e)?s.contact:s)?s.email:s,{name:"if",hash:{},fn:this.program(8,a),inverse:this.noop,data:a}),null!=s&&(l+=s),l+="\n  ",s=t["if"].call(e,null!=(s=null!=e?e.info:e)?s.license:s,{name:"if",hash:{},fn:this.program(10,a),inverse:this.noop,data:a}),null!=s&&(l+=s),l+"\n"},2:function(e){var t,n=this.lambda,a=this.escapeExpression;return''<div class="info_tos"><a href="''+a(n(null!=(t=null!=e?e.info:e)?t.termsOfServiceUrl:t,e))+''">Terms of service</a></div>''},4:function(e){var t,n=this.lambda,a=this.escapeExpression;return"<div class=''info_name''>Created by "+a(n(null!=(t=null!=(t=null!=e?e.info:e)?t.contact:t)?t.name:t,e))+"</div>"},6:function(e){var t,n=this.lambda,a=this.escapeExpression;return"<div class=''info_url''>See more at <a href=\""+a(n(null!=(t=null!=(t=null!=e?e.info:e)?t.contact:t)?t.url:t,e))+''">''+a(n(null!=(t=null!=(t=null!=e?e.info:e)?t.contact:t)?t.url:t,e))+"</a></div>"},8:function(e){var t,n=this.lambda,a=this.escapeExpression;return"<div class=''info_email''><a href=\"mailto:"+a(n(null!=(t=null!=(t=null!=e?e.info:e)?t.contact:t)?t.email:t,e))+"?subject="+a(n(null!=(t=null!=e?e.info:e)?t.title:t,e))+''">Contact the developer</a></div>''},10:function(e){var t,n=this.lambda,a=this.escapeExpression;return"<div class=''info_license''><a href=''"+a(n(null!=(t=null!=(t=null!=e?e.info:e)?t.license:t)?t.url:t,e))+"''>"+a(n(null!=(t=null!=(t=null!=e?e.info:e)?t.license:t)?t.name:t,e))+"</a></div>"},12:function(e){var t,n=this.lambda,a=this.escapeExpression;return''    , <span style="font-variant: small-caps">api version</span>: ''+a(n(null!=(t=null!=e?e.info:e)?t.version:t,e))+"\n    "},14:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return''    <span style="float:right"><a href="''+l((s=null!=(s=t.validatorUrl||(null!=e?e.validatorUrl:e))?s:r,typeof s===i?s.call(e,{name:"validatorUrl",hash:{},data:a}):s))+"/debug?url="+l((s=null!=(s=t.url||(null!=e?e.url:e))?s:r,typeof s===i?s.call(e,{name:"url",hash:{},data:a}):s))+''"><img id="validator" src="''+l((s=null!=(s=t.validatorUrl||(null!=e?e.validatorUrl:e))?s:r,typeof s===i?s.call(e,{name:"validatorUrl",hash:{},data:a}):s))+"?url="+l((s=null!=(s=t.url||(null!=e?e.url:e))?s:r,typeof s===i?s.call(e,{name:"url",hash:{},data:a}):s))+''"></a>\n    </span>\n''},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r="function",l=t.helperMissing,o=this.escapeExpression,p="<div class=''info'' id=''api_info''>\n";return s=t["if"].call(e,null!=e?e.info:e,{name:"if",hash:{},fn:this.program(1,a),inverse:this.noop,data:a}),null!=s&&(p+=s),p+="</div>\n<div class=''container'' id=''resources_container''>\n  <ul id=''resources''></ul>\n\n  <div class=\"footer\">\n    <br>\n    <br>\n    <h4 style=\"color: #999\">[ <span style=\"font-variant: small-caps\">base url</span>: "+o((i=null!=(i=t.basePath||(null!=e?e.basePath:e))?i:l,typeof i===r?i.call(e,{name:"basePath",hash:{},data:a}):i))+"\n",s=t["if"].call(e,null!=(s=null!=e?e.info:e)?s.version:s,{name:"if",hash:{},fn:this.program(12,a),inverse:this.noop,data:a}),null!=s&&(p+=s),p+="]\n",s=t["if"].call(e,null!=e?e.validatorUrl:e,{name:"if",hash:{},fn:this.program(14,a),inverse:this.noop,data:a}),null!=s&&(p+=s),p+"    </h4>\n    </div>\n</div>\n"},useData:!0});var BasicAuthButton,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;BasicAuthButton=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.initialize=function(){},t.prototype.render=function(){var e;return e=this.template(),$(this.el).html(e(this.model)),this},t.prototype.events={"click #basic_auth_button":"togglePasswordContainer","click #apply_basic_auth":"applyPassword"},t.prototype.applyPassword=function(){var e,t,n;return n=$(".input_username").val(),t=$(".input_password").val(),window.authorizations.add(this.model.type,new PasswordAuthorization("basic",n,t)),window.swaggerUi.load(),e=$("#basic_auth_container").hide()},t.prototype.togglePasswordContainer=function(){var e;return $("#basic_auth_container").length>0?(e=$("#basic_auth_container").show(),e.is(":visible")?e.slideUp():($(".auth_container").hide(),e.show())):void 0},t.prototype.template=function(){return Handlebars.templates.basic_auth_button_view},t}(Backbone.View),this.Handlebars.templates.operation=Handlebars.template({1:function(){return"deprecated"},3:function(){return"            <h4>Warning: Deprecated</h4>\n"},5:function(e,t,n,a){var s,i,r="function",l=t.helperMissing,o=''        <h4>Implementation Notes</h4>\n        <p class="markdown">'';return i=null!=(i=t.description||(null!=e?e.description:e))?i:l,s=typeof i===r?i.call(e,{name:"description",hash:{},data:a}):i,null!=s&&(o+=s),o+"</p>\n"},7:function(){return''        <div class="auth">\n        <span class="api-ic ic-error"></span>''},9:function(e,t,n,a){var s,i=''          <div id="api_information_panel" style="top: 526px; left: 776px; display: none;">\n'';return s=t.each.call(e,e,{name:"each",hash:{},fn:this.program(10,a),inverse:this.noop,data:a}),null!=s&&(i+=s),i+"          </div>\n"},10:function(e){var t,n=this.lambda,a=this.escapeExpression,s="            <div title=''";return t=n(null!=e?e.description:e,e),null!=t&&(s+=t),s+"''>"+a(n(null!=e?e.scope:e,e))+"</div>\n"},12:function(){return"</div>"},14:function(){return''        <div class=\''access\''>\n          <span class="api-ic ic-off" title="click to authenticate"></span>\n        </div>\n''},16:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"          <h4>Response Class (Status "+l((s=null!=(s=t.successCode||(null!=e?e.successCode:e))?s:r,typeof s===i?s.call(e,{name:"successCode",hash:{},data:a}):s))+'')</h4>\n          <p><span class="model-signature" /></p>\n          <br/>\n          <div class="response-content-type" />\n''},18:function(){return''          <h4>Parameters</h4>\n          <table class=\''fullwidth\''>\n          <thead>\n            <tr>\n            <th style="width: 100px; max-width: 100px">Parameter</th>\n            <th style="width: 310px; max-width: 310px">Value</th>\n            <th style="width: 200px; max-width: 200px">Description</th>\n            <th style="width: 100px; max-width: 100px">Parameter Type</th>\n            <th style="width: 220px; max-width: 230px">Data Type</th>\n            </tr>\n          </thead>\n          <tbody class="operation-params">\n\n          </tbody>\n          </table>\n''},20:function(){return"          <div style=''margin:0;padding:0;display:inline''></div>\n          <h4>Response Messages</h4>\n          <table class=''fullwidth''>\n            <thead>\n            <tr>\n              <th>HTTP Status Code</th>\n              <th>Reason</th>\n              <th>Response Model</th>\n            </tr>\n            </thead>\n            <tbody class=\"operation-status\">\n            \n            </tbody>\n          </table>\n"},22:function(){return""},24:function(){return"          <div class=''sandbox_header''>\n            <input class=''submit'' name=''commit'' type=''button'' value=''Try it out!'' />\n            <a href=''#'' class=''response_hider'' style=''display:none''>Hide Response</a>\n            <span class=''response_throbber'' style=''display:none''></span>\n          </div>\n"},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r,l="function",o=t.helperMissing,p=this.escapeExpression,u=t.blockHelperMissing,h="\n  <ul class=''operations'' >\n    <li class=''"+p((i=null!=(i=t.method||(null!=e?e.method:e))?i:o,typeof i===l?i.call(e,{name:"method",hash:{},data:a}):i))+" operation'' id=''"+p((i=null!=(i=t.parentId||(null!=e?e.parentId:e))?i:o,typeof i===l?i.call(e,{name:"parentId",hash:{},data:a}):i))+"_"+p((i=null!=(i=t.nickname||(null!=e?e.nickname:e))?i:o,typeof i===l?i.call(e,{name:"nickname",hash:{},data:a}):i))+"''>\n      <div class=''heading''>\n        <h3>\n          <span class=''http_method''>\n          <a href=''#!/"+p((i=null!=(i=t.parentId||(null!=e?e.parentId:e))?i:o,typeof i===l?i.call(e,{name:"parentId",hash:{},data:a}):i))+"/"+p((i=null!=(i=t.nickname||(null!=e?e.nickname:e))?i:o,typeof i===l?i.call(e,{name:"nickname",hash:{},data:a}):i))+''\'' class="toggleOperation">''+p((i=null!=(i=t.method||(null!=e?e.method:e))?i:o,typeof i===l?i.call(e,{name:"method",hash:{},data:a}):i))+"</a>\n          </span>\n          <span class=''path''>\n          <a href=''#!/"+p((i=null!=(i=t.parentId||(null!=e?e.parentId:e))?i:o,typeof i===l?i.call(e,{name:"parentId",hash:{},data:a}):i))+"/"+p((i=null!=(i=t.nickname||(null!=e?e.nickname:e))?i:o,typeof i===l?i.call(e,{name:"nickname",hash:{},data:a}):i))+"'' class=\"toggleOperation ";return s=t["if"].call(e,null!=e?e.deprecated:e,{name:"if",hash:{},fn:this.program(1,a),inverse:this.noop,data:a}),null!=s&&(h+=s),h+=''">''+p((i=null!=(i=t.path||(null!=e?e.path:e))?i:o,typeof i===l?i.call(e,{name:"path",hash:{},data:a}):i))+"</a>\n          </span>\n        </h3>\n        <ul class=''options''>\n          <li>\n          <a href=''#!/"+p((i=null!=(i=t.parentId||(null!=e?e.parentId:e))?i:o,typeof i===l?i.call(e,{name:"parentId",hash:{},data:a}):i))+"/"+p((i=null!=(i=t.nickname||(null!=e?e.nickname:e))?i:o,typeof i===l?i.call(e,{name:"nickname",hash:{},data:a}):i))+''\'' class="toggleOperation">'',i=null!=(i=t.summary||(null!=e?e.summary:e))?i:o,s=typeof i===l?i.call(e,{name:"summary",hash:{},data:a}):i,null!=s&&(h+=s),h+="</a>\n          </li>\n        </ul>\n      </div>\n      <div class=''content'' id=''"+p((i=null!=(i=t.parentId||(null!=e?e.parentId:e))?i:o,typeof i===l?i.call(e,{name:"parentId",hash:{},data:a}):i))+"_"+p((i=null!=(i=t.nickname||(null!=e?e.nickname:e))?i:o,typeof i===l?i.call(e,{name:"nickname",hash:{},data:a}):i))+"_content'' style=''display:none''>\n",s=t["if"].call(e,null!=e?e.deprecated:e,{name:"if",hash:{},fn:this.program(3,a),inverse:this.noop,data:a}),null!=s&&(h+=s),s=t["if"].call(e,null!=e?e.description:e,{name:"if",hash:{},fn:this.program(5,a),inverse:this.noop,data:a}),null!=s&&(h+=s),i=null!=(i=t.oauth||(null!=e?e.oauth:e))?i:o,r={name:"oauth",hash:{},fn:this.program(7,a),inverse:this.noop,data:a},s=typeof i===l?i.call(e,r):i,t.oauth||(s=u.call(e,s,r)),null!=s&&(h+=s),h+="\n",s=t.each.call(e,null!=e?e.oauth:e,{name:"each",hash:{},fn:this.program(9,a),inverse:this.noop,data:a}),null!=s&&(h+=s),h+="        ",i=null!=(i=t.oauth||(null!=e?e.oauth:e))?i:o,r={name:"oauth",hash:{},fn:this.program(12,a),inverse:this.noop,data:a},s=typeof i===l?i.call(e,r):i,t.oauth||(s=u.call(e,s,r)),null!=s&&(h+=s),h+="\n",i=null!=(i=t.oauth||(null!=e?e.oauth:e))?i:o,r={name:"oauth",hash:{},fn:this.program(14,a),inverse:this.noop,data:a},s=typeof i===l?i.call(e,r):i,t.oauth||(s=u.call(e,s,r)),null!=s&&(h+=s),s=t["if"].call(e,null!=e?e.type:e,{name:"if",hash:{},fn:this.program(16,a),inverse:this.noop,data:a}),null!=s&&(h+=s),h+="        <form accept-charset=''UTF-8'' class=''sandbox''>\n          <div style=''margin:0;padding:0;display:inline''></div>\n",s=t["if"].call(e,null!=e?e.parameters:e,{name:"if",hash:{},fn:this.program(18,a),inverse:this.noop,data:a}),null!=s&&(h+=s),s=t["if"].call(e,null!=e?e.responseMessages:e,{name:"if",hash:{},fn:this.program(20,a),inverse:this.noop,data:a}),null!=s&&(h+=s),s=t["if"].call(e,null!=e?e.isReadOnly:e,{name:"if",hash:{},fn:this.program(22,a),inverse:this.program(24,a),data:a}),null!=s&&(h+=s),h+"        </form>\n        <div class=''response'' style=''display:none''>\n          <h4>Request URL</h4>\n          <div class=''block request_url''></div>\n          <h4>Response Body</h4>\n          <div class=''block response_body''></div>\n          <h4>Response Code</h4>\n          <div class=''block response_code''></div>\n          <h4>Response Headers</h4>\n          <div class=''block response_headers''></div>\n        </div>\n      </div>\n    </li>\n  </ul>\n"},useData:!0});var ContentTypeView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;ContentTypeView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.initialize=function(){},t.prototype.render=function(){var e;return e=this.template(),$(this.el).html(e(this.model)),$("label[for=contentType]",$(this.el)).text("Response Content Type"),this},t.prototype.template=function(){return Handlebars.templates.content_type},t}(Backbone.View),this.Handlebars.templates.param=Handlebars.template({1:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e.isFile:e,{name:"if",hash:{},fn:this.program(2,a),inverse:this.program(4,a),data:a}),null!=s&&(i+=s),i},2:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return''			<input type="file" name=\''''+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+''\''/>\n			<div class="parameter-content-type" />\n''},4:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e["default"]:e,{name:"if",hash:{},fn:this.program(5,a),inverse:this.program(7,a),data:a}),null!=s&&(i+=s),i},5:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"				<textarea class=''body-textarea'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"''>"+l((s=null!=(s=t["default"]||(null!=e?e["default"]:e))?s:r,typeof s===i?s.call(e,{name:"default",hash:{},data:a}):s))+''</textarea>\n        <br />\n        <div class="parameter-content-type" />\n''},7:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"				<textarea class=''body-textarea'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+''\''></textarea>\n				<br />\n				<div class="parameter-content-type" />\n''},9:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e.isFile:e,{name:"if",hash:{},fn:this.program(2,a),inverse:this.program(10,a),data:a}),null!=s&&(i+=s),i},10:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e["default"]:e,{name:"if",hash:{},fn:this.program(11,a),inverse:this.program(13,a),data:a}),null!=s&&(i+=s),i},11:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"				<input class=''parameter'' minlength=''0'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"'' placeholder='''' type=''text'' value=''"+l((s=null!=(s=t["default"]||(null!=e?e["default"]:e))?s:r,typeof s===i?s.call(e,{name:"default",hash:{},data:a}):s))+"''/>\n"},13:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"				<input class=''parameter'' minlength=''0'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"'' placeholder='''' type=''text'' value=''''/>\n"},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r="function",l=t.helperMissing,o=this.escapeExpression,p="<td class=''code''>"+o((i=null!=(i=t.name||(null!=e?e.name:e))?i:l,typeof i===r?i.call(e,{name:"name",hash:{},data:a}):i))+"</td>\n<td>\n\n";return s=t["if"].call(e,null!=e?e.isBody:e,{name:"if",hash:{},fn:this.program(1,a),inverse:this.program(9,a),data:a}),null!=s&&(p+=s),p+=''\n</td>\n<td class="markdown">'',i=null!=(i=t.description||(null!=e?e.description:e))?i:l,s=typeof i===r?i.call(e,{name:"description",hash:{},data:a}):i,null!=s&&(p+=s),p+="</td>\n<td>",i=null!=(i=t.paramType||(null!=e?e.paramType:e))?i:l,s=typeof i===r?i.call(e,{name:"paramType",hash:{},data:a}):i,null!=s&&(p+=s),p+''</td>\n<td>\n	<span class="model-signature"></span>\n</td>\n''},useData:!0});var HeaderView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;HeaderView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.events={"click #show-pet-store-icon":"showPetStore","click #show-wordnik-dev-icon":"showWordnikDev","click #explore":"showCustom","keyup #input_baseUrl":"showCustomOnKeyup","keyup #input_apiKey":"showCustomOnKeyup"},t.prototype.initialize=function(){},t.prototype.showPetStore=function(){return this.trigger("update-swagger-ui",{url:"http://petstore.swagger.wordnik.com/api/api-docs"})},t.prototype.showWordnikDev=function(){return this.trigger("update-swagger-ui",{url:"http://api.wordnik.com/v4/resources.json"})},t.prototype.showCustomOnKeyup=function(e){return 13===e.keyCode?this.showCustom():void 0},t.prototype.showCustom=function(e){return null!=e&&e.preventDefault(),this.trigger("update-swagger-ui",{url:$("#input_baseUrl").val(),apiKey:$("#input_apiKey").val()})},t.prototype.update=function(e,t,n){return null==n&&(n=!1),$("#input_baseUrl").val(e),n?this.trigger("update-swagger-ui",{url:e}):void 0},t}(Backbone.View),this.Handlebars.templates.param_list=Handlebars.template({1:function(){return" multiple=''multiple''"},3:function(){return""},5:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e["default"]:e,{name:"if",hash:{},fn:this.program(3,a),inverse:this.program(6,a),data:a}),null!=s&&(i+=s),i},6:function(e,t,n,a){var s,i=t.helperMissing,r="";return s=(t.isArray||e&&e.isArray||i).call(e,e,{name:"isArray",hash:{},fn:this.program(3,a),inverse:this.program(7,a),data:a}),null!=s&&(r+=s),r},7:function(){return"          <option selected=\"\" value=''''></option>\n"},9:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e.isDefault:e,{name:"if",hash:{},fn:this.program(10,a),inverse:this.program(12,a),data:a}),null!=s&&(i+=s),i},10:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return''        <option selected="" value=\''''+l((s=null!=(s=t.value||(null!=e?e.value:e))?s:r,typeof s===i?s.call(e,{name:"value",hash:{},data:a}):s))+"''>"+l((s=null!=(s=t.value||(null!=e?e.value:e))?s:r,typeof s===i?s.call(e,{name:"value",hash:{},data:a}):s))+" (default)</option>\n"},12:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"        <option value=''"+l((s=null!=(s=t.value||(null!=e?e.value:e))?s:r,typeof s===i?s.call(e,{name:"value",hash:{},data:a}):s))+"''>"+l((s=null!=(s=t.value||(null!=e?e.value:e))?s:r,typeof s===i?s.call(e,{name:"value",hash:{},data:a}):s))+"</option>\n"},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r="function",l=t.helperMissing,o=this.escapeExpression,p="<td class=''code''>"+o((i=null!=(i=t.name||(null!=e?e.name:e))?i:l,typeof i===r?i.call(e,{name:"name",hash:{},data:a}):i))+"</td>\n<td>\n  <select ";return s=(t.isArray||e&&e.isArray||l).call(e,e,{name:"isArray",hash:{},fn:this.program(1,a),inverse:this.noop,data:a}),null!=s&&(p+=s),p+=" class=''parameter'' name=''"+o((i=null!=(i=t.name||(null!=e?e.name:e))?i:l,typeof i===r?i.call(e,{name:"name",hash:{},data:a}):i))+"''>\n",s=t["if"].call(e,null!=e?e.required:e,{name:"if",hash:{},fn:this.program(3,a),inverse:this.program(5,a),data:a}),null!=s&&(p+=s),s=t.each.call(e,null!=(s=null!=e?e.allowableValues:e)?s.descriptiveValues:s,{name:"each",hash:{},fn:this.program(9,a),inverse:this.noop,data:a}),null!=s&&(p+=s),p+=''  </select>\n</td>\n<td class="markdown">'',i=null!=(i=t.description||(null!=e?e.description:e))?i:l,s=typeof i===r?i.call(e,{name:"description",hash:{},data:a}):i,null!=s&&(p+=s),p+="</td>\n<td>",i=null!=(i=t.paramType||(null!=e?e.paramType:e))?i:l,s=typeof i===r?i.call(e,{name:"paramType",hash:{},data:a}):i,null!=s&&(p+=s),p+''</td>\n<td><span class="model-signature"></span></td>''},useData:!0});var MainView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;MainView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}var n;return __extends(t,e),n={alpha:function(e,t){return e.path.localeCompare(t.path)},method:function(e,t){return e.method.localeCompare(t.method)}},t.prototype.initialize=function(e){var t,n,a,s;null==e&&(e={}),this.model.auths=[],s=this.model.securityDefinitions;for(n in s)a=s[n],t={name:n,type:a.type,value:a},this.model.auths.push(t);return"2.0"===this.model.swaggerVersion?this.model.validatorUrl="validatorUrl"in e.swaggerOptions?e.swaggerOptions.validatorUrl:this.model.url.indexOf("localhost")>0?null:"http://online.swagger.io/validator":void 0},t.prototype.render=function(){var e,t,n,a,s,i,r,l,o,p;if(this.model.securityDefinitions)for(s in this.model.securityDefinitions)e=this.model.securityDefinitions[s],"apiKey"===e.type&&0===$("#apikey_button").length&&(t=new ApiKeyButton({model:e}).render().el,$(".auth_main_container").append(t)),"basicAuth"===e.type&&0===$("#basic_auth_button").length&&(t=new BasicAuthButton({model:e}).render().el,$(".auth_main_container").append(t));for($(this.el).html(Handlebars.templates.main(this.model)),r={},n=0,p=this.model.apisArray,l=0,o=p.length;o>l;l++){for(i=p[l],a=i.name;"undefined"!=typeof r[a];)a=a+"_"+n,n+=1;
i.id=a,r[a]=i,this.addResource(i,this.model.auths)}return $(".propWrap").hover(function(){return $(".optionsWrapper",$(this)).show()},function(){return $(".optionsWrapper",$(this)).hide()}),this},t.prototype.addResource=function(e,t){var n;return e.id=e.id.replace(/\s/g,"_"),n=new ResourceView({model:e,tagName:"li",id:"resource_"+e.id,className:"resource",auths:t,swaggerOptions:this.options.swaggerOptions}),$("#resources").append(n.render().el)},t.prototype.clear=function(){return $(this.el).html("")},t}(Backbone.View),this.Handlebars.templates.param_readonly=Handlebars.template({1:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"        <textarea class=''body-textarea'' readonly=''readonly'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"''>"+l((s=null!=(s=t["default"]||(null!=e?e["default"]:e))?s:r,typeof s===i?s.call(e,{name:"default",hash:{},data:a}):s))+"</textarea>\n"},3:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e["default"]:e,{name:"if",hash:{},fn:this.program(4,a),inverse:this.program(6,a),data:a}),null!=s&&(i+=s),i},4:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"            "+l((s=null!=(s=t["default"]||(null!=e?e["default"]:e))?s:r,typeof s===i?s.call(e,{name:"default",hash:{},data:a}):s))+"\n"},6:function(){return"            (empty)\n"},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r="function",l=t.helperMissing,o=this.escapeExpression,p="<td class=''code''>"+o((i=null!=(i=t.name||(null!=e?e.name:e))?i:l,typeof i===r?i.call(e,{name:"name",hash:{},data:a}):i))+"</td>\n<td>\n";return s=t["if"].call(e,null!=e?e.isBody:e,{name:"if",hash:{},fn:this.program(1,a),inverse:this.program(3,a),data:a}),null!=s&&(p+=s),p+=''</td>\n<td class="markdown">'',i=null!=(i=t.description||(null!=e?e.description:e))?i:l,s=typeof i===r?i.call(e,{name:"description",hash:{},data:a}):i,null!=s&&(p+=s),p+="</td>\n<td>",i=null!=(i=t.paramType||(null!=e?e.paramType:e))?i:l,s=typeof i===r?i.call(e,{name:"paramType",hash:{},data:a}):i,null!=s&&(p+=s),p+''</td>\n<td><span class="model-signature"></span></td>\n''},useData:!0}),this.Handlebars.templates.param_readonly_required=Handlebars.template({1:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"        <textarea class=''body-textarea''  readonly=''readonly'' placeholder=''(required)'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"''>"+l((s=null!=(s=t["default"]||(null!=e?e["default"]:e))?s:r,typeof s===i?s.call(e,{name:"default",hash:{},data:a}):s))+"</textarea>\n"},3:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e["default"]:e,{name:"if",hash:{},fn:this.program(4,a),inverse:this.program(6,a),data:a}),null!=s&&(i+=s),i},4:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"            "+l((s=null!=(s=t["default"]||(null!=e?e["default"]:e))?s:r,typeof s===i?s.call(e,{name:"default",hash:{},data:a}):s))+"\n"},6:function(){return"            (empty)\n"},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r="function",l=t.helperMissing,o=this.escapeExpression,p="<td class=''code required''>"+o((i=null!=(i=t.name||(null!=e?e.name:e))?i:l,typeof i===r?i.call(e,{name:"name",hash:{},data:a}):i))+"</td>\n<td>\n";return s=t["if"].call(e,null!=e?e.isBody:e,{name:"if",hash:{},fn:this.program(1,a),inverse:this.program(3,a),data:a}),null!=s&&(p+=s),p+=''</td>\n<td class="markdown">'',i=null!=(i=t.description||(null!=e?e.description:e))?i:l,s=typeof i===r?i.call(e,{name:"description",hash:{},data:a}):i,null!=s&&(p+=s),p+="</td>\n<td>",i=null!=(i=t.paramType||(null!=e?e.paramType:e))?i:l,s=typeof i===r?i.call(e,{name:"paramType",hash:{},data:a}):i,null!=s&&(p+=s),p+''</td>\n<td><span class="model-signature"></span></td>\n''},useData:!0});var OperationView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;OperationView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.invocationUrl=null,t.prototype.events={"submit .sandbox":"submitOperation","click .submit":"submitOperation","click .response_hider":"hideResponse","click .toggleOperation":"toggleOperationContent","mouseenter .api-ic":"mouseEnter","mouseout .api-ic":"mouseExit"},t.prototype.initialize=function(e){return null==e&&(e={}),this.auths=e.auths,this.parentId=this.model.parentId,this.nickname=this.model.nickname,this},t.prototype.mouseEnter=function(e){var t,n,a,s,i,r,l,o,p,u;return t=$(this.el).find(".content"),p=e.pageX,u=e.pageY,r=$(window).scrollLeft(),l=$(window).scrollTop(),s=r+$(window).width(),i=l+$(window).height(),o=t.width(),n=t.height(),p+o>s&&(p=s-o),r>p&&(p=r),u+n>i&&(u=i-n),l>u&&(u=l),a={},a.top=u,a.left=p,t.css(a),$(e.currentTarget.parentNode).find("#api_information_panel").show()},t.prototype.mouseExit=function(e){return $(e.currentTarget.parentNode).find("#api_information_panel").hide()},t.prototype.render=function(){var e,t,n,a,s,i,r,l,o,p,u,h,c,d,m,f,y,g,v,_,w,b,x,k,O,C,S,P,T,D,H,M,E,R,V,N,U,A;if(i=jQuery.inArray(this.model.method,this.model.supportedSubmitMethods())>=0,i||(this.model.isReadOnly=!0),this.model.description=this.model.description||this.model.notes,this.model.description&&(this.model.description=this.model.description.replace(/(?:\r\n|\r|\n)/g,"<br />")),this.model.oauth=null,o=this.model.authorizations||this.model.security)if(Array.isArray(o))for(k=0,P=o.length;P>k;k++){n=o[k];for(l in n){t=n[l];for(e in this.auths)if(t=this.auths[e],"oauth2"===t.type){this.model.oauth={},this.model.oauth.scopes=[],R=t.value.scopes;for(r in R)b=R[r],y=n[l].indexOf(r),y>=0&&(p={scope:r,description:b},this.model.oauth.scopes.push(p))}}}else for(r in o)if(b=o[r],"oauth2"===r)for(null===this.model.oauth&&(this.model.oauth={}),void 0===this.model.oauth.scopes&&(this.model.oauth.scopes=[]),O=0,T=b.length;T>O;O++)p=b[O],this.model.oauth.scopes.push(p);if("undefined"!=typeof this.model.responses){this.model.responseMessages=[],V=this.model.responses;for(a in V)x=V[a],m=null,f=this.model.responses[a].schema,f&&f.$ref&&(m=f.$ref,0===m.indexOf("#/definitions/")&&(m=m.substring("#/definitions/".length))),this.model.responseMessages.push({code:a,message:x.description,responseModel:m})}if("undefined"==typeof this.model.responseMessages&&(this.model.responseMessages=[]),g=null,this.model.successResponse){_=this.model.successResponse;for(l in _)x=_[l],this.model.successCode=l,"object"==typeof x&&"function"==typeof x.createJSONSample&&(g={sampleJSON:JSON.stringify(x.createJSONSample(),void 0,2),isParam:!1,signature:x.getMockSignature()})}else this.model.responseClassSignature&&"string"!==this.model.responseClassSignature&&(g={sampleJSON:this.model.responseSampleJSON,isParam:!1,signature:this.model.responseClassSignature});for($(this.el).html(Handlebars.templates.operation(this.model)),g?(d=new SignatureView({model:g,tagName:"div"}),$(".model-signature",$(this.el)).append(d.render().el)):(this.model.responseClassSignature="string",$(".model-signature",$(this.el)).html(this.model.type)),s={isParam:!1},s.consumes=this.model.consumes,s.produces=this.model.produces,N=this.model.parameters,C=0,D=N.length;D>C;C++)u=N[C],w=u.type||u.dataType||"","undefined"==typeof w&&(m=u.schema,m&&m.$ref&&(h=m.$ref,w=0===h.indexOf("#/definitions/")?h.substring("#/definitions/".length):h)),w&&"file"===w.toLowerCase()&&(s.consumes||(s.consumes="multipart/form-data")),u.type=w;for(c=new ResponseContentTypeView({model:s}),$(".response-content-type",$(this.el)).append(c.render().el),U=this.model.parameters,S=0,H=U.length;H>S;S++)u=U[S],this.addParameter(u,s.consumes);for(A=this.model.responseMessages,E=0,M=A.length;M>E;E++)v=A[E],this.addStatusCode(v);return this},t.prototype.addParameter=function(e,t){var n;return e.consumes=t,n=new ParameterView({model:e,tagName:"tr",readOnly:this.model.isReadOnly}),$(".operation-params",$(this.el)).append(n.render().el)},t.prototype.addStatusCode=function(e){var t;return t=new StatusCodeView({model:e,tagName:"tr"}),$(".operation-status",$(this.el)).append(t.render().el)},t.prototype.submitOperation=function(e){var t,n,a,s,i,r,l,o,p,u,h,c,d,m,f,y;if(null!=e&&e.preventDefault(),n=$(".sandbox",$(this.el)),t=!0,n.find("input.required").each(function(){return $(this).removeClass("error"),""===jQuery.trim($(this).val())?($(this).addClass("error"),$(this).wiggle({callback:function(e){return function(){return $(e).focus()}}(this)}),t=!1):void 0}),n.find("textarea.required").each(function(){return $(this).removeClass("error"),""===jQuery.trim($(this).val())?($(this).addClass("error"),$(this).wiggle({callback:function(e){return function(){return $(e).focus()}}(this)}),t=!1):void 0}),t){for(s={},r={parent:this},a=!1,m=n.find("input"),o=0,h=m.length;h>o;o++)i=m[o],null!=i.value&&jQuery.trim(i.value).length>0&&(s[i.name]=i.value),"file"===i.type&&(s[i.name]=i.files[0],a=!0);for(f=n.find("textarea"),p=0,c=f.length;c>p;p++)i=f[p],null!=i.value&&jQuery.trim(i.value).length>0&&(s[i.name]=i.value);for(y=n.find("select"),u=0,d=y.length;d>u;u++)i=y[u],l=this.getSelectedValue(i),null!=l&&jQuery.trim(l).length>0&&(s[i.name]=l);return r.responseContentType=$("div select[name=responseContentType]",$(this.el)).val(),r.requestContentType=$("div select[name=parameterContentType]",$(this.el)).val(),$(".response_throbber",$(this.el)).show(),a?this.handleFileUpload(s,n):this.model["do"](s,r,this.showCompleteStatus,this.showErrorStatus,this)}},t.prototype.success=function(e,t){return t.showCompleteStatus(e)},t.prototype.handleFileUpload=function(e,t){var n,a,s,i,r,l,o,p,u,h,c,d,m,f,y,g,v,_,w;for(g=t.serializeArray(),p=0,d=g.length;d>p;p++)i=g[p],null!=i.value&&jQuery.trim(i.value).length>0&&(e[i.name]=i.value);for(n=new FormData,o=0,v=this.model.parameters,u=0,m=v.length;m>u;u++)l=v[u],("form"===l.paramType||"formData"===l["in"])&&"file"!==l.type.toLowerCase()&&void 0!==e[l.name]&&n.append(l.name,e[l.name]);for(s={},_=this.model.parameters,h=0,f=_.length;f>h;h++)l=_[h],"header"===l.paramType&&(s[l.name]=e[l.name]);for(w=t.find(''input[type~="file"]''),c=0,y=w.length;y>c;c++)a=w[c],"undefined"!=typeof a.files[0]&&(n.append($(a).attr("name"),a.files[0]),o+=1);return this.invocationUrl=this.model.supportHeaderParams()?(s=this.model.getHeaderParams(e),delete s["Content-Type"],this.model.urlify(e,!1)):this.model.urlify(e,!0),$(".request_url",$(this.el)).html("<pre></pre>"),$(".request_url pre",$(this.el)).text(this.invocationUrl),r={type:this.model.method,url:this.invocationUrl,headers:s,data:n,dataType:"json",contentType:!1,processData:!1,error:function(e){return function(t){return e.showErrorStatus(e.wrap(t),e)}}(this),success:function(e){return function(t){return e.showResponse(t,e)}}(this),complete:function(e){return function(t){return e.showCompleteStatus(e.wrap(t),e)}}(this)},window.authorizations&&window.authorizations.apply(r),0===o&&r.data.append("fake","true"),jQuery.ajax(r),!1},t.prototype.wrap=function(e){var t,n,a,s,i,r,l;for(a={},n=e.getAllResponseHeaders().split("\r"),r=0,l=n.length;l>r;r++)s=n[r],t=s.match(/^([^:]*?):(.*)$/),t||(t=[]),t.shift(),void 0!==t[0]&&void 0!==t[1]&&(a[t[0].trim()]=t[1].trim());return i={},i.content={},i.content.data=e.responseText,i.headers=a,i.request={},i.request.url=this.invocationUrl,i.status=e.status,i},t.prototype.getSelectedValue=function(e){var t,n,a,s,i;if(e.multiple){for(n=[],i=e.options,a=0,s=i.length;s>a;a++)t=i[a],t.selected&&n.push(t.value);return n.length>0?n:null}return e.value},t.prototype.hideResponse=function(e){return null!=e&&e.preventDefault(),$(".response",$(this.el)).slideUp(),$(".response_hider",$(this.el)).fadeOut()},t.prototype.showResponse=function(e){var t;return t=JSON.stringify(e,null,"	").replace(/\n/g,"<br>"),$(".response_body",$(this.el)).html(escape(t))},t.prototype.showErrorStatus=function(e,t){return t.showStatus(e)},t.prototype.showCompleteStatus=function(e,t){return t.showStatus(e)},t.prototype.formatXml=function(e){var t,n,a,s,i,r,l,o,p,u,h,c,d;for(o=/(>)(<)(\/*)/g,u=/[ ]*(.*)[ ]+\n/g,t=/(<.+>)(.+\n)/g,e=e.replace(o,"$1\n$2$3").replace(u,"$1\n").replace(t,"$1\n$2"),l=0,n="",i=e.split("\n"),a=0,s="other",p={"single->single":0,"single->closing":-1,"single->opening":0,"single->other":0,"closing->single":0,"closing->closing":-1,"closing->opening":0,"closing->other":0,"opening->single":1,"opening->closing":0,"opening->opening":1,"opening->other":1,"other->single":0,"other->closing":-1,"other->opening":0,"other->other":0},h=function(e){var t,i,r,l,o,u,h;return u={single:Boolean(e.match(/<.+\/>/)),closing:Boolean(e.match(/<\/.+>/)),opening:Boolean(e.match(/<[^!?].*>/))},o=function(){var e;e=[];for(r in u)h=u[r],h&&e.push(r);return e}()[0],o=void 0===o?"other":o,t=s+"->"+o,s=o,l="",a+=p[t],l=function(){var e,t,n;for(n=[],i=e=0,t=a;t>=0?t>e:e>t;i=t>=0?++e:--e)n.push("  ");return n}().join(""),"opening->closing"===t?n=n.substr(0,n.length-1)+e+"\n":n+=l+e+"\n"},c=0,d=i.length;d>c;c++)r=i[c],h(r);return n},t.prototype.showStatus=function(e){var t,n,a,s,i,r,l,o,p,u,h;if(void 0===e.content?(n=e.data,h=e.url):(n=e.content.data,h=e.request.url),i=e.headers,a=null,i&&(a=i["Content-Type"]||i["content-type"],a&&(a=a.split(";")[0].trim())),$(".response_body",$(this.el)).removeClass("json"),$(".response_body",$(this.el)).removeClass("xml"),n)if("application/json"===a||/\+json$/.test(a)){r=null;try{r=JSON.stringify(JSON.parse(n),null,"  ")}catch(c){s=c,r="can''t parse JSON.  Raw result:\n\n"+n}t=$("<code />").text(r),o=$(''<pre class="json" />'').append(t)}else"application/xml"===a||/\+xml$/.test(a)?(t=$("<code />").text(this.formatXml(n)),o=$(''<pre class="xml" />'').append(t)):"text/html"===a?(t=$("<code />").html(_.escape(n)),o=$(''<pre class="xml" />'').append(t)):/^image\//.test(a)?o=$("<img>").attr("src",h):(t=$("<code />").text(n),o=$(''<pre class="json" />'').append(t));else t=$("<code />").text("no content"),o=$(''<pre class="json" />'').append(t);return p=o,$(".request_url",$(this.el)).html("<pre></pre>"),$(".request_url pre",$(this.el)).text(h),$(".response_code",$(this.el)).html("<pre>"+e.status+"</pre>"),$(".response_body",$(this.el)).html(p),$(".response_headers",$(this.el)).html("<pre>"+_.escape(JSON.stringify(e.headers,null,"  ")).replace(/\n/g,"<br>")+"</pre>"),$(".response",$(this.el)).slideDown(),$(".response_hider",$(this.el)).show(),$(".response_throbber",$(this.el)).hide(),u=$(".response_body",$(this.el))[0],l=this.options.swaggerOptions,l.highlightSizeThreshold&&e.data.length>l.highlightSizeThreshold?u:hljs.highlightBlock(u)},t.prototype.toggleOperationContent=function(){var e;return e=$("#"+Docs.escapeResourceName(this.parentId+"_"+this.nickname+"_content")),e.is(":visible")?Docs.collapseOperation(e):Docs.expandOperation(e)},t}(Backbone.View);var ParameterContentTypeView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;ParameterContentTypeView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.initialize=function(){},t.prototype.render=function(){var e;return e=this.template(),$(this.el).html(e(this.model)),$("label[for=parameterContentType]",$(this.el)).text("Parameter content type:"),this},t.prototype.template=function(){return Handlebars.templates.parameter_content_type},t}(Backbone.View),this.Handlebars.templates.param_required=Handlebars.template({1:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e.isFile:e,{name:"if",hash:{},fn:this.program(2,a),inverse:this.program(4,a),data:a}),null!=s&&(i+=s),i},2:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return''			<input type="file" name=\''''+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"''/>\n"},4:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e["default"]:e,{name:"if",hash:{},fn:this.program(5,a),inverse:this.program(7,a),data:a}),null!=s&&(i+=s),i},5:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"				<textarea class=''body-textarea required'' placeholder=''(required)'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"''>"+l((s=null!=(s=t["default"]||(null!=e?e["default"]:e))?s:r,typeof s===i?s.call(e,{name:"default",hash:{},data:a}):s))+''</textarea>\n        <br />\n        <div class="parameter-content-type" />\n''},7:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"				<textarea class=''body-textarea required'' placeholder=''(required)'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+''\''></textarea>\n				<br />\n				<div class="parameter-content-type" />\n''},9:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e.isFile:e,{name:"if",hash:{},fn:this.program(10,a),inverse:this.program(12,a),data:a}),null!=s&&(i+=s),i},10:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"			<input class=''parameter'' class=''required'' type=''file'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"''/>\n"},12:function(e,t,n,a){var s,i="";return s=t["if"].call(e,null!=e?e["default"]:e,{name:"if",hash:{},fn:this.program(13,a),inverse:this.program(15,a),data:a}),null!=s&&(i+=s),i},13:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"				<input class=''parameter required'' minlength=''1'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"'' placeholder=''(required)'' type=''text'' value=''"+l((s=null!=(s=t["default"]||(null!=e?e["default"]:e))?s:r,typeof s===i?s.call(e,{name:"default",hash:{},data:a}):s))+"''/>\n"},15:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"				<input class=''parameter required'' minlength=''1'' name=''"+l((s=null!=(s=t.name||(null!=e?e.name:e))?s:r,typeof s===i?s.call(e,{name:"name",hash:{},data:a}):s))+"'' placeholder=''(required)'' type=''text'' value=''''/>\n"},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r="function",l=t.helperMissing,o=this.escapeExpression,p="<td class=''code required''>"+o((i=null!=(i=t.name||(null!=e?e.name:e))?i:l,typeof i===r?i.call(e,{name:"name",hash:{},data:a}):i))+"</td>\n<td>\n";return s=t["if"].call(e,null!=e?e.isBody:e,{name:"if",hash:{},fn:this.program(1,a),inverse:this.program(9,a),data:a}),null!=s&&(p+=s),p+=''</td>\n<td>\n	<strong><span class="markdown">'',i=null!=(i=t.description||(null!=e?e.description:e))?i:l,s=typeof i===r?i.call(e,{name:"description",hash:{},data:a}):i,null!=s&&(p+=s),p+="</span></strong>\n</td>\n<td>",i=null!=(i=t.paramType||(null!=e?e.paramType:e))?i:l,s=typeof i===r?i.call(e,{name:"paramType",hash:{},data:a}):i,null!=s&&(p+=s),p+''</td>\n<td><span class="model-signature"></span></td>\n''},useData:!0}),this.Handlebars.templates.parameter_content_type=Handlebars.template({1:function(e,t,n,a){var s,i="";return s=t.each.call(e,null!=e?e.consumes:e,{name:"each",hash:{},fn:this.program(2,a),inverse:this.noop,data:a}),null!=s&&(i+=s),i},2:function(e){var t,n=this.lambda,a=''  <option value="'';return t=n(e,e),null!=t&&(a+=t),a+=''">'',t=n(e,e),null!=t&&(a+=t),a+"</option>\n"},4:function(){return''  <option value="application/json">application/json</option>\n''},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i=''<label for="parameterContentType"></label>\n<select name="parameterContentType">\n'';return s=t["if"].call(e,null!=e?e.consumes:e,{name:"if",hash:{},fn:this.program(1,a),inverse:this.program(4,a),data:a}),null!=s&&(i+=s),i+"</select>\n"},useData:!0});var ParameterView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;ParameterView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.initialize=function(){return Handlebars.registerHelper("isArray",function(e,t){return"array"===e.type.toLowerCase()||e.allowMultiple?t.fn(this):t.inverse(this)})},t.prototype.render=function(){var e,t,n,a,s,i,r,l,o,p;return p=this.model.type||this.model.dataType,"undefined"==typeof p&&(i=this.model.schema,i&&i.$ref&&(a=i.$ref,p=0===a.indexOf("#/definitions/")?a.substring("#/definitions/".length):a)),this.model.type=p,this.model.paramType=this.model["in"]||this.model.paramType,("body"===this.model.paramType||"body"===this.model["in"])&&(this.model.isBody=!0),p&&"file"===p.toLowerCase()&&(this.model.isFile=!0),this.model["default"]=this.model["default"]||this.model.defaultValue,this.model.allowableValues&&(this.model.isList=!0),o=this.template(),$(this.el).html(o(this.model)),r={sampleJSON:this.model.sampleJSON,isParam:!0,signature:this.model.signature},this.model.sampleJSON?(l=new SignatureView({model:r,tagName:"div"}),$(".model-signature",$(this.el)).append(l.render().el)):$(".model-signature",$(this.el)).html(this.model.signature),t=!1,this.model.isBody&&(t=!0),e={isParam:t},e.consumes=this.model.consumes,t?(n=new ParameterContentTypeView({model:e}),$(".parameter-content-type",$(this.el)).append(n.render().el)):(s=new ResponseContentTypeView({model:e}),$(".response-content-type",$(this.el)).append(s.render().el)),this},t.prototype.template=function(){return this.model.isList?Handlebars.templates.param_list:this.options.readOnly?this.model.required?Handlebars.templates.param_readonly_required:Handlebars.templates.param_readonly:this.model.required?Handlebars.templates.param_required:Handlebars.templates.param},t}(Backbone.View);var ResourceView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;ResourceView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.initialize=function(e){return null==e&&(e={}),this.auths=e.auths,""===this.model.description&&(this.model.description=null),null!=this.model.description?this.model.summary=this.model.description:void 0},t.prototype.render=function(){var e,t,n,a,s,i,r;for(n={},$(this.el).html(Handlebars.templates.resource(this.model)),r=this.model.operationsArray,s=0,i=r.length;i>s;s++){for(a=r[s],e=0,t=a.nickname;"undefined"!=typeof n[t];)t=t+"_"+e,e+=1;n[t]=a,a.nickname=t,a.parentId=this.model.id,this.addOperation(a)}return $(".toggleEndpointList",this.el).click(this.callDocs.bind(this,"toggleEndpointListForResource")),$(".collapseResource",this.el).click(this.callDocs.bind(this,"collapseOperationsForResource")),$(".expandResource",this.el).click(this.callDocs.bind(this,"expandOperationsForResource")),this},t.prototype.addOperation=function(e){var t;return e.number=this.number,t=new OperationView({model:e,tagName:"li",className:"endpoint",swaggerOptions:this.options.swaggerOptions,auths:this.auths}),$(".endpoints",$(this.el)).append(t.render().el),this.number++},t.prototype.callDocs=function(e,t){return t.preventDefault(),Docs[e](t.currentTarget.getAttribute("data-id"))},t}(Backbone.View),this.Handlebars.templates.resource=Handlebars.template({1:function(){return" : "},3:function(e,t,n,a){var s,i="function",r=t.helperMissing,l=this.escapeExpression;return"<li>\n      <a href=''"+l((s=null!=(s=t.url||(null!=e?e.url:e))?s:r,typeof s===i?s.call(e,{name:"url",hash:{},data:a}):s))+"''>Raw</a>\n    </li>"},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r,l="function",o=t.helperMissing,p=this.escapeExpression,u=t.blockHelperMissing,h="<div class=''heading''>\n  <h2>\n    <a href=''#!/"+p((i=null!=(i=t.id||(null!=e?e.id:e))?i:o,typeof i===l?i.call(e,{name:"id",hash:{},data:a}):i))+''\'' class="toggleEndpointList" data-id="''+p((i=null!=(i=t.id||(null!=e?e.id:e))?i:o,typeof i===l?i.call(e,{name:"id",hash:{},data:a}):i))+''">''+p((i=null!=(i=t.name||(null!=e?e.name:e))?i:o,typeof i===l?i.call(e,{name:"name",hash:{},data:a}):i))+"</a> ";return i=null!=(i=t.summary||(null!=e?e.summary:e))?i:o,r={name:"summary",hash:{},fn:this.program(1,a),inverse:this.noop,data:a},s=typeof i===l?i.call(e,r):i,t.summary||(s=u.call(e,s,r)),null!=s&&(h+=s),i=null!=(i=t.summary||(null!=e?e.summary:e))?i:o,s=typeof i===l?i.call(e,{name:"summary",hash:{},data:a}):i,null!=s&&(h+=s),h+="\n  </h2>\n  <ul class=''options''>\n    <li>\n      <a href=''#!/"+p((i=null!=(i=t.id||(null!=e?e.id:e))?i:o,typeof i===l?i.call(e,{name:"id",hash:{},data:a}):i))+"'' id=''endpointListTogger_"+p((i=null!=(i=t.id||(null!=e?e.id:e))?i:o,typeof i===l?i.call(e,{name:"id",hash:{},data:a}):i))+''\'' class="toggleEndpointList" data-id="''+p((i=null!=(i=t.id||(null!=e?e.id:e))?i:o,typeof i===l?i.call(e,{name:"id",hash:{},data:a}):i))+''">Show/Hide</a>\n    </li>\n    <li>\n      <a href=\''#\'' class="collapseResource" data-id="''+p((i=null!=(i=t.id||(null!=e?e.id:e))?i:o,typeof i===l?i.call(e,{name:"id",hash:{},data:a}):i))+''">\n        List Operations\n      </a>\n    </li>\n    <li>\n      <a href=\''#\'' class="expandResource" data-id="''+p((i=null!=(i=t.id||(null!=e?e.id:e))?i:o,typeof i===l?i.call(e,{name:"id",hash:{},data:a}):i))+''">\n        Expand Operations\n      </a>\n    </li>\n    '',i=null!=(i=t.url||(null!=e?e.url:e))?i:o,r={name:"url",hash:{},fn:this.program(3,a),inverse:this.noop,data:a},s=typeof i===l?i.call(e,r):i,t.url||(s=u.call(e,s,r)),null!=s&&(h+=s),h+"\n  </ul>\n</div>\n<ul class=''endpoints'' id=''"+p((i=null!=(i=t.id||(null!=e?e.id:e))?i:o,typeof i===l?i.call(e,{name:"id",hash:{},data:a}):i))+"_endpoint_list'' style=''display:none''>\n\n</ul>\n"},useData:!0});var ResponseContentTypeView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;ResponseContentTypeView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.initialize=function(){},t.prototype.render=function(){var e;return e=this.template(),$(this.el).html(e(this.model)),$("label[for=responseContentType]",$(this.el)).text("Response Content Type"),this},t.prototype.template=function(){return Handlebars.templates.response_content_type},t}(Backbone.View),this.Handlebars.templates.response_content_type=Handlebars.template({1:function(e,t,n,a){var s,i="";return s=t.each.call(e,null!=e?e.produces:e,{name:"each",hash:{},fn:this.program(2,a),inverse:this.noop,data:a}),null!=s&&(i+=s),i},2:function(e){var t,n=this.lambda,a=''  <option value="'';return t=n(e,e),null!=t&&(a+=t),a+=''">'',t=n(e,e),null!=t&&(a+=t),a+"</option>\n"},4:function(){return''  <option value="application/json">application/json</option>\n''},compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i=''<label for="responseContentType"></label>\n<select name="responseContentType">\n'';return s=t["if"].call(e,null!=e?e.produces:e,{name:"if",hash:{},fn:this.program(1,a),inverse:this.program(4,a),data:a}),null!=s&&(i+=s),i+"</select>\n"},useData:!0});var SignatureView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;SignatureView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.events={"click a.description-link":"switchToDescription","click a.snippet-link":"switchToSnippet","mousedown .snippet":"snippetToTextArea"},t.prototype.initialize=function(){},t.prototype.render=function(){var e;return e=this.template(),$(this.el).html(e(this.model)),this.switchToSnippet(),this.isParam=this.model.isParam,this.isParam&&$(".notice",$(this.el)).text("Click to set as parameter value"),this},t.prototype.template=function(){return Handlebars.templates.signature},t.prototype.switchToDescription=function(e){return null!=e&&e.preventDefault(),$(".snippet",$(this.el)).hide(),$(".description",$(this.el)).show(),$(".description-link",$(this.el)).addClass("selected"),$(".snippet-link",$(this.el)).removeClass("selected")},t.prototype.switchToSnippet=function(e){return null!=e&&e.preventDefault(),$(".description",$(this.el)).hide(),$(".snippet",$(this.el)).show(),$(".snippet-link",$(this.el)).addClass("selected"),$(".description-link",$(this.el)).removeClass("selected")},t.prototype.snippetToTextArea=function(e){var t;return this.isParam&&(null!=e&&e.preventDefault(),t=$("textarea",$(this.el.parentNode.parentNode.parentNode)),""===$.trim(t.val()))?t.val(this.model.sampleJSON):void 0},t}(Backbone.View),this.Handlebars.templates.signature=Handlebars.template({compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r="function",l=t.helperMissing,o=this.escapeExpression,p=''<div>\n<ul class="signature-nav">\n  <li><a class="description-link" href="#">Model</a></li>\n  <li><a class="snippet-link" href="#">Model Schema</a></li>\n</ul>\n<div>\n\n<div class="signature-container">\n  <div class="description">\n    '';return i=null!=(i=t.signature||(null!=e?e.signature:e))?i:l,s=typeof i===r?i.call(e,{name:"signature",hash:{},data:a}):i,null!=s&&(p+=s),p+''\n  </div>\n\n  <div class="snippet">\n    <pre><code>''+o((i=null!=(i=t.sampleJSON||(null!=e?e.sampleJSON:e))?i:l,typeof i===r?i.call(e,{name:"sampleJSON",hash:{},data:a}):i))+''</code></pre>\n    <small class="notice"></small>\n  </div>\n</div>\n\n''},useData:!0});var StatusCodeView,__extends=function(e,t){function n(){this.constructor=e}for(var a in t)__hasProp.call(t,a)&&(e[a]=t[a]);return n.prototype=t.prototype,e.prototype=new n,e.__super__=t.prototype,e},__hasProp={}.hasOwnProperty;StatusCodeView=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return __extends(t,e),t.prototype.initialize=function(){},t.prototype.render=function(){var e,t,n;return n=this.template(),$(this.el).html(n(this.model)),swaggerUi.api.models.hasOwnProperty(this.model.responseModel)?(e={sampleJSON:JSON.stringify(swaggerUi.api.models[this.model.responseModel].createJSONSample(),null,2),isParam:!1,signature:swaggerUi.api.models[this.model.responseModel].getMockSignature()},t=new SignatureView({model:e,tagName:"div"}),$(".model-signature",this.$el).append(t.render().el)):$(".model-signature",this.$el).html(""),this},t.prototype.template=function(){return Handlebars.templates.status_code},t}(Backbone.View),this.Handlebars.templates.status_code=Handlebars.template({compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,n,a){var s,i,r="function",l=t.helperMissing,o=this.escapeExpression,p="<td width=''15%'' class=''code''>"+o((i=null!=(i=t.code||(null!=e?e.code:e))?i:l,typeof i===r?i.call(e,{name:"code",hash:{},data:a}):i))+"</td>\n<td>";return i=null!=(i=t.message||(null!=e?e.message:e))?i:l,s=typeof i===r?i.call(e,{name:"message",hash:{},data:a}):i,null!=s&&(p+=s),p+"</td>\n<td width=''50%''><span class=\"model-signature\" /></td>"},useData:!0});'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> throbberGif [
	^ #[71 73 70 56 57 97 128 0 16 0 132 0 0 124 126 124 204 206 204 164 162 164 236 234 236 148 146 148 180 182 180 244 246 244 140 138 140 228 226 228 132 134 132 220 218 220 172 170 172 244 242 244 156 158 156 188 190 188 252 254 252 132 130 132 212 210 212 164 166 164 236 238 236 148 150 148 188 186 188 252 250 252 140 142 140 228 230 228 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33 255 11 78 69 84 83 67 65 80 69 50 46 48 3 1 0 0 0 33 249 4 9 4 0 15 0 44 0 0 0 0 128 0 16 0 0 5 254 224 35 142 100 105 158 104 170 174 108 235 190 112 44 207 116 109 223 120 174 239 124 239 255 52 203 100 48 73 89 6 3 70 202 128 84 162 24 72 67 10 58 176 160 132 68 99 115 185 125 70 167 72 171 201 226 32 36 40 17 49 105 82 184 36 4 10 245 8 177 56 28 22 152 147 66 144 184 20 156 36 22 17 102 4 14 114 34 100 102 104 135 15 108 110 112 140 116 118 120 122 124 126 128 35 130 132 134 38 17 0 16 159 7 10 38 21 160 160 13 121 36 6 11 160 159 18 152 15 3 13 159 159 5 38 10 23 180 16 1 157 186 162 164 166 0 168 37 171 173 16 175 37 178 186 182 37 184 186 188 37 18 180 159 21 38 7 0 216 16 16 17 201 9 186 9 3 37 17 193 16 7 38 14 173 216 2 38 210 198 213 37 215 217 219 221 223 225 36 227 190 231 233 0 235 209 228 239 36 174 25 227 70 98 64 130 116 224 196 25 3 96 174 68 169 79 160 250 145 144 240 207 218 180 121 5 15 98 3 144 240 222 194 134 36 30 106 227 103 34 128 177 11 163 148 74 20 8 54 140 4 3 138 16 145 145 192 208 192 24 51 18 184 140 65 35 97 50 27 74 19 43 105 181 28 241 210 212 49 88 52 109 222 186 160 115 76 5 2 16 8 4 96 196 230 192 155 56 38 36 37 88 128 96 140 130 6 118 10 216 11 20 128 80 5 70 22 158 70 157 106 162 234 213 72 117 182 118 45 97 225 107 216 177 153 202 38 32 112 246 196 17 12 69 174 12 192 192 128 145 8 6 24 146 76 73 44 5 197 144 42 130 1 107 33 108 248 1 98 197 79 24 167 120 92 25 136 231 207 160 67 139 30 77 186 180 233 211 168 83 187 8 1 0 33 249 4 9 4 0 22 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 198 196 76 74 76 164 162 164 228 230 228 28 30 28 148 146 148 220 218 220 244 246 244 180 182 180 12 14 12 100 102 100 52 50 52 140 138 140 204 206 204 236 238 236 156 154 156 12 10 12 172 170 172 36 38 36 228 226 228 252 254 252 188 190 188 116 118 116 4 6 4 132 134 132 204 202 204 84 86 84 164 166 164 236 234 236 36 34 36 148 150 148 220 222 220 252 250 252 188 186 188 20 18 20 52 54 52 140 142 140 212 210 212 244 242 244 156 158 156 124 126 124 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 64 139 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 143 155 136 134 128 184 122 191 224 43 10 243 89 72 72 141 142 40 204 110 187 137 21 14 96 78 207 96 80 69 145 199 131 71 38 246 125 71 40 123 9 73 131 30 107 71 34 16 30 16 73 122 124 73 127 145 72 135 133 149 123 137 66 34 38 18 116 159 36 10 68 16 10 38 91 8 154 67 21 19 14 14 19 5 71 8 4 26 38 10 129 67 34 39 7 26 7 23 169 155 23 187 32 39 191 22 164 166 92 197 171 173 175 177 179 181 183 155 186 188 190 67 5 3 159 217 12 68 35 1 42 222 17 176 68 9 19 222 223 29 209 30 17 223 223 162 69 8 38 236 1 15 70 39 242 14 93 69 221 236 225 69 228 230 1 208 21 81 39 207 29 17 120 242 232 9 65 64 33 219 167 6 68 28 168 152 24 32 192 137 129 26 228 105 240 80 228 68 70 111 1 28 24 185 96 110 34 1 35 29 216 125 27 97 68 34 69 139 24 53 114 36 226 241 222 200 146 42 78 46 108 232 112 14 211 196 33 18 205 105 184 72 196 131 134 146 27 59 2 84 33 82 31 72 111 58 137 116 0 185 178 165 202 161 24 145 206 28 114 98 105 83 110 79 115 90 195 214 19 192 182 33 10 168 246 35 130 98 234 183 128 209 10 164 0 104 112 8 60 128 10 137 60 0 104 34 31 145 180 252 196 13 105 251 84 32 17 185 116 141 220 165 152 151 147 39 135 11 234 146 114 112 74 25 43 13 19 42 24 17 129 32 69 43 5 91 113 61 216 117 96 68 49 17 35 14 4 56 240 160 216 228 202 70 150 97 214 156 167 243 231 208 155 70 243 50 13 71 78 54 59 209 244 20 64 81 76 8 138 2 148 4 33 191 116 132 17 34 36 194 29 65 247 48 188 184 133 227 201 141 96 103 110 196 185 107 12 6 204 44 104 144 130 251 155 243 232 171 8 216 21 193 111 250 247 240 227 203 159 79 191 190 125 55 65 0 0 33 249 4 9 4 0 48 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 194 196 68 66 68 164 162 164 228 226 228 36 38 36 100 98 100 148 146 148 180 178 180 244 242 244 20 22 20 212 210 212 84 82 84 12 10 12 140 138 140 172 170 172 236 234 236 52 50 52 124 126 124 156 154 156 188 186 188 252 250 252 220 218 220 204 202 204 76 78 76 108 106 108 28 30 28 92 90 92 60 58 60 4 6 4 132 134 132 68 70 68 164 166 164 228 230 228 100 102 100 148 150 148 180 182 180 244 246 244 28 26 28 212 214 212 12 14 12 140 142 140 172 174 172 236 238 236 52 54 52 156 158 156 188 190 188 252 254 252 220 222 220 204 206 204 92 94 92 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 64 152 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 167 22 1 226 147 16 93 191 224 48 147 210 232 204 42 198 72 230 148 114 44 6 47 177 124 126 189 128 0 120 128 231 224 21 162 36 121 121 14 20 70 38 17 17 10 73 10 135 38 138 135 22 72 22 44 17 44 73 22 135 137 72 134 136 142 17 141 72 139 17 144 68 44 7 129 120 14 31 144 10 26 167 121 11 17 68 5 16 15 15 43 5 71 23 4 31 42 37 153 68 22 12 91 8 47 163 192 47 91 36 12 198 67 44 9 42 31 4 23 204 66 179 181 183 185 187 189 191 67 193 195 197 68 2 6 174 0 45 49 48 24 128 228 0 36 67 38 16 1 19 19 1 33 220 48 17 20 243 243 9 70 23 42 250 1 100 24 97 0 240 193 5 35 21 226 197 163 208 199 29 60 121 244 236 225 3 200 175 136 63 128 2 135 184 240 64 206 129 192 4 39 214 1 56 48 36 194 7 128 31 98 17 97 112 82 225 3 35 47 226 201 155 64 192 72 8 125 243 208 20 121 48 51 64 254 0 6 69 76 162 84 57 132 101 65 152 50 229 213 28 66 128 163 43 7 64 75 132 92 55 162 228 135 164 41 139 48 144 25 239 101 145 132 243 226 45 37 18 66 97 78 35 60 101 126 0 74 196 36 86 162 66 182 66 156 224 149 8 88 159 52 137 188 24 231 202 28 58 117 228 218 9 81 80 54 108 189 34 34 92 112 173 72 196 31 215 140 68 100 112 85 113 176 72 9 179 12 139 16 86 24 17 177 98 136 140 135 56 134 8 249 158 169 83 30 30 52 82 48 194 233 169 5 184 134 88 251 0 33 54 176 11 46 106 37 168 84 196 130 140 97 21 168 193 176 80 1 65 0 4 50 132 59 131 38 77 248 236 218 70 44 224 214 205 27 216 239 15 8 130 91 28 16 104 143 237 63 174 60 16 210 44 130 19 168 242 159 142 76 18 21 41 130 136 234 209 221 43 16 62 184 188 61 34 10 208 39 89 79 223 2 137 6 18 112 80 130 17 34 172 145 130 7 111 148 64 31 29 12 54 72 133 9 21 64 3 157 131 20 86 104 225 133 24 102 168 225 134 114 2 4 1 0 33 249 4 9 4 0 28 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 198 196 68 66 68 164 162 164 228 230 228 100 98 100 52 50 52 20 18 20 212 214 212 180 178 180 148 146 148 84 86 84 244 246 244 116 114 116 12 10 12 140 138 140 204 206 204 76 74 76 172 170 172 236 238 236 28 26 28 220 222 220 188 186 188 108 106 108 60 62 60 156 158 156 92 94 92 252 254 252 4 6 4 132 134 132 204 202 204 68 70 68 164 166 164 236 234 236 52 54 52 20 22 20 220 218 220 180 182 180 148 150 148 92 90 92 252 250 252 124 126 124 12 14 12 140 142 140 212 210 212 76 78 76 172 174 172 244 242 244 28 30 28 228 226 228 188 190 188 108 110 108 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 64 142 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 73 152 137 5 185 80 176 224 240 21 102 73 33 69 44 73 198 241 49 126 6 149 213 163 194 72 136 239 248 165 108 243 0 60 2 34 69 17 49 0 133 0 43 1 48 67 31 125 134 133 43 109 69 48 34 34 13 89 148 102 71 41 20 34 95 72 41 148 138 72 13 161 151 149 166 153 68 50 32 142 29 24 129 66 50 3 142 143 19 66 34 179 180 133 3 158 66 37 4 30 44 38 162 68 41 45 11 30 11 51 169 67 41 51 200 39 45 204 66 20 10 44 30 4 37 211 28 50 19 16 16 47 50 71 191 193 195 70 198 200 202 211 44 43 180 36 10 67 26 8 186 0 18 66 10 36 244 0 239 67 34 26 42 1 0 194 43 82 130 5 64 128 17 140 180 56 24 0 66 9 35 23 2 6 212 80 160 72 131 9 1 1 134 32 118 235 159 196 129 68 10 50 76 56 4 198 6 122 30 50 57 208 183 66 8 59 125 15 32 12 105 33 17 160 204 34 51 50 170 80 65 192 72 254 136 131 0 47 24 129 176 19 96 128 22 69 68 120 96 232 1 214 204 154 13 141 228 44 202 147 136 73 148 153 104 176 20 178 160 145 174 21 55 57 208 220 25 48 236 144 136 70 171 22 9 1 85 104 17 162 25 143 38 245 160 179 105 145 177 7 205 10 65 27 32 96 79 34 16 188 22 226 39 68 30 61 123 28 240 233 35 204 161 128 134 184 32 135 20 140 75 146 72 132 184 44 30 22 49 81 147 162 36 182 70 55 22 113 12 217 200 100 178 149 125 177 50 212 193 64 197 88 25 190 218 226 32 98 181 174 1 78 83 148 208 240 77 65 175 102 17 210 93 216 150 226 194 130 0 11 34 108 171 118 45 219 182 110 16 60 76 16 87 68 55 111 8 190 207 5 79 54 220 136 5 6 29 252 168 120 189 136 144 33 68 189 4 8 126 36 192 8 140 2 167 144 112 18 177 77 8 168 2 191 171 139 40 0 163 62 135 247 34 112 36 9 124 150 200 135 73 22 37 20 104 132 8 16 128 112 0 13 237 21 33 192 0 36 200 65 130 11 169 229 161 225 134 88 19 84 19 157 9 249 113 40 226 136 36 150 104 226 137 40 166 184 68 16 0 33 249 4 9 4 0 48 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 194 196 68 66 68 164 162 164 228 226 228 36 34 36 148 146 148 100 98 100 180 178 180 244 242 244 20 22 20 212 210 212 52 50 52 12 10 12 140 138 140 92 94 92 172 170 172 236 234 236 156 154 156 124 126 124 188 186 188 252 250 252 220 218 220 60 58 60 204 202 204 76 74 76 108 106 108 28 30 28 4 6 4 132 134 132 68 70 68 164 166 164 228 230 228 36 38 36 148 150 148 100 102 100 180 182 180 244 246 244 28 26 28 212 214 212 52 54 52 12 14 12 140 142 140 172 174 172 236 238 236 156 158 156 188 190 188 252 254 252 220 222 220 60 62 60 204 206 204 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 64 152 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 214 80 34 112 16 152 176 224 240 85 18 75 94 2 131 65 224 82 180 68 48 11 135 138 67 82 136 239 119 75 75 210 66 10 52 29 0 6 19 125 68 4 11 0 137 0 11 4 68 19 14 138 138 13 40 70 10 18 18 22 72 122 124 73 22 151 118 72 38 159 73 150 18 95 72 165 153 70 22 47 7 30 35 12 170 67 23 28 145 42 15 167 48 23 136 145 139 108 48 33 188 189 29 27 160 48 22 12 174 7 47 178 67 172 174 176 205 66 45 9 43 30 4 23 210 48 5 17 15 15 44 5 71 23 4 30 43 37 198 206 201 30 203 218 12 20 1 239 15 191 67 27 189 0 34 243 20 246 137 20 66 19 251 137 26 100 152 181 226 221 187 25 70 220 193 11 32 207 72 133 133 20 38 132 40 98 34 2 188 119 32 208 193 144 48 193 96 128 4 70 46 20 92 136 176 8 8 131 239 42 16 105 209 96 31 72 33 3 0 202 16 82 15 224 130 151 48 94 92 164 64 161 145 254 73 148 1 84 22 121 192 243 93 0 6 69 36 120 240 232 65 66 17 6 75 23 62 48 162 179 104 79 35 32 32 6 93 217 210 94 137 33 50 0 14 160 9 112 17 206 135 70 175 154 212 42 148 8 209 139 30 144 18 81 186 179 233 211 139 240 166 22 65 27 0 158 79 34 51 240 174 152 39 4 129 61 3 148 132 232 219 215 15 198 63 128 2 9 226 45 9 88 48 97 33 37 32 74 44 162 32 171 209 140 69 66 184 192 139 83 50 207 0 148 157 85 56 192 101 134 52 6 39 108 5 48 182 203 222 130 196 193 0 214 113 54 67 89 5 109 22 86 183 214 70 205 26 54 109 220 30 120 136 16 174 205 5 23 222 18 20 34 98 161 247 186 223 71 60 133 152 94 228 197 135 68 28 70 112 135 225 66 216 34 23 142 2 245 154 100 100 15 38 77 18 182 119 138 175 64 155 16 5 33 36 104 36 130 223 84 18 247 246 61 33 193 101 68 92 64 1 6 24 80 144 152 51 17 164 16 135 3 39 64 48 30 30 20 86 24 70 1 32 148 243 66 46 22 13 118 232 225 135 32 134 40 226 136 36 38 17 4 0 33 249 4 9 4 0 25 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 198 196 68 70 68 164 162 164 36 34 36 228 230 228 148 146 148 20 18 20 100 102 100 180 182 180 244 246 244 220 218 220 52 50 52 12 10 12 140 138 140 204 206 204 172 170 172 236 238 236 156 154 156 116 118 116 84 86 84 44 46 44 28 30 28 188 190 188 252 254 252 60 62 60 4 6 4 132 134 132 204 202 204 76 74 76 164 166 164 36 38 36 236 234 236 148 150 148 20 22 20 116 114 116 188 186 188 252 250 252 228 226 228 52 54 52 12 14 12 140 142 140 212 210 212 172 174 172 244 242 244 156 158 156 124 126 124 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 192 140 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 216 37 131 16 152 116 178 224 112 213 96 72 118 72 26 143 42 84 92 28 44 8 71 170 160 90 136 239 77 147 36 36 73 154 66 33 45 71 38 44 40 0 0 40 44 38 68 45 1 41 135 135 23 95 66 45 36 27 144 144 21 39 69 122 124 126 128 130 72 11 160 73 45 128 118 72 166 33 139 70 38 24 7 28 34 43 172 68 18 10 42 28 4 12 180 66 44 35 152 35 17 68 44 8 152 135 26 155 25 37 197 198 0 14 7 180 174 176 178 188 66 182 184 186 213 25 39 17 15 15 44 201 69 91 28 42 10 161 68 38 43 176 7 24 218 43 47 1 240 15 12 70 37 241 241 19 101 68 13 205 40 68 30 205 0 32 112 33 36 65 192 67 3 244 101 120 119 111 94 189 123 47 242 181 137 16 15 222 135 115 66 66 76 128 7 79 129 17 6 42 56 6 128 96 228 3 71 120 37 140 60 120 193 50 64 128 21 68 66 28 84 248 40 32 9 33 134 14 130 160 39 196 100 254 197 0 41 139 172 108 249 178 72 8 14 34 57 176 33 178 2 105 67 35 24 42 178 36 80 18 34 80 149 39 57 192 28 34 51 32 205 131 55 51 228 12 88 128 103 134 15 86 131 18 89 89 81 171 81 14 82 149 22 89 241 243 197 131 135 240 226 81 45 2 225 167 10 179 67 20 64 148 72 196 66 51 11 255 2 166 32 152 193 224 193 132 67 250 182 252 107 68 48 71 194 67 90 160 205 123 177 136 1 23 63 61 138 83 241 147 36 167 18 7 2 28 128 160 205 214 131 92 187 138 124 248 5 9 193 94 33 17 106 98 66 38 164 132 110 76 14 84 68 67 173 154 181 17 215 176 181 113 123 29 33 220 16 19 12 92 120 83 176 20 29 132 117 37 180 101 248 99 160 15 18 238 45 180 45 136 192 15 128 5 22 168 40 57 194 36 41 51 133 75 198 52 113 10 209 253 147 129 240 169 12 4 42 165 63 253 113 64 218 137 113 130 115 69 8 64 130 5 3 60 160 16 37 42 88 144 130 28 23 112 128 17 30 20 86 136 5 3 19 4 32 130 0 22 12 118 232 225 135 32 134 40 226 136 21 6 1 0 33 249 4 9 4 0 52 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 194 196 68 66 68 228 226 228 164 162 164 100 98 100 36 34 36 148 146 148 212 210 212 84 82 84 244 242 244 20 18 20 180 182 180 52 50 52 12 10 12 140 138 140 204 202 204 76 74 76 236 234 236 116 118 116 156 154 156 220 218 220 92 90 92 252 250 252 172 170 172 188 190 188 60 58 60 4 6 4 132 134 132 196 198 196 68 70 68 228 230 228 164 166 164 100 102 100 36 38 36 148 150 148 212 214 212 84 86 84 244 246 244 28 30 28 188 186 188 52 54 52 12 14 12 140 142 140 204 206 204 76 78 76 236 238 236 124 126 124 156 158 156 220 222 220 92 94 92 252 254 252 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 64 154 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 88 108 164 210 41 88 178 224 112 149 48 73 166 102 27 69 12 83 92 80 14 171 7 195 17 98 139 197 152 215 228 149 196 76 38 11 73 39 127 129 70 11 21 7 0 28 18 2 69 32 6 15 0 146 0 31 95 66 4 10 147 147 28 20 133 67 126 128 130 132 73 11 127 39 164 127 118 69 24 26 8 29 36 9 170 67 47 13 44 93 22 178 151 25 16 16 25 32 69 39 16 43 154 40 150 52 24 29 145 154 0 6 124 24 44 195 203 0 12 13 68 180 182 94 185 52 4 187 189 191 70 22 5 29 44 13 158 159 9 174 8 26 218 9 48 1 238 16 198 67 41 239 239 21 223 67 39 25 239 238 33 230 22 35 164 137 24 34 99 131 52 0 35 52 208 0 33 225 160 164 129 243 234 193 184 7 108 31 140 126 230 104 76 168 224 206 93 181 34 22 88 116 12 208 194 72 136 142 238 82 24 129 112 209 93 128 4 69 38 116 24 217 161 204 144 6 7 29 240 161 145 64 217 254 50 14 5 104 0 116 8 192 1 17 150 23 3 188 140 57 179 94 205 34 9 154 194 51 162 129 223 197 160 69 66 72 12 160 178 8 75 126 29 96 18 145 105 245 233 205 156 54 91 248 212 4 84 104 64 135 70 135 124 189 24 150 105 89 155 67 18 240 123 7 193 8 61 151 48 176 18 105 177 151 133 60 33 13 36 82 36 178 64 171 75 127 68 44 36 90 54 99 8 1 21 7 15 40 100 72 212 0 145 196 29 23 15 105 92 47 0 100 34 32 98 236 253 24 153 197 222 146 171 82 32 8 128 160 133 54 90 16 110 105 227 150 59 3 129 54 1 162 73 66 1 155 198 137 100 63 13 148 121 182 118 210 10 214 52 112 235 54 194 187 131 111 35 24 44 196 224 213 0 239 167 22 233 82 104 59 54 1 196 206 35 126 64 44 24 79 99 1 136 80 70 94 144 64 33 233 131 66 34 4 12 112 208 52 160 132 101 19 210 112 146 81 122 235 33 225 30 124 71 28 120 10 18 122 76 192 222 29 75 88 128 143 17 13 92 224 128 11 36 228 242 2 5 40 29 196 177 130 3 49 44 8 225 136 36 130 225 129 43 21 248 87 226 138 44 182 232 226 139 48 198 40 69 16 0 33 249 4 9 4 0 49 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 194 196 68 66 68 164 162 164 228 226 228 36 38 36 100 98 100 148 146 148 180 178 180 244 242 244 20 22 20 212 210 212 84 82 84 12 10 12 140 138 140 76 74 76 172 170 172 236 234 236 52 50 52 124 126 124 156 154 156 188 186 188 252 250 252 220 218 220 204 202 204 108 106 108 28 30 28 92 90 92 60 58 60 4 6 4 132 134 132 68 70 68 164 166 164 228 230 228 100 102 100 148 150 148 180 182 180 244 246 244 28 26 28 212 214 212 12 14 12 140 142 140 76 78 76 172 174 172 236 238 236 52 54 52 156 158 156 188 190 188 252 254 252 220 222 220 204 206 204 92 94 92 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 192 152 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 216 236 242 34 64 124 18 34 173 120 28 189 200 20 201 74 163 67 179 24 37 144 77 202 177 24 192 200 208 75 75 210 74 94 36 18 104 72 38 128 130 71 10 128 38 71 18 31 14 0 30 52 5 69 24 32 0 150 143 7 97 66 40 19 151 151 14 21 70 132 129 73 136 18 138 72 166 23 71 23 48 94 36 12 171 69 45 9 42 31 4 24 178 68 5 17 15 15 44 146 70 24 4 31 42 37 134 66 18 26 30 158 32 193 49 45 7 158 150 14 31 171 10 26 211 151 11 18 187 189 191 207 68 195 197 199 70 23 12 94 8 48 186 67 12 20 1 239 15 24 70 22 240 240 21 154 67 38 17 240 239 33 200 49 36 84 120 247 46 65 145 4 39 166 165 120 48 68 128 1 109 0 92 200 136 145 161 19 68 0 36 244 241 163 224 15 160 64 130 1 12 78 82 1 114 134 145 16 4 223 185 41 242 128 227 187 0 12 138 48 2 249 161 27 17 6 31 64 50 28 114 225 3 254 68 26 130 94 48 211 230 192 36 194 139 0 14 12 153 105 175 102 17 156 58 141 192 232 199 145 192 73 123 42 141 180 236 247 33 38 17 70 84 157 222 236 7 111 167 144 11 15 32 114 64 69 96 232 52 7 49 75 36 188 56 98 233 135 176 54 219 145 165 96 118 72 189 151 20 172 22 153 65 86 197 188 34 37 176 226 43 162 32 132 189 0 255 138 136 120 65 86 228 16 22 11 166 121 48 11 227 161 54 137 20 45 66 204 40 164 241 227 200 68 38 87 22 166 130 172 201 34 23 44 32 8 128 96 6 59 33 180 108 225 186 29 131 215 131 15 17 194 157 197 240 194 87 130 62 95 15 184 5 48 96 98 50 105 154 31 40 82 48 98 249 182 112 190 129 11 143 113 129 184 113 228 68 46 204 72 103 129 55 119 9 34 192 155 67 175 192 124 12 5 34 72 165 138 143 74 114 0 71 30 56 56 31 130 97 128 39 15 7 60 195 137 54 30 132 194 88 124 0 17 1 223 41 73 236 33 129 123 120 88 97 2 6 234 133 71 66 3 19 112 80 130 17 34 31 172 112 66 10 30 212 81 2 132 17 150 104 226 19 38 88 96 75 112 39 182 232 226 139 48 198 40 99 140 65 0 0 33 249 4 9 4 0 28 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 198 196 68 66 68 164 162 164 228 230 228 100 98 100 52 50 52 20 18 20 212 214 212 180 178 180 148 146 148 84 86 84 244 246 244 116 114 116 12 10 12 140 138 140 204 206 204 76 74 76 172 170 172 236 238 236 28 26 28 220 222 220 188 186 188 108 106 108 60 62 60 156 158 156 92 94 92 252 254 252 4 6 4 132 134 132 204 202 204 68 70 68 164 166 164 236 234 236 52 54 52 20 22 20 220 218 220 180 182 180 148 150 148 92 90 92 252 250 252 124 126 124 12 14 12 140 142 140 212 210 212 76 78 76 172 174 172 244 242 244 28 30 28 228 226 228 188 190 188 108 110 108 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 64 142 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 216 44 22 102 98 65 46 20 173 120 28 133 89 82 72 17 75 146 113 124 140 159 65 101 245 168 48 18 228 97 138 34 10 35 83 34 34 48 73 13 129 131 72 48 129 13 73 137 34 104 70 50 27 15 0 15 1 34 69 17 49 0 155 0 43 1 135 28 31 147 156 155 43 111 69 141 139 136 129 143 69 41 51 11 30 39 45 173 67 20 10 44 30 4 37 181 66 50 19 16 16 47 50 71 37 4 30 44 38 160 122 45 177 11 51 189 50 32 164 29 24 151 190 3 164 165 19 66 34 217 218 155 3 126 66 198 200 202 70 41 205 30 207 189 28 45 42 1 240 16 37 70 23 241 241 26 5 69 13 19 241 240 33 203 56 136 208 0 15 158 2 35 37 88 20 12 16 161 8 139 21 218 72 28 20 162 1 1 56 0 18 132 40 32 113 17 128 196 33 3 23 78 36 146 112 97 195 34 33 10 194 187 96 4 130 138 151 1 2 180 40 34 194 195 66 15 215 134 180 184 39 207 200 254 12 127 47 9 16 129 177 225 162 135 71 14 58 174 16 242 176 227 3 8 58 121 6 128 90 228 231 203 160 70 66 72 101 89 196 165 63 153 52 61 0 197 89 100 39 76 21 84 137 216 131 23 79 232 16 162 70 31 209 80 42 100 193 40 112 43 210 154 45 152 118 200 218 152 42 220 18 137 240 149 5 189 34 38 120 230 67 165 149 45 192 34 5 52 124 29 57 36 225 215 147 67 32 220 221 244 145 162 69 112 25 57 108 236 216 153 67 228 201 8 89 92 70 119 97 65 128 5 17 218 221 202 181 171 221 47 8 30 38 16 115 85 66 67 48 5 227 244 68 112 118 161 87 137 105 156 58 24 208 231 43 3 94 110 2 145 131 27 144 51 69 239 223 193 133 164 24 190 174 248 17 64 5 178 19 1 15 163 157 16 24 5 4 49 74 175 234 8 31 71 71 44 48 232 64 73 5 243 33 31 52 113 242 52 78 192 230 82 2 24 129 158 8 237 25 241 158 121 121 36 136 74 9 5 18 33 2 4 32 28 64 67 128 69 8 48 0 9 116 144 224 2 102 10 21 118 232 225 20 183 224 102 130 120 31 150 104 226 137 40 166 168 98 19 65 0 0 33 249 4 9 4 0 48 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 194 196 68 66 68 164 162 164 228 226 228 36 34 36 148 146 148 100 98 100 180 178 180 244 242 244 20 22 20 212 210 212 52 50 52 12 10 12 140 138 140 92 94 92 172 170 172 236 234 236 156 154 156 124 126 124 188 186 188 252 250 252 220 218 220 60 58 60 204 202 204 76 74 76 108 106 108 28 30 28 4 6 4 132 134 132 68 70 68 164 166 164 228 230 228 36 38 36 148 150 148 100 102 100 180 182 180 244 246 244 28 26 28 212 214 212 52 54 52 12 14 12 140 142 140 172 174 172 236 238 236 156 158 156 188 190 188 252 254 252 220 222 220 60 62 60 204 206 204 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 64 152 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 216 172 118 25 74 4 14 2 211 118 76 118 74 98 201 75 96 48 8 92 138 150 8 102 225 80 113 72 138 169 165 37 105 37 45 18 18 121 72 38 129 131 71 10 129 98 72 137 18 22 72 123 125 72 2 26 29 0 6 19 126 68 4 11 0 158 0 11 4 68 19 14 159 159 13 40 70 141 143 70 22 47 7 30 35 12 172 68 45 9 43 30 4 23 180 67 5 17 15 15 44 5 71 23 4 30 43 37 135 67 22 12 176 7 47 188 66 174 176 178 209 23 28 166 42 15 139 48 23 157 166 160 111 48 33 223 224 29 27 135 204 206 208 70 12 20 1 239 15 226 68 21 240 240 19 33 69 38 17 240 239 32 202 48 36 76 120 247 46 129 145 11 43 8 6 152 209 78 161 188 34 27 192 1 16 49 143 130 68 79 20 132 76 184 232 169 65 134 33 8 21 50 44 2 130 224 187 10 70 30 80 88 25 32 0 131 34 18 60 40 244 32 161 8 3 153 246 30 24 121 209 111 165 254 40 146 38 3 160 28 210 162 193 69 131 66 6 112 148 33 36 34 199 5 72 97 240 92 233 211 8 8 123 39 83 154 244 240 146 72 204 158 52 109 246 131 167 179 72 189 119 240 126 18 185 170 112 168 144 162 23 75 12 145 193 113 64 83 142 160 162 158 109 73 65 237 144 25 99 87 204 27 82 2 43 190 34 10 216 182 252 87 36 132 139 177 81 65 174 24 59 146 8 96 150 130 139 32 144 104 32 149 16 139 23 51 194 216 200 209 163 100 202 173 42 28 248 50 35 26 12 91 184 116 185 246 245 192 67 132 97 112 46 184 0 150 64 19 17 11 51 156 85 112 109 65 53 235 104 12 78 100 11 112 200 155 196 5 158 201 113 196 179 44 184 135 3 195 143 0 10 225 187 149 132 16 10 92 11 81 16 66 80 18 242 18 184 25 225 227 8 210 247 238 68 94 124 240 196 97 4 124 23 229 64 185 24 101 9 28 170 245 129 136 87 198 128 82 72 48 88 17 23 80 128 1 6 20 120 182 76 4 41 208 225 192 9 16 192 71 224 133 24 70 81 0 8 199 14 188 160 94 134 32 134 40 226 136 36 150 40 68 16 0 33 249 4 9 4 0 25 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 198 196 68 70 68 164 162 164 36 34 36 228 230 228 148 146 148 20 18 20 100 102 100 180 182 180 244 246 244 220 218 220 52 50 52 12 10 12 140 138 140 204 206 204 172 170 172 236 238 236 156 154 156 116 118 116 84 86 84 44 46 44 28 30 28 188 190 188 252 254 252 60 62 60 4 6 4 132 134 132 204 202 204 76 74 76 164 166 164 36 38 36 236 234 236 148 150 148 20 22 20 116 114 116 188 186 188 252 250 252 228 226 228 52 54 52 12 14 12 140 142 140 212 210 212 172 174 172 244 242 244 156 158 156 124 126 124 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 192 140 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 216 172 22 203 32 4 38 157 173 120 252 52 24 146 29 146 198 163 10 21 23 7 11 194 145 42 168 22 70 147 36 36 73 154 66 33 45 73 11 128 130 72 45 128 120 135 128 38 72 122 124 126 133 71 38 44 40 0 0 40 44 141 67 45 1 41 151 151 23 97 66 45 36 27 160 160 21 39 68 38 24 7 28 34 43 155 68 18 10 42 28 4 12 179 67 39 17 15 15 44 171 70 93 28 42 10 134 172 43 175 7 24 187 66 173 175 177 206 25 181 183 185 206 44 35 168 35 17 68 44 8 168 151 26 194 37 224 225 0 14 7 138 25 43 47 1 238 15 12 70 37 239 239 19 103 68 11 17 239 238 31 200 66 33 38 184 115 167 96 152 138 129 1 32 24 105 87 47 222 188 122 47 238 21 105 112 14 5 17 15 231 0 32 112 33 36 65 198 75 30 240 101 248 48 208 93 9 35 15 94 168 12 16 96 69 145 16 28 16 114 112 67 100 69 204 134 70 48 240 83 73 192 8 254 73 126 1 78 22 73 185 178 37 145 16 31 69 126 202 72 66 136 165 143 32 92 10 249 0 49 40 202 146 28 164 14 129 185 115 102 145 21 64 95 60 120 232 238 93 207 34 84 17 10 37 146 146 95 214 163 73 135 44 61 215 52 195 211 140 32 228 9 129 0 84 133 94 34 10 32 74 36 210 34 45 75 127 69 12 184 0 90 176 8 3 21 64 21 22 225 187 210 175 145 192 3 7 15 177 112 206 194 197 140 41 56 102 240 248 49 228 16 19 37 14 4 56 0 97 90 173 7 184 116 25 233 5 59 130 48 86 12 92 252 82 64 147 21 132 101 37 166 161 86 205 218 181 2 216 215 208 106 3 133 224 172 144 8 115 65 141 19 82 34 58 168 13 42 118 253 49 208 199 81 8 3 45 166 145 50 16 40 73 11 242 235 140 236 9 33 62 195 246 238 147 190 135 55 162 143 34 0 11 44 210 119 138 46 138 19 133 83 225 168 66 198 128 4 242 114 155 17 2 144 96 193 0 15 136 68 138 10 22 164 64 199 5 28 252 83 224 133 24 62 193 192 4 1 13 136 32 64 134 32 134 40 226 136 36 142 17 4 0 33 249 4 9 4 0 45 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 196 194 196 68 66 68 164 162 164 228 226 228 36 34 36 100 98 100 148 146 148 244 242 244 84 82 84 212 210 212 180 182 180 28 30 28 52 50 52 12 10 12 140 138 140 76 74 76 236 234 236 156 154 156 252 250 252 220 218 220 172 170 172 124 126 124 92 90 92 188 190 188 60 58 60 4 6 4 132 134 132 204 206 204 68 70 68 164 166 164 228 230 228 36 38 36 100 102 100 148 150 148 244 246 244 212 214 212 188 186 188 52 54 52 12 14 12 140 142 140 76 78 76 236 238 236 156 158 156 252 254 252 220 222 220 92 94 92 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 192 150 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 216 172 118 203 237 122 183 5 73 210 244 210 40 88 148 35 101 37 89 37 41 18 73 34 73 138 207 145 137 56 41 153 151 164 213 108 110 72 112 114 116 118 71 9 19 6 0 27 17 2 69 32 7 15 0 148 0 30 21 69 20 25 8 28 35 11 127 68 43 12 41 28 4 21 160 67 5 22 16 16 22 32 71 21 4 28 41 12 119 68 20 11 156 8 25 168 66 154 156 158 189 45 162 164 166 194 170 172 174 69 36 16 40 149 0 13 152 190 28 147 207 0 7 130 66 11 23 1 220 16 210 68 38 221 221 19 175 68 36 22 221 220 31 182 66 18 19 220 220 12 70 21 41 241 1 29 70 219 227 223 70 226 241 229 150 165 187 176 174 93 133 16 214 0 136 24 226 66 67 66 0 33 50 16 249 16 143 155 9 35 16 8 114 11 176 160 136 4 14 247 56 136 33 178 0 36 63 35 25 212 17 36 96 132 162 186 0 23 139 100 36 24 128 163 71 147 220 68 18 97 240 208 129 230 160 5 213 172 109 96 57 228 195 56 139 24 43 114 232 72 228 163 74 157 36 95 94 128 224 111 92 55 162 19 143 194 76 170 110 233 205 167 35 133 240 76 232 96 100 135 160 207 134 18 233 240 50 5 184 33 12 142 6 36 146 192 232 70 118 144 88 188 156 87 164 222 203 124 69 216 210 116 107 36 46 64 115 67 234 90 197 59 164 194 34 107 47 82 157 120 104 64 226 16 10 38 16 4 64 208 65 152 40 8 165 78 25 65 198 193 66 1 35 20 42 176 96 197 32 236 229 14 186 76 8 195 172 153 179 103 6 160 141 141 94 85 250 52 221 0 206 42 53 0 220 130 4 53 161 7 92 183 128 3 34 27 106 9 32 18 8 19 146 0 68 33 60 214 247 32 97 227 103 16 116 231 153 160 75 199 126 189 200 138 17 13 40 121 176 156 234 192 134 103 3 74 124 153 79 223 73 5 196 133 49 56 80 49 98 122 253 255 0 6 40 224 128 4 22 104 160 128 65 0 0 33 249 4 9 4 0 22 0 44 0 0 0 0 128 0 16 0 133 4 2 4 132 130 132 204 206 204 164 162 164 68 66 68 236 234 236 180 178 180 148 146 148 100 102 100 20 22 20 220 222 220 244 246 244 12 10 12 140 138 140 172 170 172 92 90 92 188 186 188 220 218 220 244 242 244 156 158 156 124 126 124 228 230 228 252 254 252 4 6 4 132 134 132 212 210 212 164 166 164 76 74 76 236 238 236 180 182 180 148 150 148 108 106 108 28 26 28 228 226 228 252 250 252 12 14 12 140 142 140 172 174 172 92 94 92 188 190 188 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 254 64 139 112 72 44 26 143 200 164 114 201 108 58 159 208 168 116 74 173 90 175 216 172 118 203 237 122 191 72 145 66 146 20 113 10 156 114 161 64 70 46 214 237 163 100 189 72 206 11 162 240 57 29 134 39 223 108 118 116 71 5 24 12 0 23 38 33 70 34 39 7 24 30 25 121 69 28 6 36 24 3 17 147 68 33 14 13 13 37 139 70 17 3 24 36 29 113 67 34 25 143 7 39 155 170 142 144 146 70 149 151 153 176 66 157 159 161 71 164 166 168 69 5 31 23 0 198 0 4 162 67 25 20 1 205 13 17 70 16 206 206 19 21 69 11 14 206 205 26 169 22 5 19 205 205 6 163 36 226 1 2 70 204 212 208 210 212 20 214 216 218 20 220 222 224 231 228 68 6 32 199 198 35 36 69 52 136 107 6 193 72 3 122 205 2 100 16 134 225 28 134 2 69 50 188 11 208 192 200 137 109 244 6 24 17 184 45 64 193 34 7 233 5 80 200 208 33 68 34 18 207 85 84 133 161 223 177 7 169 52 76 252 72 228 96 199 133 68 10 97 124 24 177 35 198 133 149 68 166 37 164 160 49 224 76 131 3 73 230 196 176 243 228 50 159 64 45 136 104 224 210 216 131 58 67 4 116 36 17 173 72 135 119 241 136 72 144 153 176 91 145 10 19 58 230 35 18 129 68 199 116 69 180 138 228 106 228 171 184 176 67 198 82 11 96 150 8 90 181 69 74 36 112 121 33 170 84 8 7 2 28 16 144 203 130 45 76 154 140 236 194 224 64 153 170 8 19 62 25 224 67 68 132 128 86 16 26 139 64 172 152 113 45 75 144 27 79 174 204 8 179 102 206 66 10 32 40 118 140 128 2 70 5 42 192 46 34 34 183 132 198 66 36 84 8 132 68 120 1 172 71 206 224 233 163 91 77 133 223 197 135 123 19 59 28 57 167 0 135 46 60 184 13 166 187 247 43 11 34 236 254 78 190 188 249 243 232 211 171 95 223 61 8 0 59]
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> typographyCss [
	^ '/* droid-sans-regular - latin */
@font-face {
  font-family: ''Droid Sans'';
  font-style: normal;
  font-weight: 400;
  src: url(''../fonts/droid-sans-v6-latin-regular.eot''); /* IE9 Compat Modes */
  src: local(''Droid Sans''), local(''DroidSans''),
       url(''../fonts/droid-sans-v6-latin-regular.eot?#iefix'') format(''embedded-opentype''), /* IE6-IE8 */
       url(''../fonts/droid-sans-v6-latin-regular.woff2'') format(''woff2''), /* Super Modern Browsers */
       url(''../fonts/droid-sans-v6-latin-regular.woff'') format(''woff''), /* Modern Browsers */
       url(''../fonts/droid-sans-v6-latin-regular.ttf'') format(''truetype''), /* Safari, Android, iOS */
       url(''../fonts/droid-sans-v6-latin-regular.svg#DroidSans'') format(''svg''); /* Legacy iOS */
}
/* droid-sans-700 - latin */
@font-face {
  font-family: ''Droid Sans'';
  font-style: normal;
  font-weight: 700;
  src: url(''../fonts/droid-sans-v6-latin-700.eot''); /* IE9 Compat Modes */
  src: local(''Droid Sans Bold''), local(''DroidSans-Bold''),
       url(''../fonts/droid-sans-v6-latin-700.eot?#iefix'') format(''embedded-opentype''), /* IE6-IE8 */
       url(''../fonts/droid-sans-v6-latin-700.woff2'') format(''woff2''), /* Super Modern Browsers */
       url(''../fonts/droid-sans-v6-latin-700.woff'') format(''woff''), /* Modern Browsers */
       url(''../fonts/droid-sans-v6-latin-700.ttf'') format(''truetype''), /* Safari, Android, iOS */
       url(''../fonts/droid-sans-v6-latin-700.svg#DroidSans'') format(''svg''); /* Legacy iOS */
}
'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> underscoreminJs [
	^ '//     Underscore.js 1.7.0
//     http://underscorejs.org
//     (c) 2009-2014 Jeremy Ashkenas, DocumentCloud and Investigative Reporters & Editors
//     Underscore may be freely distributed under the MIT license.
(function(){var n=this,t=n._,r=Array.prototype,e=Object.prototype,u=Function.prototype,i=r.push,a=r.slice,o=r.concat,l=e.toString,c=e.hasOwnProperty,f=Array.isArray,s=Object.keys,p=u.bind,h=function(n){return n instanceof h?n:this instanceof h?void(this._wrapped=n):new h(n)};"undefined"!=typeof exports?("undefined"!=typeof module&&module.exports&&(exports=module.exports=h),exports._=h):n._=h,h.VERSION="1.7.0";var g=function(n,t,r){if(t===void 0)return n;switch(null==r?3:r){case 1:return function(r){return n.call(t,r)};case 2:return function(r,e){return n.call(t,r,e)};case 3:return function(r,e,u){return n.call(t,r,e,u)};case 4:return function(r,e,u,i){return n.call(t,r,e,u,i)}}return function(){return n.apply(t,arguments)}};h.iteratee=function(n,t,r){return null==n?h.identity:h.isFunction(n)?g(n,t,r):h.isObject(n)?h.matches(n):h.property(n)},h.each=h.forEach=function(n,t,r){if(null==n)return n;t=g(t,r);var e,u=n.length;if(u===+u)for(e=0;u>e;e++)t(n[e],e,n);else{var i=h.keys(n);for(e=0,u=i.length;u>e;e++)t(n[i[e]],i[e],n)}return n},h.map=h.collect=function(n,t,r){if(null==n)return[];t=h.iteratee(t,r);for(var e,u=n.length!==+n.length&&h.keys(n),i=(u||n).length,a=Array(i),o=0;i>o;o++)e=u?u[o]:o,a[o]=t(n[e],e,n);return a};var v="Reduce of empty array with no initial value";h.reduce=h.foldl=h.inject=function(n,t,r,e){null==n&&(n=[]),t=g(t,e,4);var u,i=n.length!==+n.length&&h.keys(n),a=(i||n).length,o=0;if(arguments.length<3){if(!a)throw new TypeError(v);r=n[i?i[o++]:o++]}for(;a>o;o++)u=i?i[o]:o,r=t(r,n[u],u,n);return r},h.reduceRight=h.foldr=function(n,t,r,e){null==n&&(n=[]),t=g(t,e,4);var u,i=n.length!==+n.length&&h.keys(n),a=(i||n).length;if(arguments.length<3){if(!a)throw new TypeError(v);r=n[i?i[--a]:--a]}for(;a--;)u=i?i[a]:a,r=t(r,n[u],u,n);return r},h.find=h.detect=function(n,t,r){var e;return t=h.iteratee(t,r),h.some(n,function(n,r,u){return t(n,r,u)?(e=n,!0):void 0}),e},h.filter=h.select=function(n,t,r){var e=[];return null==n?e:(t=h.iteratee(t,r),h.each(n,function(n,r,u){t(n,r,u)&&e.push(n)}),e)},h.reject=function(n,t,r){return h.filter(n,h.negate(h.iteratee(t)),r)},h.every=h.all=function(n,t,r){if(null==n)return!0;t=h.iteratee(t,r);var e,u,i=n.length!==+n.length&&h.keys(n),a=(i||n).length;for(e=0;a>e;e++)if(u=i?i[e]:e,!t(n[u],u,n))return!1;return!0},h.some=h.any=function(n,t,r){if(null==n)return!1;t=h.iteratee(t,r);var e,u,i=n.length!==+n.length&&h.keys(n),a=(i||n).length;for(e=0;a>e;e++)if(u=i?i[e]:e,t(n[u],u,n))return!0;return!1},h.contains=h.include=function(n,t){return null==n?!1:(n.length!==+n.length&&(n=h.values(n)),h.indexOf(n,t)>=0)},h.invoke=function(n,t){var r=a.call(arguments,2),e=h.isFunction(t);return h.map(n,function(n){return(e?t:n[t]).apply(n,r)})},h.pluck=function(n,t){return h.map(n,h.property(t))},h.where=function(n,t){return h.filter(n,h.matches(t))},h.findWhere=function(n,t){return h.find(n,h.matches(t))},h.max=function(n,t,r){var e,u,i=-1/0,a=-1/0;if(null==t&&null!=n){n=n.length===+n.length?n:h.values(n);for(var o=0,l=n.length;l>o;o++)e=n[o],e>i&&(i=e)}else t=h.iteratee(t,r),h.each(n,function(n,r,e){u=t(n,r,e),(u>a||u===-1/0&&i===-1/0)&&(i=n,a=u)});return i},h.min=function(n,t,r){var e,u,i=1/0,a=1/0;if(null==t&&null!=n){n=n.length===+n.length?n:h.values(n);for(var o=0,l=n.length;l>o;o++)e=n[o],i>e&&(i=e)}else t=h.iteratee(t,r),h.each(n,function(n,r,e){u=t(n,r,e),(a>u||1/0===u&&1/0===i)&&(i=n,a=u)});return i},h.shuffle=function(n){for(var t,r=n&&n.length===+n.length?n:h.values(n),e=r.length,u=Array(e),i=0;e>i;i++)t=h.random(0,i),t!==i&&(u[i]=u[t]),u[t]=r[i];return u},h.sample=function(n,t,r){return null==t||r?(n.length!==+n.length&&(n=h.values(n)),n[h.random(n.length-1)]):h.shuffle(n).slice(0,Math.max(0,t))},h.sortBy=function(n,t,r){return t=h.iteratee(t,r),h.pluck(h.map(n,function(n,r,e){return{value:n,index:r,criteria:t(n,r,e)}}).sort(function(n,t){var r=n.criteria,e=t.criteria;if(r!==e){if(r>e||r===void 0)return 1;if(e>r||e===void 0)return-1}return n.index-t.index}),"value")};var m=function(n){return function(t,r,e){var u={};return r=h.iteratee(r,e),h.each(t,function(e,i){var a=r(e,i,t);n(u,e,a)}),u}};h.groupBy=m(function(n,t,r){h.has(n,r)?n[r].push(t):n[r]=[t]}),h.indexBy=m(function(n,t,r){n[r]=t}),h.countBy=m(function(n,t,r){h.has(n,r)?n[r]++:n[r]=1}),h.sortedIndex=function(n,t,r,e){r=h.iteratee(r,e,1);for(var u=r(t),i=0,a=n.length;a>i;){var o=i+a>>>1;r(n[o])<u?i=o+1:a=o}return i},h.toArray=function(n){return n?h.isArray(n)?a.call(n):n.length===+n.length?h.map(n,h.identity):h.values(n):[]},h.size=function(n){return null==n?0:n.length===+n.length?n.length:h.keys(n).length},h.partition=function(n,t,r){t=h.iteratee(t,r);var e=[],u=[];return h.each(n,function(n,r,i){(t(n,r,i)?e:u).push(n)}),[e,u]},h.first=h.head=h.take=function(n,t,r){return null==n?void 0:null==t||r?n[0]:0>t?[]:a.call(n,0,t)},h.initial=function(n,t,r){return a.call(n,0,Math.max(0,n.length-(null==t||r?1:t)))},h.last=function(n,t,r){return null==n?void 0:null==t||r?n[n.length-1]:a.call(n,Math.max(n.length-t,0))},h.rest=h.tail=h.drop=function(n,t,r){return a.call(n,null==t||r?1:t)},h.compact=function(n){return h.filter(n,h.identity)};var y=function(n,t,r,e){if(t&&h.every(n,h.isArray))return o.apply(e,n);for(var u=0,a=n.length;a>u;u++){var l=n[u];h.isArray(l)||h.isArguments(l)?t?i.apply(e,l):y(l,t,r,e):r||e.push(l)}return e};h.flatten=function(n,t){return y(n,t,!1,[])},h.without=function(n){return h.difference(n,a.call(arguments,1))},h.uniq=h.unique=function(n,t,r,e){if(null==n)return[];h.isBoolean(t)||(e=r,r=t,t=!1),null!=r&&(r=h.iteratee(r,e));for(var u=[],i=[],a=0,o=n.length;o>a;a++){var l=n[a];if(t)a&&i===l||u.push(l),i=l;else if(r){var c=r(l,a,n);h.indexOf(i,c)<0&&(i.push(c),u.push(l))}else h.indexOf(u,l)<0&&u.push(l)}return u},h.union=function(){return h.uniq(y(arguments,!0,!0,[]))},h.intersection=function(n){if(null==n)return[];for(var t=[],r=arguments.length,e=0,u=n.length;u>e;e++){var i=n[e];if(!h.contains(t,i)){for(var a=1;r>a&&h.contains(arguments[a],i);a++);a===r&&t.push(i)}}return t},h.difference=function(n){var t=y(a.call(arguments,1),!0,!0,[]);return h.filter(n,function(n){return!h.contains(t,n)})},h.zip=function(n){if(null==n)return[];for(var t=h.max(arguments,"length").length,r=Array(t),e=0;t>e;e++)r[e]=h.pluck(arguments,e);return r},h.object=function(n,t){if(null==n)return{};for(var r={},e=0,u=n.length;u>e;e++)t?r[n[e]]=t[e]:r[n[e][0]]=n[e][1];return r},h.indexOf=function(n,t,r){if(null==n)return-1;var e=0,u=n.length;if(r){if("number"!=typeof r)return e=h.sortedIndex(n,t),n[e]===t?e:-1;e=0>r?Math.max(0,u+r):r}for(;u>e;e++)if(n[e]===t)return e;return-1},h.lastIndexOf=function(n,t,r){if(null==n)return-1;var e=n.length;for("number"==typeof r&&(e=0>r?e+r+1:Math.min(e,r+1));--e>=0;)if(n[e]===t)return e;return-1},h.range=function(n,t,r){arguments.length<=1&&(t=n||0,n=0),r=r||1;for(var e=Math.max(Math.ceil((t-n)/r),0),u=Array(e),i=0;e>i;i++,n+=r)u[i]=n;return u};var d=function(){};h.bind=function(n,t){var r,e;if(p&&n.bind===p)return p.apply(n,a.call(arguments,1));if(!h.isFunction(n))throw new TypeError("Bind must be called on a function");return r=a.call(arguments,2),e=function(){if(!(this instanceof e))return n.apply(t,r.concat(a.call(arguments)));d.prototype=n.prototype;var u=new d;d.prototype=null;var i=n.apply(u,r.concat(a.call(arguments)));return h.isObject(i)?i:u}},h.partial=function(n){var t=a.call(arguments,1);return function(){for(var r=0,e=t.slice(),u=0,i=e.length;i>u;u++)e[u]===h&&(e[u]=arguments[r++]);for(;r<arguments.length;)e.push(arguments[r++]);return n.apply(this,e)}},h.bindAll=function(n){var t,r,e=arguments.length;if(1>=e)throw new Error("bindAll must be passed function names");for(t=1;e>t;t++)r=arguments[t],n[r]=h.bind(n[r],n);return n},h.memoize=function(n,t){var r=function(e){var u=r.cache,i=t?t.apply(this,arguments):e;return h.has(u,i)||(u[i]=n.apply(this,arguments)),u[i]};return r.cache={},r},h.delay=function(n,t){var r=a.call(arguments,2);return setTimeout(function(){return n.apply(null,r)},t)},h.defer=function(n){return h.delay.apply(h,[n,1].concat(a.call(arguments,1)))},h.throttle=function(n,t,r){var e,u,i,a=null,o=0;r||(r={});var l=function(){o=r.leading===!1?0:h.now(),a=null,i=n.apply(e,u),a||(e=u=null)};return function(){var c=h.now();o||r.leading!==!1||(o=c);var f=t-(c-o);return e=this,u=arguments,0>=f||f>t?(clearTimeout(a),a=null,o=c,i=n.apply(e,u),a||(e=u=null)):a||r.trailing===!1||(a=setTimeout(l,f)),i}},h.debounce=function(n,t,r){var e,u,i,a,o,l=function(){var c=h.now()-a;t>c&&c>0?e=setTimeout(l,t-c):(e=null,r||(o=n.apply(i,u),e||(i=u=null)))};return function(){i=this,u=arguments,a=h.now();var c=r&&!e;return e||(e=setTimeout(l,t)),c&&(o=n.apply(i,u),i=u=null),o}},h.wrap=function(n,t){return h.partial(t,n)},h.negate=function(n){return function(){return!n.apply(this,arguments)}},h.compose=function(){var n=arguments,t=n.length-1;return function(){for(var r=t,e=n[t].apply(this,arguments);r--;)e=n[r].call(this,e);return e}},h.after=function(n,t){return function(){return--n<1?t.apply(this,arguments):void 0}},h.before=function(n,t){var r;return function(){return--n>0?r=t.apply(this,arguments):t=null,r}},h.once=h.partial(h.before,2),h.keys=function(n){if(!h.isObject(n))return[];if(s)return s(n);var t=[];for(var r in n)h.has(n,r)&&t.push(r);return t},h.values=function(n){for(var t=h.keys(n),r=t.length,e=Array(r),u=0;r>u;u++)e[u]=n[t[u]];return e},h.pairs=function(n){for(var t=h.keys(n),r=t.length,e=Array(r),u=0;r>u;u++)e[u]=[t[u],n[t[u]]];return e},h.invert=function(n){for(var t={},r=h.keys(n),e=0,u=r.length;u>e;e++)t[n[r[e]]]=r[e];return t},h.functions=h.methods=function(n){var t=[];for(var r in n)h.isFunction(n[r])&&t.push(r);return t.sort()},h.extend=function(n){if(!h.isObject(n))return n;for(var t,r,e=1,u=arguments.length;u>e;e++){t=arguments[e];for(r in t)c.call(t,r)&&(n[r]=t[r])}return n},h.pick=function(n,t,r){var e,u={};if(null==n)return u;if(h.isFunction(t)){t=g(t,r);for(e in n){var i=n[e];t(i,e,n)&&(u[e]=i)}}else{var l=o.apply([],a.call(arguments,1));n=new Object(n);for(var c=0,f=l.length;f>c;c++)e=l[c],e in n&&(u[e]=n[e])}return u},h.omit=function(n,t,r){if(h.isFunction(t))t=h.negate(t);else{var e=h.map(o.apply([],a.call(arguments,1)),String);t=function(n,t){return!h.contains(e,t)}}return h.pick(n,t,r)},h.defaults=function(n){if(!h.isObject(n))return n;for(var t=1,r=arguments.length;r>t;t++){var e=arguments[t];for(var u in e)n[u]===void 0&&(n[u]=e[u])}return n},h.clone=function(n){return h.isObject(n)?h.isArray(n)?n.slice():h.extend({},n):n},h.tap=function(n,t){return t(n),n};var b=function(n,t,r,e){if(n===t)return 0!==n||1/n===1/t;if(null==n||null==t)return n===t;n instanceof h&&(n=n._wrapped),t instanceof h&&(t=t._wrapped);var u=l.call(n);if(u!==l.call(t))return!1;switch(u){case"[object RegExp]":case"[object String]":return""+n==""+t;case"[object Number]":return+n!==+n?+t!==+t:0===+n?1/+n===1/t:+n===+t;case"[object Date]":case"[object Boolean]":return+n===+t}if("object"!=typeof n||"object"!=typeof t)return!1;for(var i=r.length;i--;)if(r[i]===n)return e[i]===t;var a=n.constructor,o=t.constructor;if(a!==o&&"constructor"in n&&"constructor"in t&&!(h.isFunction(a)&&a instanceof a&&h.isFunction(o)&&o instanceof o))return!1;r.push(n),e.push(t);var c,f;if("[object Array]"===u){if(c=n.length,f=c===t.length)for(;c--&&(f=b(n[c],t[c],r,e)););}else{var s,p=h.keys(n);if(c=p.length,f=h.keys(t).length===c)for(;c--&&(s=p[c],f=h.has(t,s)&&b(n[s],t[s],r,e)););}return r.pop(),e.pop(),f};h.isEqual=function(n,t){return b(n,t,[],[])},h.isEmpty=function(n){if(null==n)return!0;if(h.isArray(n)||h.isString(n)||h.isArguments(n))return 0===n.length;for(var t in n)if(h.has(n,t))return!1;return!0},h.isElement=function(n){return!(!n||1!==n.nodeType)},h.isArray=f||function(n){return"[object Array]"===l.call(n)},h.isObject=function(n){var t=typeof n;return"function"===t||"object"===t&&!!n},h.each(["Arguments","Function","String","Number","Date","RegExp"],function(n){h["is"+n]=function(t){return l.call(t)==="[object "+n+"]"}}),h.isArguments(arguments)||(h.isArguments=function(n){return h.has(n,"callee")}),"function"!=typeof/./&&(h.isFunction=function(n){return"function"==typeof n||!1}),h.isFinite=function(n){return isFinite(n)&&!isNaN(parseFloat(n))},h.isNaN=function(n){return h.isNumber(n)&&n!==+n},h.isBoolean=function(n){return n===!0||n===!1||"[object Boolean]"===l.call(n)},h.isNull=function(n){return null===n},h.isUndefined=function(n){return n===void 0},h.has=function(n,t){return null!=n&&c.call(n,t)},h.noConflict=function(){return n._=t,this},h.identity=function(n){return n},h.constant=function(n){return function(){return n}},h.noop=function(){},h.property=function(n){return function(t){return t[n]}},h.matches=function(n){var t=h.pairs(n),r=t.length;return function(n){if(null==n)return!r;n=new Object(n);for(var e=0;r>e;e++){var u=t[e],i=u[0];if(u[1]!==n[i]||!(i in n))return!1}return!0}},h.times=function(n,t,r){var e=Array(Math.max(0,n));t=g(t,r,1);for(var u=0;n>u;u++)e[u]=t(u);return e},h.random=function(n,t){return null==t&&(t=n,n=0),n+Math.floor(Math.random()*(t-n+1))},h.now=Date.now||function(){return(new Date).getTime()};var _={"&":"&amp;","<":"&lt;",">":"&gt;",''"'':"&quot;","''":"&#x27;","`":"&#x60;"},w=h.invert(_),j=function(n){var t=function(t){return n[t]},r="(?:"+h.keys(n).join("|")+")",e=RegExp(r),u=RegExp(r,"g");return function(n){return n=null==n?"":""+n,e.test(n)?n.replace(u,t):n}};h.escape=j(_),h.unescape=j(w),h.result=function(n,t){if(null==n)return void 0;var r=n[t];return h.isFunction(r)?n[t]():r};var x=0;h.uniqueId=function(n){var t=++x+"";return n?n+t:t},h.templateSettings={evaluate:/<%([\s\S]+?)%>/g,interpolate:/<%=([\s\S]+?)%>/g,escape:/<%-([\s\S]+?)%>/g};var A=/(.)^/,k={"''":"''","\\":"\\","\r":"r","\n":"n","\u2028":"u2028","\u2029":"u2029"},O=/\\|''|\r|\n|\u2028|\u2029/g,F=function(n){return"\\"+k[n]};h.template=function(n,t,r){!t&&r&&(t=r),t=h.defaults({},t,h.templateSettings);var e=RegExp([(t.escape||A).source,(t.interpolate||A).source,(t.evaluate||A).source].join("|")+"|$","g"),u=0,i="__p+=''";n.replace(e,function(t,r,e,a,o){return i+=n.slice(u,o).replace(O,F),u=o+t.length,r?i+="''+\n((__t=("+r+"))==null?'''':_.escape(__t))+\n''":e?i+="''+\n((__t=("+e+"))==null?'''':__t)+\n''":a&&(i+="'';\n"+a+"\n__p+=''"),t}),i+="'';\n",t.variable||(i="with(obj||{}){\n"+i+"}\n"),i="var __t,__p='''',__j=Array.prototype.join,"+"print=function(){__p+=__j.call(arguments,'''');};\n"+i+"return __p;\n";try{var a=new Function(t.variable||"obj","_",i)}catch(o){throw o.source=i,o}var l=function(n){return a.call(this,n,h)},c=t.variable||"obj";return l.source="function("+c+"){\n"+i+"}",l},h.chain=function(n){var t=h(n);return t._chain=!0,t};var E=function(n){return this._chain?h(n).chain():n};h.mixin=function(n){h.each(h.functions(n),function(t){var r=h[t]=n[t];h.prototype[t]=function(){var n=[this._wrapped];return i.apply(n,arguments),E.call(this,r.apply(h,n))}})},h.mixin(h),h.each(["pop","push","reverse","shift","sort","splice","unshift"],function(n){var t=r[n];h.prototype[n]=function(){var r=this._wrapped;return t.apply(r,arguments),"shift"!==n&&"splice"!==n||0!==r.length||delete r[0],E.call(this,r)}}),h.each(["concat","join","slice"],function(n){var t=r[n];h.prototype[n]=function(){return E.call(this,t.apply(this._wrapped,arguments))}}),h.prototype.value=function(){return this._wrapped},"function"==typeof define&&define.amd&&define("underscore",[],function(){return h})}).call(this);
//# sourceMappingURL=underscore-min.map'
]

{ #category : #uploaded }
WASwaggerUIFileLibrary >> wordnikapiPng [
	^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 24 0 0 0 24 8 6 0 0 0 224 119 61 248 0 0 0 4 115 66 73 84 8 8 8 8 124 8 100 136 0 0 0 9 112 72 89 115 0 0 11 18 0 0 11 18 1 210 221 126 252 0 0 0 28 116 69 88 116 83 111 102 116 119 97 114 101 0 65 100 111 98 101 32 70 105 114 101 119 111 114 107 115 32 67 83 53 113 181 227 54 0 0 3 78 73 68 65 84 72 137 165 149 77 104 92 85 20 199 127 103 38 141 25 39 51 163 180 4 133 76 103 146 110 148 44 172 27 237 162 173 168 17 69 140 90 90 23 214 68 144 186 40 69 71 196 149 182 216 9 85 176 32 104 165 248 65 106 193 166 95 11 43 165 173 72 64 2 126 33 45 10 226 194 110 236 76 210 137 216 136 85 39 147 233 75 156 123 223 113 145 153 201 125 243 1 3 254 225 240 238 253 191 115 254 231 220 143 119 158 208 33 150 142 246 111 3 198 0 139 112 184 231 185 185 175 58 137 235 234 52 1 202 243 192 163 213 177 7 116 148 32 212 137 211 210 145 254 181 248 12 227 67 213 70 150 142 244 39 26 253 110 124 214 47 141 92 96 5 222 209 100 23 203 156 1 60 148 183 35 123 10 63 0 104 69 118 3 221 142 235 45 192 11 192 155 0 222 7 201 7 129 113 230 41 121 31 39 31 143 236 42 84 106 142 245 140 222 161 100 148 48 231 128 7 28 161 51 64 18 184 167 205 226 46 2 191 3 79 58 220 151 88 70 34 47 21 150 130 43 16 186 213 178 177 65 96 123 27 225 26 238 109 193 109 16 89 221 250 250 32 146 41 252 141 149 113 172 240 255 140 108 36 83 184 209 148 0 0 19 250 16 203 21 44 4 204 84 173 221 124 213 46 203 191 107 142 187 146 129 67 54 183 255 83 9 255 22 95 174 19 10 34 124 10 92 6 182 42 220 7 32 43 87 244 107 224 78 85 118 172 158 36 97 255 102 47 112 147 234 147 242 91 169 8 134 23 129 131 171 242 58 26 221 119 245 100 221 231 141 245 147 0 209 125 87 199 28 110 39 200 113 71 235 85 66 28 142 190 54 187 8 32 229 108 106 51 48 130 240 20 48 224 36 255 54 186 127 118 139 91 77 57 155 78 0 68 179 51 197 0 63 158 250 6 216 236 80 215 80 206 2 83 93 248 76 40 220 33 43 37 187 152 163 1 141 194 53 168 13 250 10 220 6 236 6 30 10 169 149 40 86 208 166 131 149 225 197 189 233 190 86 130 46 22 247 166 251 48 50 236 198 170 5 181 130 90 233 9 97 249 4 203 175 24 1 227 92 55 159 117 88 78 151 179 233 182 253 202 123 39 29 194 114 114 197 183 26 87 215 225 71 44 239 10 192 226 43 233 30 194 108 81 37 3 60 22 92 63 167 136 234 104 108 124 214 119 233 210 254 84 136 178 76 34 236 108 200 251 185 8 7 41 242 93 239 71 51 126 224 74 149 50 233 24 97 242 192 218 134 160 83 244 202 104 236 64 222 7 40 29 72 11 127 113 2 120 186 193 239 58 62 131 177 67 51 11 53 162 169 251 149 50 3 223 3 155 90 236 200 5 233 98 7 128 26 78 19 236 63 53 252 20 123 47 127 183 75 4 18 44 236 25 216 138 48 13 132 91 4 3 76 85 159 15 183 121 175 40 79 196 223 207 159 111 74 176 176 107 32 196 26 166 128 225 54 193 157 226 103 44 155 226 19 121 15 220 86 17 146 94 44 131 78 45 32 252 9 196 128 155 90 212 10 194 50 80 66 89 231 236 69 31 144 0 60 112 154 93 124 34 183 160 134 17 53 252 161 134 235 234 243 186 95 145 33 223 112 151 26 206 170 129 128 249 156 247 13 27 253 138 12 169 207 203 106 152 83 195 188 111 184 63 62 145 187 214 180 69 53 20 159 29 92 15 248 137 99 185 250 215 89 28 27 76 33 228 220 130 80 134 18 147 185 95 28 159 91 17 186 19 199 114 243 174 94 83 130 118 40 62 179 225 11 224 145 234 244 82 226 196 149 86 63 155 38 116 244 211 7 80 203 180 214 219 0 211 157 198 253 7 237 232 88 157 205 11 93 243 0 0 0 0 73 69 78 68 174 66 96 130]
]
