<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-05-09
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>底部导航栏</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!--<link href="../css/android_miner.css" rel="stylesheet" type="text/css" />-->
    <script src="${pageContext.request.contextPath}/android/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var baseURL="${pageContext.request.contextPath}";
            $("#main").click(function () {
                window.location.href=baseURL+"/android/BillOfFareServlet?action=doShow";
            })
            $("#yuding").click(function () {
                window.location.href=baseURL+"/android/BillOfFareServlet?action=doShow";
            })
            $("#zhangdan").click(function () {
                window.location.href=baseURL+"/android/BillOfFareServlet?action=doShow";
            })
            $("#gouwuche").click(function () {
                window.location.href=baseURL+"/android/Cart/cart-settlement.html";
            })
            $("#wode").click(function () {
                window.location.href=baseURL+"/android/Minner/Minner.html";
            })

        });
    </script>
    <style type="text/css">
        .footer_body{
            height: 100%;
            background: #efefef;
        }
        .aui-footer-fixed {
            position: fixed;
            bottom: 0;
            left: 0;
            z-index: 49;
        }

        .aui-footer {
            width: 100%;
            /*position: relative;*/
            z-index: 100;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            padding: 7px 5px 7px 5px;
            background: #f9f9f9;
        }

        .aui-tabBar-item {
            -webkit-box-flex: 1;
            -webkit-flex: 1;
            -ms-flex: 1;
            flex: 1;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            color: #979797;
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        a {
            text-decoration: none;
            color: #000;
        }

        .img-loan {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADcAAAA3CAIAAAAnuUURAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ1IDc5LjE2MzQ5OSwgMjAxOC8wOC8xMy0xNjo0MDoyMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Q0U1RjhEQ0U3QTlGMTFFOUFDRDlBOUJBRjcxMjU5MEEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Q0U1RjhEQ0Y3QTlGMTFFOUFDRDlBOUJBRjcxMjU5MEEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDRTVGOERDQzdBOUYxMUU5QUNEOUE5QkFGNzEyNTkwQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRTVGOERDRDdBOUYxMUU5QUNEOUE5QkFGNzEyNTkwQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoOjZ7QAAATgSURBVHja7FnZSitBEDVjFPcN3OKDPojikyCKCyiC4O6HuuCbKyouICKCj4IgooJGEcR9j/fgkbp1eyYzmUmUe7nph9Dp9HSfPlV1qnoSen5+zvjrm5XxL7Q0yjTKNMqgLez3gVAo9PHxoTtssVhsb28vGo1mZWVFIpH6+nr3x/1tGkAvsRMwscNd7+/vFxcXr66uZA6A9vX1ATH6mGBZFjvBuAyCEpsJPrSHh4fZ2dnb29uysrLm5ua3t7fd3d27u7uKioqBgQEAlVMBq6MdUo+SW2I/fgINIQomzMHg/Pz8zc1NeXn54OAggfJIAvR7o4dEcj8NUaMpLCzE14KCgsvLy4WFBbArHoIOPn8ixglFIFZWVoLFcDiszwCIIyMj+fn55+fn4BXg+NPPKZH2RUDs7+/Pzs62TwNEAC0uLr64uJibm3t/f6cFyOu3o0REi6EJUbuaEIZBAIXpi4qKyOjr62swRi0XsxodNhgaxCAyJFyMaJCvfBCmHxoaAlAwCh8FUEeU7tAtzygRxyeLDF4YWoeLOxNgdHh4GCEFoJDVl5cXriaK5imlbhZnPFKQ0aehr6+vwSLoyczMFFXyjLa8vDwChekJlPIZ+2zx7JaoxUU7dLiARWyQuDKTM5hegNL0DCYtT/EWtPzqIkVHMp6nSnMRQhGg9NHEddTyq4uS8TRElw04QSZr0yeuo1YAXaQvahY9fP9zpqRyBpMvHbUC6KIkZU8F0RbXZZFfHbU8IaLvoovxWNTarjsyTh3FV9FRlwUte3HKehEQ4ZEcYaVjMKejUnPMcXs0SAxpoOww6mF6Xd394dN6Ce70+PhIFlF3OYaCo2DRB3QpafiZnEGOJBPoo4bptciYFgd/MzMzIjqenocjra+vT0xMTE1NnZyccD464+Pjk5OTGxsbT09PjncJKeDRYHrwyswEoPr8pNbSQ+KLYBEQGdF2/oU/KMD09PTBwQHOhrS5srJydHR0eHi4vLyMRbDa/v4+JuAkogz6cVmQ1ZMWfPn1K/9p91paWpLsosNFG0tMif7Ozg5yHadhHI61uroKatERQOBye3tbWNHg9JkBdHR0lIK/ubkp7vuVhLUVcHGpra016kUBJxAF9NnZmfiWHB0QDeOCIf7kkofxmZubCx2tqqoqLS01LqthvWJ3d7ddZWR7gShL8KuOXMdER1dzyaXyFE0vUfg7D7ukDUN37MIL3zBU0DHUQI97ftJPaU+Q3BHwRsFOS0sLKg/79noEE1pbW7X5fujeI3FQUlLS0dHhKAIy2NPTAzkU8wW49ATnkkDRGhsbOzs7Bb2h8zhDXV2ddkotRt/4nkiACtampibsurW1JYpINF1dXQ0NDUb5qOd8L0pD87ArgKLAWVtbg4Dj15ycnN7e3kgkYryu8bx7pBKlEQfkqaamZmxsDJKOPnxRKglBZry68UVnQIs76ggyB2TZqDOMq7oRW8lGj1Gb+HIGv/OTemugozLlr3eNPJ6sErnX5Mn7ib2mDqiXyYRngk0upUFQok5h9c5VUosMy/LuK9e3eJnJAyU0D0+i4MOKqaUTFTRlCyWLZ5h6KBEKhdPTU1Tgx8fHwf5ecHdN6H97e3sK3qvj0Ci2o9EobgiBX+baGwxdXV3d1tZGp0r9fxTp/87SKNMo0yj/R5S/BBgAKJnXGnAx0ocAAAAASUVORK5CYII=');
        }

        .img-ions {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADcAAAA3CAIAAAAnuUURAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ1IDc5LjE2MzQ5OSwgMjAxOC8wOC8xMy0xNjo0MDoyMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RUIxNUMyREI3QTlGMTFFOUFDRDlBOUJBRjcxMjU5MEEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RUIxNUMyREM3QTlGMTFFOUFDRDlBOUJBRjcxMjU5MEEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpFQjE1QzJEOTdBOUYxMUU5QUNEOUE5QkFGNzEyNTkwQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpFQjE1QzJEQTdBOUYxMUU5QUNEOUE5QkFGNzEyNTkwQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtwlS9gAAASOSURBVHja7FlHTysxEGadpXcQTaIJgVAEogQu/AGOiDs3fiB/AMQZKYgILhzIgXYhCR0hWsj7yMAwz7vZeAt6RevDyuvY42+nfDN2rOfn55q/vqmaf6HFKGOUMcoY5Z9vtnNoc3Pz/Py8VCqh39LSMjk5OTMzY1lW5HtDJu1S9VfFQ3IG//zw8JDJZNLptIe48BDl7jz4/v7+PRkZ0vWbMILx09PTra0tpdTa2lptbe1PqBNoJEonGLyqUrk51Umzh4eH+/r6ICifz0cIjnF8IFCKlUKbaigxqOg3TcPSEF1dXVh2c3MTodGlRmhfYJX60oG+vLxgHk1yWhydw8PDnZ0dTCgWi9EamjdtbW3t7u5OJpMDAwO8L6mZ/MGWs7UZNNjZ2Yk5dXV1EaJkBLTLfbmdnJzMzs6mUimakEgk3t7e8ETfJvXy0+nCQEl2WV9fj9Y1WVWPj4/Hx8e7u7v7+/ujo6PwMU3ZSnNnZ2toaGhubn59fcXnVvKtkNHd1NQ0NTU1PT1NDsbCeQtl8tEdHR3o3N7eusZp8LynlJTW3t4O3FAHh5TO6pWYghpMgOf19XW0KBkK6QxaAG7o1WklVZUp0EiXQKn5biR8xBwJSsYT9Cx38VFtsC69M2+AAGKB0CIljt7eXiYcfyjb2togDhb5CYjknYVCAcyN4qaxsVELHVOUIEvXMA9vbrI1+qTI/v5+3/WldEGwJj766urKO84CY724uCBzu0pWhjUBUOLJZORadIVJ6Bw6Tp768ApDcQhzSOSaI6pIJ2nIPZCM9EF5TkbVZ01kKIsqo8vLy0r1cphCOJfLQXM9PT0SouQjI1bHbIQ5BKF055qDXSqAOrW10inZ0DzHi9U1oCjUUV8hzAGU+UwzjV8a4g50SSi1KpinVc89XCOTayLMI3FKSo+QgPIMMqFC5nP0jXKPVt/TGnJtiTKMX5Jl4T+o1vAERNu2WSYfHEi+bW4XJqPiV4MsPKEMHkEfg3KEJzgno93d3T09PaHUnZubkztq5rJMbllJqSCLjY0N1CwgjqgyJB0nlpaWBgcH/d0auNodT4jDR+PTPw4itp34ana5yUHqwKbU4Vfu40m/giORu7UzjD+Umv9BKPgIldHq6ipVSSZXFIaHCm8hyoTVZJ6kAHJGawDK1A5bvm+zaP1vdyBlWUS8OOy5err5ZYH8NhPSrcJE/EpSxsbGQO9AmU6n4aB+Da3RMIOrqlHL1z8pEHd2dra9vQ0S4QN1AOLkAyRWIbqXl5fZQf35pXRHKX1oaGhlZWVkZKS+vp6vTQwhSuN8pr6yBOedVihdahEdrNRwvWqL8i5YXoQEyOMcbewqhhLsAAkDTpnJZI6OjjAyPj6eSqXk+d97OfDt7e1ls1n0JyYmDNfafo2FbQDx4OCAEKODwcXFRUM7ACItQZNrg7N6pc2gRVliQjHmEaNNhiiTalr5tbjzeGl47pYV7vdRQeRujxymArg/fJH3wxOvJgFHIOCLEj3ShOvlVli/RKOLULIdRY+5+ufn5+XahYUFkwxpxf/ixyhjlP81yl8CDADUvepZv3NQugAAAABJRU5ErkJggg==');
        }

        .img-credit {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADcAAAA3CAIAAAAnuUURAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ1IDc5LjE2MzQ5OSwgMjAxOC8wOC8xMy0xNjo0MDoyMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RUIxNUMyRDM3QTlGMTFFOUFDRDlBOUJBRjcxMjU5MEEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RUIxNUMyRDQ3QTlGMTFFOUFDRDlBOUJBRjcxMjU5MEEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDRTVGOEREMDdBOUYxMUU5QUNEOUE5QkFGNzEyNTkwQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpFQjE1QzJEMjdBOUYxMUU5QUNEOUE5QkFGNzEyNTkwQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsU8m5AAAAapSURBVHja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');
        }

        .img-car {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADcAAAA3CAIAAAAnuUURAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ1IDc5LjE2MzQ5OSwgMjAxOC8wOC8xMy0xNjo0MDoyMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RUIxNUMyREI3QTlGMTFFOUFDRDlBOUJBRjcxMjU5MEEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RUIxNUMyREM3QTlGMTFFOUFDRDlBOUJBRjcxMjU5MEEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpFQjE1QzJEOTdBOUYxMUU5QUNEOUE5QkFGNzEyNTkwQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpFQjE1QzJEQTdBOUYxMUU5QUNEOUE5QkFGNzEyNTkwQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtwlS9gAAASOSURBVHja7FlHTysxEGadpXcQTaIJgVAEogQu/AGOiDs3fiB/AMQZKYgILhzIgXYhCR0hWsj7yMAwz7vZeAt6RevDyuvY42+nfDN2rOfn55q/vqmaf6HFKGOUMcoY5Z9vtnNoc3Pz/Py8VCqh39LSMjk5OTMzY1lW5HtDJu1S9VfFQ3IG//zw8JDJZNLptIe48BDl7jz4/v7+PRkZ0vWbMILx09PTra0tpdTa2lptbe1PqBNoJEonGLyqUrk51Umzh4eH+/r6ICifz0cIjnF8IFCKlUKbaigxqOg3TcPSEF1dXVh2c3MTodGlRmhfYJX60oG+vLxgHk1yWhydw8PDnZ0dTCgWi9EamjdtbW3t7u5OJpMDAwO8L6mZ/MGWs7UZNNjZ2Yk5dXV1EaJkBLTLfbmdnJzMzs6mUimakEgk3t7e8ETfJvXy0+nCQEl2WV9fj9Y1WVWPj4/Hx8e7u7v7+/ujo6PwMU3ZSnNnZ2toaGhubn59fcXnVvKtkNHd1NQ0NTU1PT1NDsbCeQtl8tEdHR3o3N7eusZp8LynlJTW3t4O3FAHh5TO6pWYghpMgOf19XW0KBkK6QxaAG7o1WklVZUp0EiXQKn5biR8xBwJSsYT9Cx38VFtsC69M2+AAGKB0CIljt7eXiYcfyjb2togDhb5CYjknYVCAcyN4qaxsVELHVOUIEvXMA9vbrI1+qTI/v5+3/WldEGwJj766urKO84CY724uCBzu0pWhjUBUOLJZORadIVJ6Bw6Tp768ApDcQhzSOSaI6pIJ2nIPZCM9EF5TkbVZ01kKIsqo8vLy0r1cphCOJfLQXM9PT0SouQjI1bHbIQ5BKF055qDXSqAOrW10inZ0DzHi9U1oCjUUV8hzAGU+UwzjV8a4g50SSi1KpinVc89XCOTayLMI3FKSo+QgPIMMqFC5nP0jXKPVt/TGnJtiTKMX5Jl4T+o1vAERNu2WSYfHEi+bW4XJqPiV4MsPKEMHkEfg3KEJzgno93d3T09PaHUnZubkztq5rJMbllJqSCLjY0N1CwgjqgyJB0nlpaWBgcH/d0auNodT4jDR+PTPw4itp34ana5yUHqwKbU4Vfu40m/giORu7UzjD+Umv9BKPgIldHq6ipVSSZXFIaHCm8hyoTVZJ6kAHJGawDK1A5bvm+zaP1vdyBlWUS8OOy5err5ZYH8NhPSrcJE/EpSxsbGQO9AmU6n4aB+Da3RMIOrqlHL1z8pEHd2dra9vQ0S4QN1AOLkAyRWIbqXl5fZQf35pXRHKX1oaGhlZWVkZKS+vp6vTQwhSuN8pr6yBOedVihdahEdrNRwvWqL8i5YXoQEyOMcbewqhhLsAAkDTpnJZI6OjjAyPj6eSqXk+d97OfDt7e1ls1n0JyYmDNfafo2FbQDx4OCAEKODwcXFRUM7ACItQZNrg7N6pc2gRVliQjHmEaNNhiiTalr5tbjzeGl47pYV7vdRQeRujxymArg/fJH3wxOvJgFHIOCLEj3ShOvlVli/RKOLULIdRY+5+ufn5+XahYUFkwxpxf/ixyhjlP81yl8CDADUvepZv3NQugAAAABJRU5ErkJggg==');
        }

        .img-mine {
            background-image: url('../images/minner2.png');
        }

        .img {
            width: 20px;
            height: 20px;
            display: block;
            border: none;
            float: left;
            background-size: 20px;
            background-repeat: no-repeat;
        }

    </style>

</head>
<body class="footer_body">·

<footer class="aui-footer aui-footer-fixed">
    <a target="footer" class="aui-tabBar-item aui-tabBar-item-active" >
                <span class="aui-tabBar-item-img">
                    <i class="img img-loan"></i>
                </span>
        <span target="footer" class="aui-tabBar-item aui-tabBar-item-active" id="main">首页</span>
    </a>
    <a target="footer" class="aui-tabBar-item ">
                <span class="aui-tabBar-item-img">
                    <i class="img img-ions "></i>
                </span>
        <span class="aui-tabBar-item-text" id="yuding">预订</span>
    </a>
    <a target="footer" class="aui-tabBar-item ">
                <span class="aui-tabBar-item-img">
                    <i class="img img-credit"></i>
                </span>
        <span class="aui-tabBar-item-text" id="zhangdan">账单</span>
    </a>
    <a  target="footer" class="aui-tabBar-item ">
                <span class="aui-tabBar-item-img">
                    <i class="img img-car"></i>
                </span>
        <span class="aui-tabBar-item-text" id="gouwuche">购物车</span>
    </a>

    <a target="footer" class="aui-tabBar-item ">
                <span class="aui-tabBar-item-img">
                    <i class="img img-mine"></i>
                </span>
        <span class="aui-tabBar-item-text" id="wode">我的</span>
    </a>
</footer>
</body>
</html>
