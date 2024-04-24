dosseg
.model large
.stack 1000h
.data

; Welcome message
welcome_border db 10,13,'              **********************************************$'
welcome_line1 db 10,13,'                ******************* Welcome ****************$'
welcome_line2 db 10,13,'                 ******************** To *****************$'
welcome_line3 db 10,13,'                    ************** Baltistan **********$'
welcome_line4 db 10,13,'                     ************* Cuisine ************$'
welcome_border2 db 10,13,'                      *************************$'  

;choose
menu_border db 10,13,'                    Timing---$'
enter_choose_timing db 10,13,'                    Enter Your Choose: $'
enter_timing db 10,13,'                          Enter 1 to Display timing: $'
peak_prompt db 10,13,'                            Peak Your Item: $'
quantity_prompt db 10,13,'                        Enter Quantity: $'
invalid_input db 10,13,'                        Invalid Input !! Rerun the Program$'
total_price db 10,13,'                            Total Price: $'
timing_opt1 db 10,13,'                    1.timing: $'
timing_opt2 db 10,13,'                    2.Exit: $'


; timing options
timing_list1 db 10,13,'                        1. Breakfast$'
timing_list2 db 10,13,'                        2. Lunch$'
timing_list3 db 10,13,'                        3. Dinner$'

; Breakfast List
breakfast_list_header db 10,13,'                 **********      Breakfast List      ********$'
breakfast_opt1 db 10,13,'                       1.Chai+Paratha            Rs-80/-$'
breakfast_opt2 db 10,13,'                       2.kahwa+Thaltak           Rs-80/-$'
breakfast_opt3 db 10,13,'                       3.Paratha+Fried Egg       Rs-80/-$'
breakfast_opt4 db 10,13,'                       4.Dodh Patti+Paratha      Rs-80/-$'
breakfast_opt5 db 10,13,'                       5.Halwa+Puri              Rs-80/-$'
breakfast_opt6 db 10,13,'                       6.Paya+Nan                Rs-80/-$'

; Lunch List
lunch_list_header db 10,13,'                  **********        Lunch List        ********$'
lunch_opt1 db 10,13,'                       1.Aloo Birani               Rs-170/-$'
lunch_opt2 db 10,13,'                       2.Chicken Birani            Rs-170/-$'
lunch_opt3 db 10,13,'                       3.Muskut and Prapo          Rs-170/-$'
lunch_opt4 db 10,13,'                       4.Tras Pa                   Rs-170/-$'
lunch_opt5 db 10,13,'                       5.Tras Bhalay               Rs-170/-$'
lunch_opt6 db 10,13,'                       6.Potato Stew               Rs-170/-$'

; Dinner List
dinner_list_header db 10,13,'                  ********        Dinner List       ********$'
dinner_opt1 db 10,13,'                       1.Marzan                  Rs-250/-$'
dinner_opt2 db 10,13,'                       2.Afghani Palawo          Rs-250/-$'
dinner_opt3 db 10,13,'                       3.White Kharayi           Rs-250/-$'
dinner_opt4 db 10,13,'                       4.Daal Chawal             Rs-250/-$'
dinner_opt5 db 10,13,'                       5.Beef/Chicken Kurma      Rs-250/-$'
dinner_opt6 db 10,13,'                       6.Haleem                  Rs-250/-$'

.code
main proc

mov ax,@data
mov ds,ax

; Welcome message
mov ah,9
lea dx,welcome_border
int 21h
lea dx,welcome_line1
int 21h
lea dx,welcome_line2
int 21h
lea dx,welcome_line3
int 21h
lea dx,welcome_line4
int 21h
lea dx,welcome_border2
int 21h

;take input to start
mov ah,9
lea dx,enter_timing
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je timing
jmp Invalid


timing:

 ;timing list
mov ah,9
lea dx,menu_border
int 21h
lea dx,timing_list1
int 21h
lea dx,timing_list2
int 21h
lea dx,timing_list3
int 21h

;list choose
lea dx,enter_choose_timing
int 21h

mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je Breakfast1
jmp CheckLunch

Breakfast1:
jmp Breakfast 

CheckLunch:
cmp bh,2
je Lunch1
jmp CheckDinner

Lunch1:
jmp Lunch

CheckDinner:
cmp bh,3
je Dinner1
jmp Invalid

Dinner1:
jmp Dinner




