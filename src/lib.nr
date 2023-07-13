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
                value: ((s1.value%s2.value)-1),
            };
            sn
        }
        else {
            let sn = Signed {
                sign: true,
                value: ((s1.value%s2.value)-1),
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