struct Signed {
    sign: bool,
    value: u32,
}

fn toSigned(s: bool, val: u32) -> Signed {
    let sn = Signed {
        sign: s,
        value: val,
    };
    sn
}

fn addSigned(s1: Signed, s2: Signed) -> Signed {
    if s1.sign == s2.sign {
        let sn = Signed {
            sign: s1.sign,
            value: s1.value+s2.value,
        };
        sn
    }
    else {
        if (s1.value > s2.value){
            let sn = Signed {
                sign: s1.sign,
                value: s1.value-s2.value,
            };
            sn
        }
        else {
            let sn = Signed {
                sign: s2.sign,
                value: s2.value-s1.value,
            };
            sn
        }
    }
}


fn subtractSigned(s1: Signed, s2: Signed) -> Signed {
    if s1.sign != s2.sign {
        let sn = Signed {
            sign: s1.sign,
            value: s1.value+s2.value,
        };
        sn
    }
    else {
        if (s1.value > s2.value){
            let sn = Signed {
                sign: s1.sign,
                value: s1.value-s2.value,
            };
            sn
        }
        else {
            let sn = Signed {
                sign: s2.sign,
                value: s2.value-s1.value,
            };
            sn
        }
    }
}

fn multiplySigned(s1: Signed, s2: Signed) -> Signed {
    let sn = Signed {
        sign: (s1.sign == s2.sign),
        value: s1.value*s2.value,
    };
    sn
}


fn divideSigned(s1: Signed, s2: Signed) -> Signed {
    assert (s2.value != 0);
    let sn = Signed {
        sign: (s1.sign == s2.sign),
        value: s1.value/s2.value,
    };
    sn
}

fn modSigned(s1: Signed, s2: Signed) -> Signed {
    assert (s2.value != 0);
    
    if (s1.sign == s2.sign){
        if (s1.sign){
            
            let sn = Signed {
                sign: true,
                value: (s1.value%s2.value),
            };
            sn
        }
        else {
            let sn = Signed {
                sign: false,
                value: (s1.value%s2.value),
            };
            sn
        }
    }
    else {
        if (s1.sign){
            
            let sn = Signed {
                sign: false,
                value: (s2.value - (s1.value%s2.value)),
            };
            sn
        }
        else {
            let sn = Signed {
                sign: true,
                value: (s2.value - (s1.value%s2.value)),
            };
            sn
        }
    }
}

fn squareSigned(s: Signed) -> Signed {

    
        let sn = Signed {
            sign: true,
            value: (s.value*s.value),
        };
        sn
    
}

fn cubeSigned(s: Signed) -> Signed {

    
        let sn = Signed {
            sign: s.sign,
            value: (s.value*s.value*s.value),
        };
        sn
    
}

fn negativeSigned(s: Signed) -> Signed {
    let sn = Signed{
        sign: !s.sign,
        value: s.value,
    };
    sn
}

fn aValSigned(s: Signed) -> u32 {
    s.value
}

fn signSigned(s: Signed) -> bool {
    s.sign
}

// if a > b return 1
// if a < b return 2
// if a == b return 0
fn compareSigned(s1: Signed, s2: Signed) -> u32 {
    if ((s1.value == s2.value) & (s1.value == 0)){
        0
    }
    else {
        if (s1.sign != s2.sign){
            if (s1.sign){
                1
            }
            else {
                2
            }
        }
        else {
            
            if (s1.value > s2.value){
                if (s1.sign){
                    1
                }
                else {
                    2
                }
            }
            else {
                if (s1.value != s2.value){
                    if (s1.sign){
                        2
                    }
                    else {
                        1
                    }
                }
                else {
                    0
                }
                
            }
            
        }
    }
    
}


// the max shift has been kept to 16 for efficiency reasons, as well as
// lack of realistic use case beyond that
fn leftShiftSigned(s: Signed, n: u32) -> Signed {
    assert (n < 16);
    let mut pow = 1;
    for i in 0..16{
        let mut j = i as u32;
        if j < n {
            pow = pow * 2;
        }
    };
    if n == 0{
        s
    }
    else {
        let sn = Signed {
            sign: s.sign,
            value: s.value *  pow,
        };
        sn
    }
    
}