;******************Breakfast**************************
Breakfast:
mov ah,9
lea dx,breakfast_list_header
int 21h
; Display breakfast options
    mov ah, 9
    lea dx, breakfast_opt1
    int 21h
    lea dx, breakfast_opt2
    int 21h
    lea dx, breakfast_opt3
    int 21h
    lea dx, breakfast_opt4
    int 21h
    lea dx, breakfast_opt5
    int 21h
    lea dx, breakfast_opt6
    int 21h

;condition checking
lea dx,peak_prompt
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

Cmp bl,1
Je Eighty1
Cmp bl,2
Je Eighty1
Cmp bl,3
Je Eighty1
Cmp bl,4
Je Eighty1
Cmp bl,5
Je Eighty1
Cmp bl,6
Je Eighty1
jmp Invalid
Eighty1:
jmp Eighty 



;*************************Lunch**************************
Lunch:
; Lunch list header
mov ah, 9
lea dx, lunch_list_header
int 21h

; Display lunch options
    mov ah, 9
    lea dx, lunch_opt1
    int 21h
    lea dx, lunch_opt2
    int 21h
    lea dx, lunch_opt3
    int 21h
    lea dx, lunch_opt4
    int 21h
    lea dx, lunch_opt5
    int 21h
    lea dx, lunch_opt6
    int 21h

;condition checking
lea dx,peak_prompt
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

Cmp bl,1
Je OneSeventy1
Cmp bl,2
Je OneSeventy1
Cmp bl,3
Je OneSeventy1
Cmp bl,4
Je OneSeventy1
Cmp bl,5
Je OneSeventy1
Cmp bl,6
Je OneSeventy1
jmp Invalid
OneSeventy1:
jmp OneSeventy 


;**************************Dinner**************************
Dinner:
; Dinner list header
mov ah, 9
lea dx, dinner_list_header
int 21h

; Display dinner options
mov ah, 9
lea dx, dinner_opt1
int 21h
lea dx, dinner_opt2
int 21h
lea dx, dinner_opt3
int 21h
lea dx, dinner_opt4
int 21h
lea dx, dinner_opt5
int 21h
lea dx, dinner_opt6
int 21h

;condition checking
lea dx,peak_prompt
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

Cmp bl,1
Je TwoFifty1
Cmp bl,2
Je TwoFifty1
Cmp bl,3
Je TwoFifty1
Cmp bl,4
Je TwoFifty1
Cmp bl,5
Je TwoFifty1
Cmp bl,6
Je TwoFifty1
jmp Invalid
TwoFifty1:
jmp TwoFifty 


;****************Price For BreakFast Items********************
Eighty:
mov bl,8                  
lea dx,quantity_prompt
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mul bl
aam

mov cx,ax
add ch,48
add cl,48

;****************Total Price********************
lea dx,total_price
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h

;*****After show the Result. Return the program ****
mov ah,9
lea dx,timing_opt1
int 21h

mov ah,9
lea dx,timing_opt2
int 21h

mov ah,9
lea dx,enter_choose_timing
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je timing1

cmp al,2
jmp Exit

jmp Invalid
timing1:
    jmp timing

;****************Price For Lunch Items********************
OneSeventy:
mov bl,17
lea dx,quantity_prompt
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mul bl
aam

mov cx,ax
add ch,48
add cl,48


lea dx,total_price
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h


;*****After show the Result. Return the program ****
mov ah,9
lea dx,timing_opt1
int 21h

mov ah,9
lea dx,timing_opt2
int 21h

mov ah,9
lea dx,enter_choose_timing
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je timing2 

cmp al,2
jmp Exit

jmp Invalid
timing2:
    jmp timing

;****************Price For Dinner Items********************
TwoFifty:
mov bl,25
lea dx,quantity_prompt
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mul bl
aam

mov cx,ax
add ch,48
add cl,48


lea dx,total_price
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h

;*****After show the Result. Return the program ****
mov ah,9
lea dx,timing_opt1
int 21h

mov ah,9
lea dx,timing_opt2
int 21h

mov ah,9
lea dx,enter_choose_timing
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je timing3

cmp al,2
je Exit

jmp Invalid
timing3:
    jmp timing


Invalid:

mov ah,9
lea dx,invalid_input
int 21h
jmp Exit


Exit:
mov ah,4ch
int 21h
main endp
end main




