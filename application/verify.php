<?php
//��������� ������
session_start();
//��������� ������������ ���� CAPTCHA
if ($_SESSION["code"] == $_POST["captcha"]) {
  //�������� ������ true, ���� ��� �������������
  echo 'true';
} 
else {
  //�������� ������ false, ���� ��� �� �������������
  echo 'false';
}
?>
