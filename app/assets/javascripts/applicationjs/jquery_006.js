!function(t){"use strict";var n=function(n,i){var o=t(n),s={speed:30,startPosition:0},e=t.extend(s,i);this.bind=function(){var n=this;t(window).on("scroll",function(){n.update()}).resize(function(){n.update()}),this.update()},this.update=function(){var n=o.offset().top,s=t(window).scrollTop(),a=o.innerHeight(),r=t(window).height();s>n+a||n>s+r||o.css("backgroundPosition","50% "+(i.startPosition+s-n)*(e.speed/100)+"px")}};t.fn.parallax=function(t){var i=new n(this,t);this.length&&i.bind()}}(jQuery);