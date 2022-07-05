$(document).ready(function () {
  console.log("Ready!");

  $("#inputHo").change(function (e) {
    e.preventDefault();
    checkHoTenDem();
  });

  $("#inputTen").change(function (e) {
    e.preventDefault();
    checkTen();
  });

  $("#inputSDT").change(function (e) {
    e.preventDefault();
    checkSoDienThoai();
  });

  $("#inputMatKhau").change(function (e) {
    e.preventDefault();
    checkDoManhMatKhau();
  });

  $("#inputNhapLaiMatKhau").on("input", function () {
    // do something
    checkNhapLaiMatKhau();
  });

  $("#btnSubmit").click(function (e) {
    if (!checkHoTenDem()) {
      e.preventDefault();
    }
    if (!checkTen()) {
      e.preventDefault();
    }
    if (!checkSoDienThoai()) {
      e.preventDefault();
    }
    if (!checkDoManhMatKhau()) {
      e.preventDefault();
    }
    if (!checkNhapLaiMatKhau()) {
      e.preventDefault();
    }
  });

  const checkHoTenDem = () => {
    const hoTenDem = $("#inputHo").val();
    if (hoTenDem == "") {
      $("#tbHoTenDem").text("Họ tên đệm không được đề trống!");
      return false;
    }
    $("#tbHoTenDem").text("");
    return true;
  };

  const checkTen = () => {
    const ten = $("#inputTen").val();
    if (ten == "") {
      $("#tbTen").text("Tên không được đề trống!");
      return false;
    }

    $("#tbTen").text("");
    return true;
  };

  const checkSoDienThoai = () => {
    const soDienThoai = $("#inputSDT").val();
    if (soDienThoai == "") {
      $("#tbSoDienThoai").text("Số điện thoại không được để trống!");
      return false;
    }

    const regex =
      /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
    if (!soDienThoai.match(regex)) {
      $("#tbSoDienThoai").text("Nhập không đúng định dạng số điện thoại!");
      return false;
    }

    $("#tbSoDienThoai").text("");
    return true;
  };

  const checkDoManhMatKhau = () => {
    const matKhau = $("#inputMatKhau").val();
    if (matKhau == "") {
      $("#tbMatKhau").text("Mật khẩu không được để trống!");
      return false;
    }

    const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    if (!matKhau.match(regex)) {
      $("#tbMatKhau").text(
        "Mật khẩu tối thiểu 8 ký tự, ít nhất 1 chữ cái và 1 số!"
      );
      return false;
    }

    $("#tbMatKhau").text("");
    return true;
  };

  const checkNhapLaiMatKhau = () => {
    const matKhau = $("#inputNhapLaiMatKhau").val();
    if (matKhau == "") {
      $("#tbNhapLaiMatKhau").text("Nhập lại mật khẩu không được để trống!");
      return false;
    }
    const matKhauNhap = $("#inputMatKhau").val()
    if (matKhau !== matKhauNhap) {
      $("#tbNhapLaiMatKhau").text("Mật khẩu không khớp!");
      return false;
    }

    $("#tbNhapLaiMatKhau").text("");
    return true;
  };
});
