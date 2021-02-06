dseg segment 'DATA'
	TIME_AUX DB 0
	BLOCK_SIZE_X dw 9h
	BLOCK_SIZE_Y dw 26h
	
	BLOCK_X DW 0h
	
	BLOCK1_X DW 46h
	
	BLOCK2_X DW 8ch
	
	BLOCK3_X DW 0d2h
	
	BLOCK1_Y DW 0h
	BLOCK2_Y DW 25h
	BLOCK3_Y DW 4ch
	
	WINDOW_BOUNDS DW 2h
	WINDOW_WIDTH DW 140h
	WINDOW_HEIGHT DW 0c8h
	
	BALL_X DW 0a0h
	BALL_Y DW 0bah
	BALL_SIZE DW 04h
	BALL_VELOCITY_X DW 04h
	BALL_VELOCITY_Y DW 02h
	
	BLOCK00 dw 1h
	BLOCK01 dw 1h
	BLOCK02 dw 1h
	BLOCK03 dw 1h
	BLOCK10 dw 1h
	BLOCK11 dw 1h
	BLOCK12 dw 1h
	BLOCK13 dw 1h
	BLOCK20 dw 1h
	BLOCK21 dw 1h
	BLOCK22 dw 1h
	BLOCK23 dw 1h
	
	LOSE_FLAG dw 1h ;0 ako je igrac izgubio
	
	BALL dw 1h
	BAR dw 1h
	
	BALLCOLOR dw 0h
	
	BAR_X DW 90h
	BAR_Y DW 0c3h
	
	BAR_SIZE_X DW 32h
	BAR_SIZE_Y DW 5h
	
	BROJAC DW 0h
	
dseg ends

cseg segment 'CODE'
	assume cs:cseg, ds:dseg, ss:sseg
	
