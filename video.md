.fullscreen-bg {
  position: relative;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: hidden;
  height: 600px;
  z-index: 0;
}


<div class="fullscreen-bg">
  <%= video_tag(["XXXX.mp4"], class: "fullscreen-bg__video", autoplay: true, loop: true )%>
</div>

- video saved under app/assets/images