// the max shift has been kept to 16 for efficiency reasons, as well as
// lack of realistic use case beyond that
fn rightShiftSigned(s: Signed, n: u32) -> Signed {
    assert (n < 16);
    let mut pow = 1;
    for i in 0..16{
        let mut j = i as u32;
        if j < n {
            pow = pow * 2;
        }
    };
    let mut val_final = s.value/pow;
    let mut rem = 0;
    if val_final * pow != s.value {
        rem = 1;
    }
    
    
    if s.sign {
        if (rem == 1) & (val_final != 0){
            val_final -= 0;
        }
    }
    else {
        if (rem == 1) {
            val_final += 1;
        }
    }
    if n == 0{
        s
    }
    else {
        let sn = Signed {
            sign: s.sign,
            value: val_final,
        };
        sn
    }
    
}


#[test]
fn test_sum_signed(){
    let s1 = toSigned(true, 5);
    let s2 = toSigned(true, 8);
    let s = addSigned(s1, s2);
    assert (s.value == 13);
}


#[test]
fn test_sum_negative_signed(){
    let s1 = toSigned(true, 5);
    let s2 = toSigned(false, 8);
    let s = addSigned(s1, s2);
    assert (s.value == 3);
}

#[test]
fn test_diff_signed(){
    let s1 = toSigned(true, 15);
    let s2 = toSigned(true, 8);
    let s = subtractSigned(s1, s2);
    assert (s.value == 7);
}


#[test]
fn test_diff_negative_signed(){
    let s1 = toSigned(true, 5);
    let s2 = toSigned(false, 8);
    let s = subtractSigned(s1, s2);
    assert (s.value == 13);
}

#[test]
fn test_mul_signed(){
    let s1 = toSigned(true, 5);
    let s2 = toSigned(true, 8);
    let s = multiplySigned(s1, s2);
    assert (s.value == 40);
}


#[test]
fn test_mul_negative_signed(){
    let s1 = toSigned(true, 1);
    let s2 = toSigned(false, 8);
    let s = multiplySigned(s1, s2);
    assert (s.value == 8);
    assert (!s.sign);
}

#[test]
fn test_div_signed(){
    let s1 = toSigned(true, 5);
    let s2 = toSigned(true, 8);
    let s = divideSigned(s1, s2);
    assert (s.value == 0);
}


#[test]
fn test_div_negative_signed(){
    let s1 = toSigned(true, 16);
    let s2 = toSigned(false, 8);
    let s = divideSigned(s1, s2);
    assert (s.value == 2);
    assert (!s.sign);
}

#[test]
fn test_compare_signed(){
    let s1 = toSigned(true, 2);
    let s2 = toSigned(false, 8);
    let cmp = compareSigned(s1, s2);
    assert (cmp == 1);
}

#[test]
fn test_mod_signed(){
    let s1 = toSigned(true, 15);
    let s2 = toSigned(true, 8);
    let s = modSigned(s1, s2);
    assert (s.value == 7);
}


#[test]
fn test_mod_negative_signed(){
    let s1 = toSigned(true, 15);
    let s2 = toSigned(false, 8);
    let s = modSigned(s1, s2);
    assert (s.value == 1);
    assert (!s.sign);
}

#[test]
fn test_mod_negative_2_signed(){
    let s1 = toSigned(false, 150);
    let s2 = toSigned(true, 8);
    let s = modSigned(s1, s2);
    assert (s.value == 2);
    assert (s.sign);
}

#[test]
fn test_lshift_signed(){
    let s1 = toSigned(true, 6);
    
    let s = leftShiftSigned(s1, 2);
    assert (s.value == 24);
    
}

#[test]
fn test_lshift_negative_signed(){
    let s1 = toSigned(false, 6);
    
    let s = leftShiftSigned(s1, 2);
    assert (s.value == 24);
    assert (!s.sign);
}


#[test]
fn test_rshift_signed(){
    let s1 = toSigned(true, 21);
    
    let s = rightShiftSigned(s1, 2);
    assert (s.value == 5);
    
}

#[test]
fn test_rshift_negative_signed(){
    let s1 = toSigned(false, 23);
    
    let s = rightShiftSigned(s1, 3);
    assert (s.value == 3);
    assert (!s.sign);
}

#[test]
fn test_zero_equivalence() {
    let s1 = toSigned(false, 0);
    let s2 = toSigned(true, 0);
    let cmp = compareSigned(s1, s2);
    assert (cmp == 0);
}