draw:
	mov ax, dseg
	mov ds, ax
	
	call CLEAR_SCREEN
	
	CHECK_TIME:
		mov ah, 2ch
		int 21h
		
		cmp dl, TIME_AUX
		je CHECK_TIME
		mov TIME_AUX, dl
		
		call CLEAR_SCREEN
		call DRAW_HORIZONTAL_FIRST
		call DRAW_HORIZONTAL_SECOND
		call DRAW_HORIZONTAL_THIRD
		call MOVE_BALL
		
		call LOPTICA
		call DRAW_BAR
		call MOVE_BAR
		call PROVERA_POBEDA	
		
		call NE_STAMPAJ_BROJ
		call BROJI
		
		
		jmp CHECK_TIME	
		
	jmp kraj
	
	NE_STAMPAJ_BROJ proc near
	
		cmp LOSE_FLAG, 0
		jne flaglose
		call STAMPAJ_BROJ
		
		flaglose:
	
	
		ret
	NE_STAMPAJ_BROJ endp
	
	BROJI proc near
		mov cx, 0
	
		saberi0:
		cmp BLOCK00, 0h
		jne saberi1
		add cx, 3h
		mov BROJAC, cx
		
		saberi1:
		cmp BLOCK01, 0h
		jne saberi2
		add cx, 3h
		mov BROJAC, cx
		
		saberi2:
		cmp BLOCK02, 0h
		jne saberi3
		add cx, 3h
		mov BROJAC, cx
		
		saberi3:
		cmp BLOCK03, 0h
		jne saberi4
		add cx, 3h
		mov BROJAC, cx
		
		saberi4:
		cmp BLOCK10, 0h
		jne saberi5
		add cx, 2h
		mov BROJAC, cx
		
		saberi5:
		cmp BLOCK11, 0h
		jne saberi6
		add cx, 2h
		mov BROJAC, cx
		
		saberi6:
		cmp BLOCK12, 0h
		jne saberi7
		add cx, 2h
		mov BROJAC, cx
		
		saberi7:
		cmp BLOCK13, 0h
		jne saberi8
		add cx, 2h
		mov BROJAC, cx
		
		saberi8:
		cmp BLOCK20, 0h
		jne saberi9
		add cx, 1h
		mov BROJAC, cx
		
		saberi9:
		cmp BLOCK21, 0h
		jne saberi10
		add cx, 1h
		mov BROJAC, cx
		
		saberi10:
		cmp BLOCK22, 0h
		jne saberi11
		add cx, 1h
		mov BROJAC, cx
		
		saberi11:
		cmp BLOCK23, 0h
		jne saberi12
		add cx, 1h
		mov BROJAC, cx
		
		saberi12:
	
	
	BROJI endp
	
	STAMPAJ_BROJ proc near
		cmp BROJAC, 0h
		jne provera01
		call BROJ0
		
		provera01:
		cmp BROJAC, 1h
		jne provera02
		call BROJ1
		
		provera02:
		cmp BROJAC, 2h
		jne provera03
		call BROJ2
		
		provera03:
		cmp BROJAC, 3h
		jne provera04
		call BROJ3
		
		provera04:
		cmp BROJAC, 4h
		jne provera05
		call BROJ4
		
		provera05:
		cmp BROJAC, 5h
		jne provera06
		call BROJ5
		
		provera06:
		cmp BROJAC, 6h
		jne provera07
		call BROJ6
		
		provera07:
		cmp BROJAC, 7h
		jne provera08
		call BROJ7
		
		provera08:
		cmp BROJAC, 8h
		jne provera09
		call BROJ8
		
		provera09:
		cmp BROJAC, 9h
		jne provera10
		call BROJ9
		
		provera10:
		cmp BROJAC, 0ah
		jne provera11
		call BROJ10
		
		provera11:
		cmp BROJAC, 0bh
		jne provera12
		call BROJ11
		
		provera12:
		cmp BROJAC, 0ch
		jne provera13
		call BROJ12
		
		provera13:
		cmp BROJAC, 0dh
		jne provera14
		call BROJ13
		
		provera14:
		cmp BROJAC, 0eh
		jne provera15
		call BROJ14
		
		provera15:
		cmp BROJAC, 0fh
		jne provera16
		call BROJ15
		
		provera16:
		cmp BROJAC, 10h
		jne provera17
		call BROJ16
		
		provera17:
		cmp BROJAC, 11h
		jne provera18
		call BROJ17
		
		provera18:
		cmp BROJAC, 12h
		jne provera19
		call BROJ18
		
		provera19:
		cmp BROJAC, 13h
		jne provera20
		call BROJ19
		
		provera20:
		cmp BROJAC, 14h
		jne provera21
		call BROJ20
		
		provera21:
		cmp BROJAC, 15h
		jne provera22
		call BROJ21
		
		provera22:
		cmp BROJAC, 16h
		jne provera23
		call BROJ22
		
		provera23:
		cmp BROJAC, 17h
		jne ne_stampaj
		call BROJ23
		
		ne_stampaj:
	
		ret
	STAMPAJ_BROJ endp
	
	
	
	BROJ0 proc near
		mov cx, 123h
		mov dx, 5h
		
		broj0_1:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 3h
		jng broj0_1
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 10h
		jng broj0_1
		
		mov cx, 126h
		mov dx, 5h
		
		broj0_2:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 126h
		cmp ax, 5h
		jng broj0_2
			
		mov cx, 126h
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 3h
		jng broj0_2
		
		mov cx, 126h
		mov dx, 12h
		
		broj0_3:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 126h
		cmp ax, 5h
		jng broj0_3
			
		mov cx, 126h
		inc dx
			
		mov ax, dx
		sub ax, 12h
		cmp ax, 3h
		jng broj0_3
		
		mov cx, 12bh
		mov dx, 5h
		
		broj0_4:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 12bh
		cmp ax, 3h
		jng broj0_4
			
		mov cx, 12bh
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 10h
		jng broj0_4
		
		ret
		
	BROJ0 endp
	
	BROJ1 proc near
		mov cx, 123h
		mov dx, 5h
	
		broj_1:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 3h
		jng broj_1
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 10h
		jng broj_1
		
		ret
	
	BROJ1 endp
	
	BROJ2 proc near
		mov cx, 123h
		mov dx, 5h
		
		broj2_0:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 8h
		jng broj2_0
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 3h
		jng broj2_0
		
		mov cx, 128h
		mov dx, 8h
		
		broj2_1:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 128h
		cmp ax, 3h
		jng broj2_1
			
		mov cx, 128h
		inc dx
			
		mov ax, dx
		sub ax, 8h
		cmp ax, 3h
		jng broj2_1
		
		mov cx, 123h
		mov dx, 0bh
		
		broj2_2:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 8h
		jng broj2_2
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 0bh
		cmp ax, 3h
		jng broj2_2
		
		mov cx, 123h
		mov dx, 0eh
		
		broj2_3:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 3h
		jng broj2_3
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 0eh
		cmp ax, 3h
		jng broj2_3
		
		mov cx, 123h
		mov dx, 11h
		
		broj2_4:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 8h
		jng broj2_4
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 11h
		cmp ax, 3h
		jng broj2_4
		
		ret
	
	BROJ2 endp
	
	BROJ3 proc near
		mov cx, 123h
		mov dx, 5h
		
		broj3_0:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 8h
		jng broj3_0
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 3h
		jng broj3_0
		
		mov cx, 128h
		mov dx, 8h
		
		broj3_1:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 128h
		cmp ax, 3h
		jng broj3_1
			
		mov cx, 128h
		inc dx
			
		mov ax, dx
		sub ax, 8h
		cmp ax, 3h
		jng broj3_1
		
		mov cx, 123h
		mov dx, 0bh
		
		broj3_2:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 8h
		jng broj3_2
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 0bh
		cmp ax, 3h
		jng broj3_2
		
		mov cx, 128h
		mov dx, 0eh
		
		broj3_3:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 128h
		cmp ax, 3h
		jng broj3_3
			
		mov cx, 128h
		inc dx
			
		mov ax, dx
		sub ax, 0eh
		cmp ax, 3h
		jng broj3_3
		
		mov cx, 123h
		mov dx, 11h
		
		broj3_4:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 8h
		jng broj3_4
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 11h
		cmp ax, 3h
		jng broj3_4
		
		ret
	
	BROJ3 endp
	
	BROJ4 proc near
	
		mov cx, 123h
		mov dx, 5h
		
		broj4_0:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 3h
		jng broj4_0
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 6h
		jng broj4_0
		
		mov cx, 126h
		mov dx, 8h
		
		broj4_1:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 126h
		cmp ax, 3h
		jng broj4_1
			
		mov cx, 126h
		inc dx
			
		mov ax, dx
		sub ax, 8h
		cmp ax, 3h
		jng broj4_1
		
		mov cx, 129h
		mov dx, 5h
		
		broj4_2:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 129h
		cmp ax, 3h
		jng broj4_2
			
		mov cx, 129h
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 9h
		jng broj4_2
		
		
		ret
	
	BROJ4 endp
	
	
	BROJ5 proc near
		mov cx, 123h
		mov dx, 5h
		
		broj5_0:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 8h
		jng broj5_0
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 3h
		jng broj5_0
		
		mov cx, 123h
		mov dx, 8h
		
		broj5_1:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 3h
		jng broj5_1
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 8h
		cmp ax, 3h
		jng broj5_1
		
		mov cx, 123h
		mov dx, 0bh
		
		broj5_2:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 8h
		jng broj5_2
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 0bh
		cmp ax, 3h
		jng broj5_2
		
		mov cx, 128h
		mov dx, 0eh
		
		broj5_3:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 128h
		cmp ax, 3h
		jng broj5_3
			
		mov cx, 128h
		inc dx
			
		mov ax, dx
		sub ax, 0eh
		cmp ax, 3h
		jng broj5_3
		
		mov cx, 123h
		mov dx, 11h
		
		broj5_4:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 8h
		jng broj5_4
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 11h
		cmp ax, 3h
		jng broj5_4
		
		ret
	
	BROJ5 endp
	
	BROJ6 proc near
		call BROJ5
		
		mov cx, 123h
		mov dx, 0eh
		
		broj_6:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 3h
		jng broj_6
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 0eh
		cmp ax, 3h
		jng broj_6
		
		ret
	
	BROJ6 endp
	
	BROJ7 proc near
		call BROJ1
		
		mov cx, 11fh
		mov dx, 5h
		
		broj_7:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 11fh
		cmp ax, 5h
		jng broj_7
			
		mov cx, 11fh
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 3h
		jng broj_7
		
		ret
	BROJ7 endp
	
	BROJ8 proc near
		call BROJ6
		
		mov cx, 128h
		mov dx, 8h
		
		broj_8:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 128h
		cmp ax, 3h
		jng broj_8
			
		mov cx, 128h
		inc dx
			
		mov ax, dx
		sub ax, 8h
		cmp ax, 3h
		jng broj_8
	
		ret
	BROJ8 endp
		
	BROJ9 proc near
		call BROJ3
		
		mov cx, 123h
		mov dx, 8h
	
		broj_9:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 123h
		cmp ax, 3h
		jng broj_9
			
		mov cx, 123h
		inc dx
			
		mov ax, dx
		sub ax, 8h
		cmp ax, 3h
		jng broj_9
	
		ret
	BROJ9 endp
	
	DESETKA proc near
		mov cx, 11dh
		mov dx, 5h
	
		broj_10:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 11dh
		cmp ax, 3h
		jng broj_10
			
		mov cx, 11dh
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 10h
		jng broj_10
		
		ret

	DESETKA endp
	
	BROJ10 proc near
		call DESETKA
		call BROJ0
	
		ret
	BROJ10 endp
	
	BROJ11 proc near
		call DESETKA
		call BROJ1
		
		ret
	BROJ11 endp
	
	BROJ12 proc near
		call DESETKA
		call BROJ2
		
		ret
	BROJ12 endp
	
	BROJ13 proc near
		call DESETKA
		call BROJ3
		
		ret
	BROJ13 endp
	
	BROJ14 proc near
		call DESETKA
		call BROJ4
		
		ret
	BROJ14 endp
	
	BROJ15 proc near
		call DESETKA
		call BROJ5
		
		ret
	BROJ15 endp
	
	BROJ16 proc near
		call DESETKA
		call BROJ6
		
		ret
	BROJ16 endp
	
	BROJ17 proc near
		call DESETKA
		call BROJ7
		
		ret
	BROJ17 endp
	
	BROJ18 proc near
		call DESETKA
		call BROJ8
		
		ret
	BROJ18 endp
	
	BROJ19 proc near
		call DESETKA
		call BROJ9
		
		ret
	BROJ19 endp
	
	DVADESETICA proc near

		mov cx, 118h
		mov dx, 5h
		
		broj20_0:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 118h
		cmp ax, 8h
		jng broj20_0
			
		mov cx, 118h
		inc dx
			
		mov ax, dx
		sub ax, 5h
		cmp ax, 3h
		jng broj20_0
		
		mov cx, 11dh
		mov dx, 8h
		
		broj20_1:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 11dh
		cmp ax, 3h
		jng broj20_1
			
		mov cx, 11dh
		inc dx
			
		mov ax, dx
		sub ax, 8h
		cmp ax, 3h
		jng broj20_1
		
		mov cx, 118h
		mov dx, 0bh
		
		broj20_2:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 118h
		cmp ax, 8h
		jng broj20_2
			
		mov cx, 118h
		inc dx
			
		mov ax, dx
		sub ax, 0bh
		cmp ax, 3h
		jng broj20_2
		
		mov cx, 118h
		mov dx, 0eh
		
		broj20_3:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 118h
		cmp ax, 3h
		jng broj20_3
			
		mov cx, 118h
		inc dx
			
		mov ax, dx
		sub ax, 0eh
		cmp ax, 3h
		jng broj20_3
		
		mov cx, 118h
		mov dx, 11h
		
		broj20_4:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h	
		
		inc cx
		mov ax, cx
		sub ax, 118h
		cmp ax, 8h
		jng broj20_4
			
		mov cx, 118h
		inc dx
			
		mov ax, dx
		sub ax, 11h
		cmp ax, 3h
		jng broj20_4
		
		ret
	DVADESETICA endp
	
	BROJ20 proc near
		call DVADESETICA
		call BROJ0
	
		ret
	BROJ20 endp
	
	BROJ21 proc near
		call DVADESETICA
		call BROJ1
	
		ret
	BROJ21 endp
	
	BROJ22 proc near
		call DVADESETICA
		call BROJ2
	
		ret
	BROJ22 endp
	
	BROJ23 proc near
		call DVADESETICA
		call BROJ3
	
		ret
	BROJ23 endp
	
	DRAW_HORIZONTAL_FIRST proc near
		
		cmp BLOCK00, 1
		jne draw2
		
		mov cx, BLOCK_X
		mov dx, BLOCK1_Y
		
		DRAW_HORIZONTAL1:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL1
			
			mov cx, BLOCK_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK1_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL1
			
		draw2:
		cmp BLOCK01, 1
		jne draw3
		
		mov cx, BLOCK1_X
		mov dx, BLOCK1_Y
		
		DRAW_HORIZONTAL2:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK1_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL2
			
			mov cx, BLOCK1_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK1_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL2
		
		draw3:
		cmp BLOCK02, 1
		jne draw4
	
		mov cx, BLOCK2_X
		mov dx, BLOCK1_Y
		
		DRAW_HORIZONTAL3:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK2_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL3
			
			mov cx, BLOCK2_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK1_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL3
			
		draw4:
		cmp BLOCK03, 1
		jne draw5
	
		mov cx, BLOCK3_X
		mov dx, BLOCK1_Y
		
		DRAW_HORIZONTAL4:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK3_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL4
			
			mov cx, BLOCK3_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK1_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL4
			
		draw5:
			
		ret		
		
	DRAW_HORIZONTAL_FIRST endp
	
	
	DRAW_HORIZONTAL_SECOND proc near
		cmp BLOCK10, 1
		jne draw6
	
		mov cx, BLOCK_X
		mov dx, BLOCK2_Y
		
		DRAW_HORIZONTAL5:
			mov ah, 0ch
			mov al, 0eh
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL5
			
			mov cx, BLOCK_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK2_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL5
			
		draw6:
		cmp BLOCK11, 1
		jne draw7
		
		mov cx, BLOCK1_X
		mov dx, BLOCK2_Y
		
		DRAW_HORIZONTAL6:
			mov ah, 0ch
			mov al, 0eh
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK1_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL6
			
			mov cx, BLOCK1_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK2_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL6
		
		draw7:
		cmp BLOCK12, 1
		jne draw8
		
		mov cx, BLOCK2_X
		mov dx, BLOCK2_Y
		
		DRAW_HORIZONTAL7:
			mov ah, 0ch
			mov al, 0eh
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK2_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL7
			
			mov cx, BLOCK2_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK2_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL7
			
		
		draw8:
		cmp BLOCK13, 1
		jne draw9
		
		mov cx, BLOCK3_X
		mov dx, BLOCK2_Y
		
		DRAW_HORIZONTAL8:
			mov ah, 0ch
			mov al, 0eh
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK3_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL8
			
			mov cx, BLOCK3_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK2_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL8
			
		draw9:
			
		ret		
		
	DRAW_HORIZONTAL_SECOND endp
	
	
	DRAW_HORIZONTAL_THIRD proc near
	
		cmp BLOCK20, 1
		jne draw10
	
		mov cx, BLOCK_X
		mov dx, BLOCK3_Y
		
		DRAW_HORIZONTAL9:
			mov ah, 0ch
			mov al, 02h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL9
			
			mov cx, BLOCK_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK3_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL9
			
		draw10:
		cmp BLOCK21, 1
		jne draw11
		
		mov cx, BLOCK1_X
		mov dx, BLOCK3_Y
		
		DRAW_HORIZONTAL10:
			mov ah, 0ch
			mov al, 02h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK1_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL10
			
			mov cx, BLOCK1_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK3_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL10
		
	
		draw11:
		cmp BLOCK22, 1
		jne draw12
		
		mov cx, BLOCK2_X
		mov dx, BLOCK3_Y
		
		DRAW_HORIZONTAL11:
			mov ah, 0ch
			mov al, 02h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK2_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL11
			
			mov cx, BLOCK2_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK3_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL11
			
		
		draw12:
		cmp BLOCK23, 1
		jne draw13
		
		mov cx, BLOCK3_X
		mov dx, BLOCK3_Y
		
		DRAW_HORIZONTAL12:
			mov ah, 0ch
			mov al, 02h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, BLOCK3_X
			cmp ax, BLOCK_SIZE_Y
			jng DRAW_HORIZONTAL12
			
			mov cx, BLOCK3_X
			inc dx
			
			mov ax, dx
			sub ax, BLOCK3_Y
			cmp ax, BLOCK_SIZE_X
			jng DRAW_HORIZONTAL12
			
		draw13:
			
		ret		
		
	DRAW_HORIZONTAL_THIRD endp
	
	
	MOVE_BALL proc near
		mov ax, BALL_VELOCITY_X
		add BALL_X, ax
		
		mov ax, WINDOW_BOUNDS
		cmp BALL_X, ax
		jg prvi
		call NEG_VELOCITY_X
		mov BALLCOLOR, 1
		
		prvi:
		mov ax, WINDOW_WIDTH
		sub ax, BALL_SIZE
		sub ax, WINDOW_BOUNDS
		cmp BALL_X, ax
		jl drugi
		call NEG_VELOCITY_X
		mov BALLCOLOR, 2
		
		drugi:
		mov ax,BALL_VELOCITY_Y
		add BALL_Y,ax             
		
		mov ax,WINDOW_BOUNDS
		cmp BALL_Y,ax   		
		jg treci
		call NEG_VELOCITY_Y
		mov BALLCOLOR, 3
		
		treci:
		mov ax,WINDOW_HEIGHT	
		sub ax,BALL_SIZE
		sub ax,WINDOW_BOUNDS
		cmp BALL_Y,ax
		jl check00
		call LOSE
		;call NEG_VELOCITY_Y
		

		
		check00:
		cmp BLOCK00, 1
		jne check00_1
		
		mov ax, BLOCK_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check00_1
		
		mov ax, BLOCK_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check00_1
		
		mov ax, BLOCK1_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check00_1
		
		mov ax, BLOCK1_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check00_1
		;call NEG_VELOCITY_X
		mov BLOCK00, 0
		
		
		check00_1:
		cmp BLOCK00, 1
		jne check01
		
		mov ax, BLOCK1_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check01
		
		mov ax, BLOCK1_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check01
		
		mov ax, BLOCK_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check01
		
		mov ax, BLOCK_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check01
		
		;call NEG_VELOCITY_Y
		mov BLOCK00, 0
		
		
		check01:
		cmp BLOCK01, 1
		jne check01_1
		
		mov ax, BLOCK1_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check01_1
		
		mov ax, BLOCK1_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check01_1
		
		mov ax, BLOCK1_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check01_1
		
		mov ax, BLOCK1_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check01_1
		;call NEG_VELOCITY_X
		mov BLOCK01, 0
		
		check01_1:
		cmp BLOCK01, 1
		jne check02
		
		mov ax, BLOCK1_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check02
		
		mov ax, BLOCK1_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check02
		
		mov ax, BLOCK1_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check02
		
		mov ax, BLOCK1_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check02
		
		;call NEG_VELOCITY_Y
		mov BLOCK00, 0
		
		
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		check02:
		cmp BLOCK02, 1
		jne check02_1
		
		mov ax, BLOCK2_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check02_1
		
		mov ax, BLOCK2_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check02_1
		
		mov ax, BLOCK1_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check02_1
		
		mov ax, BLOCK1_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check02_1
		;call NEG_VELOCITY_X
		mov BLOCK02, 0
		
		check02_1:
		cmp BLOCK02, 1
		jne check03
		
		mov ax, BLOCK1_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check03
		
		mov ax, BLOCK1_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check03
		
		mov ax, BLOCK2_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check03
		
		mov ax, BLOCK2_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check03
		
		;call NEG_VELOCITY_Y
		mov BLOCK02, 0
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		check03:
		cmp BLOCK03, 1
		jne check03_1
		
		mov ax, BLOCK3_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check03_1
		
		mov ax, BLOCK3_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check03_1
		
		mov ax, BLOCK1_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check03_1
		
		mov ax, BLOCK1_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check03_1
		;call NEG_VELOCITY_X
		mov BLOCK03, 0
		
		check03_1:
		cmp BLOCK03, 1
		jne check10
		
		mov ax, BLOCK1_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check10
		
		mov ax, BLOCK1_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check10
		
		mov ax, BLOCK3_X
		cmp BALL_X, ax
		jg check10
		
		mov ax, BLOCK3_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check10
		
		;call NEG_VELOCITY_Y
		mov BLOCK03, 0
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		check10:
		cmp BLOCK10, 1
		jne check10_1
		
		mov ax, BLOCK_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check10_1
		
		mov ax, BLOCK_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check10_1
		
		mov ax, BLOCK2_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check10_1
		
		mov ax, BLOCK2_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check10_1
		;call NEG_VELOCITY_X
		mov BLOCK10, 0
		
		check10_1:
		cmp BLOCK10, 1
		jne check11
		
		mov ax, BLOCK2_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check11
		
		mov ax, BLOCK2_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check11
		
		mov ax, BLOCK_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check11
		
		mov ax, BLOCK_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check11
		
		;call NEG_VELOCITY_Y
		mov BLOCK10, 0
		
		;;;;;;;;;;;;;;;;;;;;;;;
		check11:
		cmp BLOCK11, 1
		jne check11_1
		
		mov ax, BLOCK1_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check11_1
		
		mov ax, BLOCK1_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check11_1
		
		mov ax, BLOCK2_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check11_1
		
		mov ax, BLOCK2_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check11_1
		;call NEG_VELOCITY_X
		mov BLOCK11, 0
		
		check11_1:
		cmp BLOCK11, 1
		jne check12
		
		mov ax, BLOCK2_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check12
		
		mov ax, BLOCK2_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check12
		
		mov ax, BLOCK1_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check12
		
		mov ax, BLOCK1_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check12 
		
		;call NEG_VELOCITY_Y
		mov BLOCK11,0
		
		;;;;;;;;;;;;;;;;;;;;;;;
		
		check12:
		cmp BLOCK12, 1
		jne check12_1
		
		mov ax, BLOCK2_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check12_1
		
		mov ax, BLOCK2_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check12_1
		
		mov ax, BLOCK2_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check12_1
		
		mov ax, BLOCK2_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check12_1
		;call NEG_VELOCITY_X
		mov BLOCK12, 0
		
		check12_1:
		cmp BLOCK12, 1
		jne check13
		
		mov ax, BLOCK2_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check13
		
		mov ax, BLOCK2_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check13
		
		mov ax, BLOCK2_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check13
		
		mov ax, BLOCK2_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check13
		
		;call NEG_VELOCITY_Y
		mov BLOCK12, 0

		;;;;;;;;;;;;;;;;;;;;;;
		check13:
		cmp BLOCK13, 1
		jne check13_1
		
		mov ax, BLOCK3_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check13_1
		
		mov ax, BLOCK3_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check13_1
		
		mov ax, BLOCK2_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check13_1
		
		mov ax, BLOCK2_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check13_1
		;call NEG_VELOCITY_X
		mov BLOCK13, 0
		
		check13_1:
		cmp BLOCK13, 1
		jne check20
		
		mov ax, BLOCK2_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check20
		
		mov ax, BLOCK2_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check20
		
		mov ax, BLOCK3_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check20
		
		mov ax, BLOCK3_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check20
		
		;call NEG_VELOCITY_Y
		mov ax, 0h
		mov BLOCK13, ax
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		check20:
		cmp BLOCK20, 0
		jne check20_1
		
		mov ax, BLOCK_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check20_1
		
		mov ax, BLOCK_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check20_1
		
		mov ax, BLOCK3_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check20_1
		
		mov ax, BLOCK3_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check20_1
		;call NEG_VELOCITY_X
		mov BLOCK20, 0
		
		check20_1:
		cmp BLOCK20, 1
		jne check21
		
		mov ax, BLOCK3_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check21
		
		mov ax, BLOCK3_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check21
		
		mov ax, BLOCK_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check21
		
		mov ax, BLOCK_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check21
		
		;call NEG_VELOCITY_Y
		mov BLOCK20, 0
		;;;;;;;;;;;;;;;;;;;;;;;;
		
		
		check21:
		cmp BLOCK21, 1
		jne check21_1
		
		mov ax, BLOCK1_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check21_1
		
		mov ax, BLOCK1_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check21_1
		
		mov ax, BLOCK3_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check21_1
		
		mov ax, BLOCK3_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check21_1
		;call NEG_VELOCITY_X
		mov BLOCK21, 0
		
		check21_1:
		cmp BLOCK21, 1
		jne check22
		
		mov ax, BLOCK3_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check22
		
		mov ax, BLOCK3_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check22
		
		mov ax, BLOCK1_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check22
		
		mov ax, BLOCK1_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check22
		
		;call NEG_VELOCITY_Y
		mov BLOCK21, 0
		;;;;;;;;;;;;;;;;;;;;;;;
		
		check22:
		cmp BLOCK22, 1
		jne check22_1
		
		mov ax, BLOCK2_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check22_1
		
		mov ax, BLOCK2_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check22_1
		
		mov ax, BLOCK3_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jl check22_1
		
		mov ax, BLOCK3_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jg check22_1
		mov BLOCK22, 0
		;call NEG_VELOCITY_X
		
		check22_1:
		cmp BLOCK22, 1
		jne check23
		
		mov ax, BLOCK3_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check23
		
		mov ax, BLOCK3_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check23
		
		mov ax, BLOCK2_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check23
		
		mov ax, BLOCK2_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check23
		
		mov BLOCK22, 0
		;call NEG_VELOCITY_Y
		
		;;;;;;;;;;;;;;;;;;;;;;;;
		
		check23:
		cmp BLOCK23, 1
		jne check23_1
		
		mov ax, BLOCK3_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check23_1
		
		mov ax, BLOCK3_X
		add ax, BLOCK_SIZE_Y
		cmp BALL_X, ax
		jg check23_1
		
		mov ax, BLOCK3_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check23_1
		
		mov ax, BLOCK3_Y    
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check23_1
		;call NEG_VELOCITY_X
		mov BLOCK23, 0
		
		
		
		check23_1:
		cmp BLOCK23, 1
		jne check24
		
		mov ax, BLOCK3_Y  
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check24
		
		mov ax, BLOCK3_Y
		add ax, BLOCK_SIZE_X
		cmp BALL_Y, ax
		jg check24
		
		mov ax, BLOCK3_X
		add ax, BLOCK_SIZE_Y  
		cmp BALL_X, ax
		jg check24
		
		mov ax, BLOCK3_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check24
		
		;call NEG_VELOCITY_Y
		mov BLOCK23, 0
		
		check24:
		mov ax, BAR_Y
		sub ax, BALL_SIZE
		cmp BALL_Y, ax
		jl check25
		
		mov ax, BAR_X
		sub ax, BALL_SIZE
		cmp BALL_X, ax
		jl check25
		
		mov ax, BAR_X
		add ax, BAR_SIZE_X
		cmp BALL_X, ax
		jg check25
		call NEG_VELOCITY_Y
		
		check25:
		
		ret
		
		NEG_VELOCITY_X:
			neg BALL_VELOCITY_X   
			ret
			
		NEG_VELOCITY_Y:
			neg BALL_VELOCITY_Y   
			ret
	
	MOVE_BALL endp
	
	DRAW_BAR proc near
		
		mov cx, BAR_X
		mov dx, BAR_Y
		
		cmp BAR, 1
		jne ne_crtaj_bar
		
		DRAW_BAR_1:
		mov ah, 0ch
		mov al, 01h
		mov bh, 00h
		int 10h
			
		inc cx
		mov ax, cx
		sub ax, BAR_X
		cmp ax, BAR_SIZE_X
		jng DRAW_BAR_1
			
		mov cx, BAR_X
		inc dx
			
		mov ax, dx
		sub ax, BAR_Y
		cmp ax, BAR_SIZE_Y
		jng DRAW_BAR_1
		
		ne_crtaj_bar:

		
		ret
	
	DRAW_BAR endp
	
	
	MOVE_BAR proc near	

		mov ah, 1h
		int 16h
		jz izadji
		
		mov ah, 00h
		int 16h
		
		cmp al, 97
		je levo
		
		cmp al, 100
		je desno
		jmp izadji
		
		levo:
		mov ax, BAR_X
		cmp ax, 7
		jl ne_pomeraj_levo
		sub BAR_X, 7h
		ne_pomeraj_levo:
		ret
		
		desno:
		mov ax, BAR_X
		add ax, BAR_SIZE_X
		add ax, 9
		cmp ax, WINDOW_WIDTH
		jg ne_pomeraj_desno
		add BAR_X, 7h
		ne_pomeraj_desno:
		ret
		
		izadji:
		
		ret
	
	MOVE_BAR endp
	
	LOPTICA proc near
		cmp BALL, 1
		jne ne_crtaj_lopticu
		call DRAW_BALL
		
		ne_crtaj_lopticu:
	
		ret
	
	LOPTICA endp
	
	
	DRAW_BALL proc near
		
		mov cx,BALL_X 
		mov dx,BALL_Y 
		
		cmp BALLCOLOR, 0
		jne drawball1
		
		DRAW_BALL_HORIZONTAL:
			mov ah,0Ch 
			mov al,0fh 
			mov bh,00h ; 
			int 10h    
			
			inc cx     
			mov ax,cx  
			sub ax,BALL_X 
			cmp ax,BALL_SIZE
			jng DRAW_BALL_HORIZONTAL
			
			mov cx,BALL_X 
			inc dx        
			
			mov ax,dx    
			sub ax,BALL_Y
			cmp ax,BALL_SIZE
			jng DRAW_BALL_HORIZONTAL
			
		drawball1:
		mov cx,BALL_X 
		mov dx,BALL_Y 
		
		cmp BALLCOLOR, 1
		jne drawball2
		
		DRAW_BALL_HORIZONTAL1:
			mov ah,0Ch 
			mov al,0eh 
			mov bh,00h ; 
			int 10h    
			
			inc cx     
			mov ax,cx  
			sub ax,BALL_X 
			cmp ax,BALL_SIZE
			jng DRAW_BALL_HORIZONTAL1
			
			mov cx,BALL_X 
			inc dx        
			
			mov ax,dx    
			sub ax,BALL_Y
			cmp ax,BALL_SIZE
			jng DRAW_BALL_HORIZONTAL1
			
		drawball2:
		mov cx,BALL_X 
		mov dx,BALL_Y 
		
		cmp BALLCOLOR, 2
		jne drawball3
		
		DRAW_BALL_HORIZONTAL2:
			mov ah,0Ch 
			mov al,9h 
			mov bh,00h 
			int 10h    
			
			inc cx     
			mov ax,cx  
			sub ax,BALL_X 
			cmp ax,BALL_SIZE
			jng DRAW_BALL_HORIZONTAL2
			
			mov cx,BALL_X 
			inc dx        
			
			mov ax,dx    
			sub ax,BALL_Y
			cmp ax,BALL_SIZE
			jng DRAW_BALL_HORIZONTAL2
			
		drawball3:
		mov cx,BALL_X 
		mov dx,BALL_Y 
		
		cmp BALLCOLOR, 3
		jne drawball4
		
		DRAW_BALL_HORIZONTAL3:
			mov ah,0Ch 
			mov al,0bh 
			mov bh,00h ; 
			int 10h    
			
			inc cx     
			mov ax,cx  
			sub ax,BALL_X 
			cmp ax,BALL_SIZE
			jng DRAW_BALL_HORIZONTAL3
			
			mov cx,BALL_X 
			inc dx        
			
			mov ax,dx    
			sub ax,BALL_Y
			cmp ax,BALL_SIZE
			jng DRAW_BALL_HORIZONTAL3
			
		drawball4:
		
		
		ret
	DRAW_BALL ENDP
	
	LOSE proc near
		mov BLOCK00, 0
		mov BLOCK01, 0 
		mov BLOCK02, 0 
		mov BLOCK03, 0 
		mov BLOCK10, 0  
		mov BLOCK11, 0 
		mov BLOCK12, 0 
		mov BLOCK13, 0 
		mov BLOCK20, 0 
		mov BLOCK21, 0 
		mov BLOCK22, 0  
		mov BLOCK23, 0 
		mov BALL, 0 
		mov BAR, 0 
		mov BALL_VELOCITY_X, 0
		mov BALL_VELOCITY_Y, 0
		mov LOSE_FLAG, 0
		
		mov cx, 40h
		mov dx, 30h
		
		DRAW_L1:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 40h
			cmp ax, 4h
			jng DRAW_L1
			
			mov cx, 40h
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 10h
			jng DRAW_L1
			
		mov cx, 44h
		mov dx, 3ch
			
		DRAW_L2:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 44h
			cmp ax, 7h
			jng DRAW_L2
			
			mov cx, 44h
			inc dx
			
			mov ax, dx
			sub ax, 3ch
			cmp ax, 4h
			jng DRAW_L2
			
		mov cx, 4fh
		mov dx, 30h
		
		DRAW_O1:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 4fh
			cmp ax, 4h
			jng DRAW_O1
			
			mov cx, 4fh
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 10h
			jng DRAW_O1
			
		mov cx, 5ah
		mov dx, 30h
		
		DRAW_O2:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 5ah
			cmp ax, 4h
			jng DRAW_O2
			
			mov cx, 5ah
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 10h
			jng DRAW_O2
		
		mov cx, 53h
		mov dx, 30h
			
		DRAW_O3:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 53h
			cmp ax, 7h
			jng DRAW_O3
			
			mov cx, 53h
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 4h
			jng DRAW_O3
			
			
		mov cx, 53h
		mov dx, 3ch
		
		DRAW_O4:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 53h
			cmp ax, 7h
			jng DRAW_O4
			
			mov cx, 53h
			inc dx
			
			mov ax, dx
			sub ax, 3ch
			cmp ax, 4h
			jng DRAW_O4
			
		mov cx, 62h
		mov dx, 30h
		
		DRAW_S1:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 62h
			cmp ax, 0dh
			jng DRAW_S1
			
			mov cx, 62h
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 3h
			jng DRAW_S1
			
		mov cx, 62h
		mov dx, 36h
		
		DRAW_S2:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 62h
			cmp ax, 0dh
			jng DRAW_S2
			
			mov cx, 62h
			inc dx
			
			mov ax, dx
			sub ax, 36h
			cmp ax, 3h
			jng DRAW_S2
			
		mov cx, 62h
		mov dx, 3ch
		
		DRAW_S3:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 62h
			cmp ax, 0dh
			jng DRAW_S3
			
			mov cx, 62h
			inc dx
			
			mov ax, dx
			sub ax, 3ch
			cmp ax, 3h
			jng DRAW_S3
			
		mov cx, 62h
		mov dx, 33h
		
		DRAW_S4:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 62h
			cmp ax, 3h
			jng DRAW_S4
			
			mov cx, 62h
			inc dx
			
			mov ax, dx
			sub ax, 33h
			cmp ax, 3h
			jng DRAW_S4
			
		mov cx, 6ch
		mov dx, 39h
		
		DRAW_S5:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 6ch
			cmp ax, 3h
			jng DRAW_S5
			
			mov cx, 6ch
			inc dx
			
			mov ax, dx
			sub ax, 39h
			cmp ax, 3h
			jng DRAW_S5
		
		mov cx, 73h
		mov dx, 30h
		
		DRAW_E1:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 73h
			cmp ax, 4h
			jng DRAW_E1
			
			mov cx, 73h
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 10h
			jng DRAW_E1
			
		mov cx, 77h
		mov dx, 30h
		
		DRAW_E2:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 77h
			cmp ax, 7h
			jng DRAW_E2
			
			mov cx, 77h
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 3h
			jng DRAW_E2
			
		mov cx, 77h
		mov dx, 3dh
		
		DRAW_E3:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 77h
			cmp ax, 7h
			jng DRAW_E3
			
			mov cx, 77h
			inc dx
			
			mov ax, dx
			sub ax, 3dh
			cmp ax, 3h
			jng DRAW_E3
		
		mov cx, 77h
		mov dx, 37h
		
		DRAW_E4:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 77h
			cmp ax, 7h
			jng DRAW_E4
			
			mov cx, 77h
			inc dx
			
			mov ax, dx
			sub ax, 37h
			cmp ax, 3h
			jng DRAW_E4
			
			
		mov ah, 1h
		int 16h
		jz nista_uneto
			
		mov ah, 00h
		int 16h
			
		cmp al, 27
		jne nista_uneto
		call kraj
	
		nista_uneto:
				
		ret
	LOSE endp
	
	
	
	CLEAR_SCREEN proc near
		mov ah, 00h
		mov al, 13h
		int 10h
		mov ah, 0bh
		mov bh, 00h
		mov bl, 0eh
		int 10h
		
		ret
		
	CLEAR_SCREEN endp
	
	PROVERA_POBEDA proc near 
		cmp BLOCK00, 0
		jne provera_opet
		cmp BLOCK01, 0
		jne provera_opet
		cmp BLOCK02, 0
		jne provera_opet
		cmp BLOCK03, 0
		jne provera_opet
		cmp BLOCK10, 0
		jne provera_opet
		cmp BLOCK11, 0
		jne provera_opet
		cmp BLOCK12, 0
		jne provera_opet
		cmp BLOCK13, 0
		jne provera_opet
		cmp BLOCK20, 0
		jne provera_opet
		cmp BLOCK21, 0
		jne provera_opet
		cmp BLOCK22, 0
		jne provera_opet
		cmp BLOCK23, 0
		jne provera_opet
		cmp LOSE_FLAG, 1
		jne provera_opet
		call WIN
		
		provera_opet:
	
		ret
	
	PROVERA_POBEDA endp
	
	WIN proc near
		mov BLOCK00, 0
		mov BLOCK01, 0 
		mov BLOCK02, 0 
		mov BLOCK03, 0 
		mov BLOCK10, 0  
		mov BLOCK11, 0 
		mov BLOCK12, 0 
		mov BLOCK13, 0 
		mov BLOCK20, 0 
		mov BLOCK21, 0 
		mov BLOCK22, 0  
		mov BLOCK23, 0 
		mov BALL, 0 
		mov BAR, 0 
		mov BALL_VELOCITY_X, 0
		mov BALL_VELOCITY_Y, 0
		
		mov cx, 40h
		mov dx, 30h
		
		DRAW_W1:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 40h
			cmp ax, 3h
			jng DRAW_W1
			
			mov cx, 40h
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 8h
			jng DRAW_W1
			
		mov cx, 43h
		mov dx, 38h
		
		DRAW_W2:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 43h
			cmp ax, 3h
			jng DRAW_W2
			
			mov cx, 43h
			inc dx
			
			mov ax, dx
			sub ax, 38h
			cmp ax, 3h
			jng DRAW_W2
			
		mov cx, 46h
		mov dx, 35h
		
		DRAW_W3:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 46h
			cmp ax, 3h
			jng DRAW_W3
			
			mov cx, 46h
			inc dx
			
			mov ax, dx
			sub ax, 35h
			cmp ax, 3h
			jng DRAW_W3
		
		mov cx, 49h
		mov dx, 38h
		
		DRAW_W4:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 49h
			cmp ax, 3h
			jng DRAW_W4
			
			mov cx, 49h
			inc dx
			
			mov ax, dx
			sub ax, 38h
			cmp ax, 3h
			jng DRAW_W4
		
		mov cx, 4ch
		mov dx, 30h
		
		DRAW_W5:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 4ch
			cmp ax, 3h
			jng DRAW_W5
			
			mov cx, 4ch
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 8h
			jng DRAW_W5
		
		mov cx, 53h
		mov dx, 30h
		
		DRAW_I:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 53h
			cmp ax, 3h
			jng DRAW_I
			
			mov cx, 53h
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 0ah
			jng DRAW_I
		
		mov cx, 5ah
		mov dx, 30h
		
		DRAW_N1:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 5ah
			cmp ax, 3h
			jng DRAW_N1
			
			mov cx, 5ah
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 0ah
			jng DRAW_N1
			
		mov cx, 5dh
		mov dx, 32h
		
		DRAW_N2:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 5dh
			cmp ax, 3h
			jng DRAW_N2
			
			mov cx, 5dh
			inc dx
			
			mov ax, dx
			sub ax, 32h
			cmp ax, 3h
			jng DRAW_N2
			
		mov cx, 60h
		mov dx, 35h
		
		DRAW_N3:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 60h
			cmp ax, 3h
			jng DRAW_N3
			
			mov cx, 60h
			inc dx
			
			mov ax, dx
			sub ax, 35h
			cmp ax, 3h
			jng DRAW_N3
			
		mov cx, 63h
		mov dx, 30h
		
		DRAW_N4:
			mov ah, 0ch
			mov al, 04h
			mov bh, 00h
			int 10h
			
			inc cx
			mov ax, cx
			sub ax, 63h
			cmp ax, 3h
			jng DRAW_N4
			
			mov cx, 63h
			inc dx
			
			mov ax, dx
			sub ax, 30h
			cmp ax, 0ah
			jng DRAW_N4
		
		mov ah, 1h
		int 16h
		jz nista_uneto1
			
		mov ah, 00h
		int 16h
			
		cmp al, 27
		jne nista_uneto1
		call kraj
	
		nista_uneto1:
		
		ret
	
	WIN endp
	
	
	
kraj: mov ax, 4c00h
int 21h

cseg ends

sseg segment stack 'STACK'
	dw 64 dup(?)
sseg ends

end draw