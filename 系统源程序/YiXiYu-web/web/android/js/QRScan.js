const Scan = {

    videoInputDevice: [], //设备列表

    videoElement: document.getElementById("QRvideo"),

    canvasElement: document.getElementById("qr-canvas"),

    decodeTimer: null,

    canvasTimer: null,

    canvasContext: document.getElementById("qr-canvas").getContext("2d"),

    // 获取到的媒体设备

    gotDevices (deviceInfos) {

        let that = this;

        for (let i = 0; i !== deviceInfos.length; ++i) {

            let deviceInfo = deviceInfos[i];

            if (deviceInfo.kind === 'audioinput') {

                // 音频设备

            } else if (deviceInfo.kind === 'videoinput') {

                // 视频设备

                that.videoInputDevice.push(deviceInfo);

            } else {

                // 其他设备

                console.log('Found one other kind of source/device: ', deviceInfo);

            }

        }

    },

    getStream () {

        let that = this;

        if (window.stream) {

            window.stream.getTracks().forEach((track) => {

                track.stop();

        });

        }

        // if(that.isIOS){

        //     let constraints = {

        //         video: { facingMode: { exact: "environment" } }

        //       };

        //     console.log('3: ', constraints);

        //     // let constraints = {

        //     //   video: {

        //     //     // environment表示后置摄像头

        //     //     // user表示前置摄像头

        //     //     facingMode: ("environment")

        //     //   }

        //     // };

        // }else{

        let constraints = {

            // 包含audio 可声明音频设备调用

            // 声明视频设备调用

            // video: true

            video: {

                deviceId: {

                    // [1].deviceId 表示后置摄像头,默认开启的是前置摄像头

                    exact: that.videoInputDevice[1].deviceId

                }

            }

        };

        // }



        // 视频设备初始化

        navigator.mediaDevices.getUserMedia(constraints).then(that.gotStream.bind(that)).catch(that.handleError.bind(that));

        that.captureToCanvas();

        that.decode();

    },



    // 解码

    decode () {

        let that = this;

        try {

            qrcode.decode();

        } catch (e) {

            console.log('1:' + e);

        };

        that.decodeTimer = setTimeout(that.decode.bind(that), 100); // 解码频率为100毫秒一次

    },



    //将视频流放到画布

    captureToCanvas () {

        let that = this;

        try {

            // 根据视频大小设置canvas大小

            let w = that.videoElement.videoWidth;

            let h = that.videoElement.videoHeight;

            that.canvasElement.width = w;

            that.canvasElement.height = h;

            that.canvasContext.drawImage(that.videoElement, 0, 0, w, h);

        } catch (e) {

            console.log(e);

        };

        // 100毫秒绘制一次

        that.canvasTimer = setTimeout(that.captureToCanvas.bind(that), 100);

    },



    handleError (error) {

        $.colorbox.close();

        if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
            if (error.toString().indexOf("TypeError: Cannot read property 'deviceId' of undefined") != -1) {
                alert("无法访问摄像头！请授予手机浏览器摄像头权限或切换至有摄像头权限的浏览器!");
            }
        } else {
            console.log(error);
        }

        return;

    },



    gotStream (stream) {

        let that = this;

        window.stream = stream; // make stream available to console

        that.videoElement.srcObject = stream;

    },

    isIOS() {

        var u = navigator.userAgent;

        var IOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端

        if (IOS) {

            return true;

        } else {

            return false;

        }

    },

    init () {

        let that = this;

        // API参考

        // https://developer.mozilla.org/zh-CN/docs/Web/API/MediaDevices/enumerateDevices

        // 先获取设备列表，方便调用后置摄像头

        let devices = navigator.mediaDevices.enumerateDevices().then(that.gotDevices.bind(that));

        document.querySelector('#scan').addEventListener('click', () => {

            $.colorbox({
            scrolling: true,
            overlayClose: true,
            reposition: false,
            innerWidth: "90%",
            innerHeight: "90%",
            maxWidth: "630px",
            maxHeight: "540px",
            inline: true,
            href: "#divQRScan"
        });

        that.videoElement.style.display = 'block';

        that.videoElement.play();

        devices.then(that.getStream.bind(that)).catch(that.handleError.bind(that));

        that.canvasContext.clearRect(0, 0, 300, 200);

        var hasRun = false; //避免重复执行回调函数

        //结果回调
        qrcode.callback = (e) => {

            if (!hasRun) {

                // 清除画布，停止摄像头

                clearTimeout(that.decodeTimer);

                clearTimeout(that.canvasTimer);

                that.canvasContext.clearRect(0, 0, 300, 200);

                if (window.stream) {

                    window.stream.getTracks().forEach((track) => {

                        track.stop();

                });

                }

                that.videoElement.style.display = 'none';

                that.canvasElement.style.display = 'none';

                e = e.replace("httq://", "http://").replace("httqs://", "https://"); //这里有时会把http识别为httq，可在这一步替换

                $.colorbox.close();

                if (e.indexOf("http://") != -1 || e.indexOf("https://") != -1) {

                    hasRun = true;

                    //这里可跳转到后台进行解密处理

                    window.location.href = e;

                } else {

                    hasRun = false;

                    alert("扫描错误，请重试！");

                }

            }

        }


    });

    }

};

Scan.init();