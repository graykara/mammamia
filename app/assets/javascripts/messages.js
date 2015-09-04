$(function() {
    jQuery.extend(jQuery.validator.messages, {
        required: "필수 항목 입니다.",
        remote: "Please fix this field.",
        email: "이메일 형식을 기입해주십시오.",
        url: "Please enter a valid URL.",
        date: "Please enter a valid date.",
        dateISO: "Please enter a valid date (ISO).",
        number: "숫자만 입력 가능합니다.",
        digits: "숫자만 입력 가능합니다.",
        creditcard: "Please enter a valid credit card number.",
        equalTo: "같은 값으로 입력해야합니다.",
        accept: "Please enter a value with a valid extension.",
        maxlength: jQuery.validator.format("{0} 글자를 초과할 수 없습니다."),
        minlength: jQuery.validator.format("{0} 글자 이상이어야 합니다."),
        rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
        range: jQuery.validator.format("Please enter a value between {0} and {1}."),
        max: jQuery.validator.format("{0} 이하의 값을 입력해주세요."),
        min: jQuery.validator.format("{0} 이상의 값을 입력해주세요.")
    });
});
