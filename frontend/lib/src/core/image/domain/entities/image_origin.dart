/// Image를 받아오는 곳
/// ImageSource라는 이름을 사용하려 했으나 image_picker library에서 같은 이름의
/// enum을 사용하기 때문에 ImageOrigin으로 변경
enum ImageOrigin {
  camera,
  gallery,
}
