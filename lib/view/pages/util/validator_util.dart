import 'package:validators/validators.dart';

Function validateUsername() {
  //GetUtils.isEmail()
  return (String? value) {
    if (value!.isEmpty) {
      return "유저네임을 입력 해주세요.";
    } else if (!isAlphanumeric(value)) {
      return "유저네임에 한글이나 특수 문자가 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "유저네임의 길이를 초과하였습니다.";
    } else if (value.length < 3) {
      return "유저네임의 최소 길이는 3자입니다.";
    } else {
      return null;
    }
  };
}

Function validateNickName() {
  return (String? value) {
    if (value!.isEmpty) {
      return "닉네임을 입력해주세요.";
    } else if (value.length > 12) {
      return "닉네임의 길이를 초과하였습니다.";
    } else if (value.length < 3) {
      return "닉네임의 최소 길이는 3자입니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return "패스워드를 입력 해주세요";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "제목은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateReview() {
  return (String? value) {
    if (value!.isEmpty) {
      if (value.length < 10) {
        return "리뷰는 10자 이상 작성해야 합니다.";
      } else if (value.length > 100) {
        return "리뷰는 100자 이하로 작성하여야 합니다.";
      } else {
        return null;
      }
    }
  };
}

Function validatePhoneNumber() {
  return (String? value) {
    if (value!.isEmpty) {
      return "전화번호는 공백이 들어갈 수 없습니다.";
    } else if (value.length > 11) {
      return "전화번호의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateAddress() {
  return (String? value) {
    if (value!.isEmpty) {
      return "주소는 공백이 들어갈 수 없습니다.";
    } else if (value.length > 50) {
      return "주소의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "내용은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}
