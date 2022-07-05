$(document).ready(function () {
  $("#btnSubmit").click(function (e) { 
    e.preventDefault();
    let searchParams = new URLSearchParams(window.location.search)
    let idProduct = searchParams.get("sanpham");
    console.log('maSanPham', idProduct);
    
    let data = new FormData();

    const dataJson = {
      "maSanPham": idProduct,
      "soLuong": $("#qtym").val()
    }

    data.append("dataJson", JSON.stringify(dataJson));

    $.ajax({
      type: "POST",
      url: postURL,
      data: data,
      enctype: "multipart/form-data",
      processData: false,
      contentType: false,
      cache: false,
      timeout: 600000,
      success: function (response) {
          console.log('SUCCESS', response);
          // window.location = redirectURL;
      }
  });
  });
});