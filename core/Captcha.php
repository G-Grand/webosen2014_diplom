<?php

class Captcha
{
    static public function generate() {
        //����������� PHP ���������� captchastring ������ ��������
        $captchastring = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz';
        //�������� ������ 6 �������� ����� �� ������������� � ������� ������� str_shuffle
        $captchastring = substr(str_shuffle($captchastring), 0, 6);
        //������������� ���������� ������ � ������� ��������������� ��������� captchastring,
        //���������� 6 ��������
        ErSession::saveToSession("code",$captchastring);

        //���������� CAPTCHA

        //������� ����� ����������� �� ����� background.png
        $image = imagecreatefrompng('application/data/images/background.png');
        //������������� ���� (R-200, G-240, B-240) �����������, ����������� � $image
        $colour = imagecolorallocate($image, 200, 240, 240);
        //����������� ���������� font �������� ������
        $font = 'application/data/fonts/oswald.ttf';
        //������������� ��������� ����� ����� -10 � 10 �������� ��� �������� ������
        $rotate = rand(-10, 10);
        //������ ����� �� ����������� ������� TrueType (1 �������� - ����������� ($image),
        //2 - ������ ������ (18), 3 - ���� �������� ������ ($rotate),
        //4, 5 - ��������� ���������� x � y ��� ������ (18,30), 6 - ������ ����� ($colour),
        //7 - ���� � ����� ������ ($font), 8 - ����� ($captchastring)
        imagettftext($image, 18, $rotate, 28, 32, $colour, $font, $captchastring);
        //����� ���������� ����������� � ������� png
        header('Content-type: image/png');
        //������� �����������
        return imagepng($image);
    }
}