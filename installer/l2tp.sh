#!/bin/bash
#
# This file encrypted at Sat Dec 28 18:59:13 WIB 2024 by
# +------------------------------------------------------+
# | Author: Rerechan02                                   |
# | Reguon: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/fn_project / Admin  @Rerechan02 |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/Rerechan02
# Sponsor this project:
# -  https://t.me/fn_project/245
# -  https://prof.rerechan02.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | je:hZ:gK:xZ:RG:Jo:Ni:pm:mC:3o:eM:dU:u5:Pm:10:Uh:3G:V1:MO:MH:CC:Ss:V8:Lt:ku:2n:YZ:Dr:Kq:YZ:qW:ub:5X:7v:Bz:U4:gR:kK:QO:Xi:f3:M3:Ee:H2:xp:Aa:hM:6e:js:di:WM:cK:EN:Tx:DP:bk:1Z:Hp:fI:PF:Gh:cr:82:lG:ch:jD:OG:MR:Lt:4u:9Q:Ny:TR:Zr:u6:ZY:Ap:xq:yU:rA:nf:Ox:lM:Iw:qw:J3:Bg:4n:cA:oV:ZH:8C:2G:FU:iY:4j:Al:D5:I9:Y7:zw:eU:mQ:CJ:fP:Mr:ln:mf:13:Uz:tL:Vd:Om:Kp:13:fh:to:PM:Ol:w7:vV:V3:Vu:JK:Gu:HA:pH:41:wV:zH:Jl:r1:ve:dN:55:lg:RF:ZY:Cl:Pm:1n:Vr:ho:SZ:cn:Cu:pW:p1:Ck:zw:LK:mm:t1:Kp:og:oS:1L:pR:ET:6W:eG:lJ:vC:AV:cI:cF:LH:hB:9c:k5:30:PM:pn:Na:pY:ps:92:jB:nP:FQ:7f:rM:du:ZX:2y:wu:GK:Io:AF:zk:EG:jT:wA:Yt:RJ:YD:mj:bg:nX:iL:me:YO:Rq:5A:O0:mM:DB:YD:K6:ng:p2:Zc:9W:sv:aA:3F:Ya:wc:B0:ta:uK:Wf:in:z1:iU:J7:vZ:Hq:f7:di:zm:qj:za:Ix:rU:zv:Jz:DD:Zh:pI:H0:gk:lB:7D:Rb:JH:gc:ea:hd:6S:ys:RD:HJ:CK:fF:1E:Z2:YO:zg:i5:ZJ:oJ:ZQ:0H:j2:KP:fu:K7:Y1:pk:qV:lC:Ed:TG:OT:JI:7H:8J:Ro:VN:cZ:Fd:dJ:dP:JG:ja:Cz:WQ:lF:7B:MU:Ke:tY:6Q:6U:DK:af:uX:qx:iJ:Cu:U6:TD:rZ:dF:73:Ys:28:Zq:9a:E5:3l:92:Zx:R4:3p:mV:k3:v1:hn:ty:Vs:jv:pQ:IT:cb:by:gt:bF:Va:Cz:8k:ex:R2:Br:0Z:l9:lB:l4:2e:SO:Fl:Db:AM:ut:3v:dq:FM:0o:V4:pG:cr:It:8j:EO:Gf:4v:ok:ED:q5:R7:V8:EA:au:Dg:Ho:Wi:Hl:n0:AB:Jh:6l:Vr:ya:Ut:gm:T5:v6:tE:xr:fa:qG:GL:oF:Pv:Xd:3J:dn:bx:Fi:RB:CJ:It:Ii:1G:Jm:Xc:ae:0R:mt:Em:vE:xl:ai:Ng:gC:yw:72:1u:If:Sj:Gg:KU:xu:91:Ei:EI:Yj:4N:2m:lw:9Q:IA:bQ:PR:pc:lB:aF:ZD:KS:9t:CE:YE:li:e3:4I:Vk:xM:n5:Zz:70:kt:uR:xh:i8:NM:J9:2L:OR:64:ce:7y:19:w9:Id:Fb:Fq:p6:gj:9q:w8:ef:Q1:QJ:5W:7O:h7:ih:dz:pK:cz:SS:Z5:gC:P8:iu:u4:Ke:JL:rs:Df:vg:Jx:pK:Y4:SI:nI:t9:0U:zt:PM:U2:rv:3x:Qz:Ux:uL:5i:oT:9J:Ce:ZP:ni:Xp:10:fT:D5:Iw:ba:vO:vZ:4n:lH:cs:Un:SV:aZ:rx:qk:mr:x6:K7:pF:2m:YC:FF:fP:qm:2p:ZN:Vo:e0:Id:aJ:B6:rH:gN:QF:JX:6T:OT:dr:4S:zL:Mb:eQ:tR:YG:U1:0V:Ip:ZB:CP:ez:zM:UN:pS:AJ:QG:Uc:Qk:S8:Ji:Zt:1L:8c:Ur:9t:oN:j9:J4:0v:fz:xd:LU:YT:8d:oX:q8:Ka:tH:Zy:aC:iu:JI:Wa:LM:vJ:Gd:il:gJ:ui:UF:Nq:6p:as:Ks:hw:X8:7J:ra:U1:WP:5X:RL:Gm:BO:UZ:mp:NA:WJ:AA:Sj:L1:ac:Wr:ku:Vs:LU:a9:YS:uB:KX:4Y:Ui:2d:Zw:0s:mB:Iz:mp:0u:K3:xN:jW:2K:PP:dm:St:W7:o0:y7:iY:xS:w5:ah:ZA:zZ:W6:SJ:O5:Om:lU:5w:yi:Tq:Q9:A0:Rb:w7:iI:pw:QW:eZ:Pb:F0:TE:Mk:FZ:Xj:Vx:oN:tY:Lb:aE:Bj:eN:Nl:GD:XJ:ks:bg:ka:gE:nr:td:8I:Ib:Pm:AL:zY:0V:2p:G8:DW:DP:sD:Ee:r9:ug:y3:YO:oe:gb:VP:ed:PB:Z4:yX:C3:bE:Vp:Lk:9i:IN:sZ:K9:W2:9T:ef:6d:Gh:0r:GC:Gd:17:GN:2e:YS:kJ:3t:F4:U8:U0:LA:Xg:bf:1m:kp:wo:Dn:7z:oO:oQ:Pb:Op:bI:TW:7V:j7:pv:yV:Rf:CD:jj:Yg:96:9k:qO:Fr:XM:Ye:Pi:PF:U2:Rg:fR:oH:eH:Jd:oR:tE:Gc:8g:ly:lo:VO:dD:s0:la:RA:ku:Kn:py:vU:B7:ai:Ph:gi:k9:Ko:Zl:O3:eh:bQ:tC:a6:yi:k6:TA:au:Jh:Vc:i1:5S:Y4:LM:LY:15:M7:Zo:bl:GA:GJ:gi:7V:0z:aq:kQ:0V:2B:6T:yE:Ti:kX:vV:So:Yi:x2:Up:eV:cU:RZ:U8:aW:d4:3k:07:yL:8N:9d:wg:BY:sA:XH:nN:zp:5L:k6:L9:Fs:aD:2Q:Q4:fD:Ib:8e:en:fR:au:XK:yj:tD:Wf:et:Ne:uT:w7:qH:9r:Iv:cO:ig:PC:SN:gf:xj:NE:5V:v7:f0:sT:gH:8c:CF:ep:V9:Jy:Eo:WN:Iu:Wp:kY:s0:57:ov:hv:LC:K4:3t:G8:nO:Xw:V2:87:e4:4d:I1:mi:HT:Qk:TI:qE:Hz:gN:Wy:lR:vc:ZZ:99:cM:6J:dE:Bv:99:6B:v2:kC:ap:Wm:lY:Pm:fz:kr:Zp:9g:9c:Ms:Ub:9L:2Y:xe:Dz:bE:Av:KA:gZ:ku:w1:ER:HN:if:rJ:0H:u9:xU:2Q:IW:eO:Q6:Ci:i5:JU:vI:3j:ns:Td:y1:3m:cg:rF:Pf:xH:YV:sC:Kz:2a:r3:4H:y1:OG:ci:vf:30:GH:Md:gZ:LI:68:2K:ut:jz:iX:1W:4N:Gz:1j:iA:bC:TB:YI:Lm:um:4u:Ao:RH:wG:Cp:DS:AG:rC:Rz:v7:ek:tq:wc:Fg:oQ:sp:Bm:aa:Qc:l2:R8:AK:Lw:gn:fE:G9:BS:rd:7e:zh:DW:vG:el:mV:FX:Vr:TB:TM:mZ:b7:ho:9w:yV:W9:Qb:VA:v2:eQ:ke:WR:5u:4t:PQ:dz:Fm:LJ:i9:87:rL:VH:Tc:s5:6a:AT:gM:oS:Ch:PA:aL:sM:NW:DH:E9:Ke:Hx:uT:Ec:Eg:V6:Un:YJ:Zo:Lr:zp:qA:rv:EG:BD:YD:Kr:er:hm:FJ:eq:71:VN:vW:Za:3i:CQ:Ct:Ql:Tm:4k:bW:49:Te:BX:or:b9:Pr:b2:03:s5:JS:Fs:VB:sm:iL:Do:mj:fF:IV:Sm:B5:i5:Cv:x1:Lt:wj:EA:qb:yy:6z:Kd:RG:y2:IQ:ZH:XW:8n:i3:HR:PR:Y3:AE:cH:rX:Sn:OV:eG:xd:QH:gO:Qc:Sz:9t:gA:Cq:he:W5:a8:1D:gd:dw:ix:6n:2O:kV:Hs:xX:Sq:5L:UM:ji:ui:Vz:mQ:ix:Mu:XA:Ei:WJ:72:Em:sz:CH:HS:He:qt:XX:0n:LI:P0:RC:xp:8p:As:mb:h6:RK:mW:BJ:WK:7u:yB:Av:X6:zw:Ch:CK:8z:2p:Ms:Qe:4p:cT:jA:OF:Pm:pN:6q:W7:fV:Ps:z0:Bo:P6:pc:ah:45:NF:ck:Wc:GL:sD:JL:ai:yq:Dn:3B:6X:k7:mo:0W:OO:Pu:e1:sE:b0:hg:GV:Te:EC:1E:x3:Xg:Vf:BE:Tt:tk:xr:hr:Ub:Vy:lk:3u:RK:vf:8b:bE:lp:Js:eI:H9:XS:PE:cy:D5:Yj:TP:no:vs:vg:Qh:fH:ZE:cd:r6:pi:I6:SI:Vp:xD:7S:Oa:Ic:Fw:Qe:GA:0X:7Q:Gd:zD:TL:qj:wp:cK:TC:GT:Kc:7p:WJ:vZ:c6:Gi:2d:hm:xu:2K:gg:mU:pi:ja:o2:0v:1G:HD:BJ:j4:Yl:7K:lX:eW:ag:92:b0:NK:eU:Nm:cw:lE:ac:x9:En:ys:8I:Z3:Bw:CE:U2:Vt:4q:uu:bI:9I:fV:he:nv:cx:uq:T5:Cx:aV:O0:LX:6D:Nt:si:eD:ve:n1:Tb:FE:Ay:JQ:cx:Ia:Wb:tn:kj:6t:6j:ot:bb:NB:Bk:kb:BF:xg:Pn:I7:p0:DY:MU:et:PM:Nv:UL:NF:uW:qg:nf:m9:3a:dW:Jy:OG:Lp:Io:kZ:ka:st:2u:Lc:bK:dc:dJ:Kn:gJ:ih:Zk:Di:jG:Cr:Yc:Xu:vr:ge:Ed:Uc:hh:88:RP:D4:mZ:lh:y4:a3:Gx:o4:Ql:VD:9B:Kv:TB:OM:Wp:Cs:og:ol:Aq:DQ:15:ng:B1:c6:G4:4Z:tC:oQ:YI:do:Wl:b7:BX:gq:Ub:zU:Et:Rw:2C:Ja:1t:kN:l0:8n:7I:WP:4Q:vO:8j:df:Wq:pY:uw:6Z:EG:OT:mW:V2:gR:JH:Am:hj:3q:W4:oS:MW:ls:2e:Pv:XZ:Z8:4w:O5:7k:FX:Eh:Ke:VJ:si:Xr:2H:9B:k1:ak:2t:h6:s5:NW:pE:07:3u:5r:9X:67:v0:71:Ec:4A:kb:Ro:zk:GG:o7:0H:FE:IW:pN:Wt:KP:nw:qq:vp:nR:3p:Lm:oZ:VF:bU:Zn:5p:zb:kj:H3:l3:Oe:jD:ZI:2B:lh:Hr:nG:r7:e1:r6:ra:XD:OI:G4:f7:oX:iw:Fh:Cg:RX:8g:2x:bq:iQ:TR:kH:iQ:aQ:OT:5f:IF:Qi:jc:CG:zL:99:Gv:OB:2i:N3:sV:wb:3B:oB:LP:Wh:Sa:Gf:Sj:jQ:8I:9o:9P:Ly:19:RE:7n:00:tm:Bu:iX:ko:rj:yT:kr:M3:aB:bb:Xu:3L:M1:92:Ta:h8:hw:YY:ag:9c:Di:or:jk:YL:8b:oT:rl:Nv:2A:QB:3U:rq:gK:bz:gj:dM:va:d0:6l:S6:ZZ:Zc:mU:we:Xz:cg:Ex:su:0v:7L:WE:gC:Xx:iO:fa:9k:UZ:sm:uU:AY:Ug:mJ:pF:3i:aP:M1:Sh:YK:uU:3x:I4:Wy:nH:3U:KC:Em:fK:FT:kv:tK:qN:i4:J9:xu:4c:xh:K8:ti:Tq:kF:67:h6:AW:rg:jQ:Cw:Mp:3A:g6:ay:ut:bi:1N:2M:UV:I5:6y:Xp:W0:GA:is:Un:yy:2V:7H:8n:cp:4i:xX:63:RE:7z:0g:dG:hC:QS:9x:9M:OF:Y2:bO:bJ:wF:7T:8o:Et:hY:cH:Mg:97:YO:OW:Nk:Vr:yn:so:2h:qX:KP:G9:Js:Hx:hu:nr:CQ:q4:XJ:ac:he:Gn:ar:Du:xb:Fl:Az:pf:85:B7:zY:tm:qH:Ad:OE:z7:X2:Xs:L2:Ct:dg:iW:Zf:wj:0d:Ga:bC:qI:kH:qQ:X3:P3:75:05:ba:j7:Hy:W4:zi:zl:Wc:Hg:Kp:O7:pY:n6:Yr:tE:aX:Lo:Yq:Ec:Ps:DO:IF:fy:N7:Cz:tl:Dd:kR:Bb:Jx:Le:f5:SA:4Z:Cn:TW:DS:ik:sn:ix:f6:QL:PM:E5:EW:FW:1R:6k:as:Au:Sv:Ia:PN:cc:Zg:ky:hx:6U:io:Nb:xw:Gk:Tp:hW:KZ:kq:p5:yu:NO:BD:GN:ta:bV:L5:dO:ZQ:lm:mL:1K:87:yB:DA:D0:Qu:W8:WE:q4:2J:XB:LY:vc:2q:CH:p5:DP:Yg:K0:Bm:al:lf:8k:RI:to:AF:VY:EV:yH:0c:3c:Oo:DL:CT:id:QE:K9:7x:rm:dg:CO:eA:Kp:DG:S2:9v:yb:ly:3f:1c:MT:au:he:t9:gb:RV:8D:ix:nf:Tp:pM:nm:dM:pU:21:zx:3S:p8:h7:Je:gS:Of:gW:Lq:oC:CI:Kb:mV:Bz:ti:cE:SC:mA:A7:r4:t1:rZ:LA:IZ:Bu:l8:8r:64:Aj:jr:lg:e5:tZ:L4:Lp:rs:xW:1g:yB:7F:XP:1G:tk:v3:oF:GW:ID:5v:vD:Lo:VZ:cw:yz:fq:X9:OM:KB:Fb:t8:lK:XY:ZW:O0:Ts:Sg:XH:Cf:c9:W5:Dl:2K:YD:tx:Wg:xO:cR:Ok:xF:OI:GM:1T:bd:2c:iu:cM:bA:BU:0Z:6U:LH:9l:yq:VU:eo:qb:5o:hv:BR:5B:fZ:f0:Bi:mJ:1j:yY:do:x3:Oy:ao:p7:bP:JE:wp:VZ:Jj:Re:M6:4c:CX:dm:Yt:eO:vZ:G1:2p:Sx:CX:Kf:Js:6s:1O:Ta:8I:Ni:u8:zr:BZ:zp:Nn:Uv:U4:lP:jA:2H:v4:Qu:bn:aK:Is:FR:rY:kQ:9p:8O:qD:WY:No:7Y:yG:On:gU:fu:Nu:XW:GE:8q:f8:4S:9z:dE:JE:82:ft:12:nF:qH:Qf:Qi:Cj:BR:CB:0t:yz:VX:Km:hg:1C:5L:hG:2i:pi:aV:ls:Yj:ab:wC:Ub:uc:GS:4s:dX:lX:tD:Rt:18:nI:AU:sO:sf:qS:Vm:JX:2p:9x:E5:bs:X4:OZ:IE:G7:fH:2Q:z1:FP:rN:G1:Yq:ho:0Q:GU:2G:Po:pY:Ck:98:4e:XQ:pO:ck:I8:Zp:a3:03:mA:UY:YE:4N:As:lS:SR:px:pa:CZ:nH:ED:Lr:F7:Aw:mh:ct:2b:PY:90:hw:pe:nF:GE:ES:eF:RK:GY:N0:Py:T2:RY:J1:xf:KU:RI:Yo:m7:wn:b6:Xb:Mo:8d:wb:jX:GO:0S:Ms:IT:Fb:Pq:ci:U9:Ot:6h:JQ:1j:53:ZM:Za:ek:0Q:Tv:98:RY:Kl:Ak:O0:c7:zF:ST:1b:u3:Fj:8A:hW:Zj:st:JA:IU:hM:fn:fs:TW:PM:mW:4B:ld:BI:5b:a9:Ud:ym:K2:AM:Mp:Z9:A9:cM:Th:XB:Hz:VH:W2:as:zh:BR:gm:PF:Kr:Gv:Yo:qK:TZ:r1:Mv:Lz:MM:2V:iQ:pD:a7:YJ:vn:31:c1:Sc:HR:Pn:Qq:2z:vX:3q:Ql:tG:5D:Y3:xX:eS:vl:ud:u8:jI:Oi:TN:nj:4p:Iq:pW:wx:PF:NS:mF:qa:8k:Cz:aw:Yf:l7:YH:3K:uN:Mc:gQ:vt:El:DK:Va:au:GA:OD:kQ:BM:hN:FM:MJ:9e:nW:KW:4M:w6:MO:Ym:xp:Gl:nk:8I:zE:aA:eW:Rx:Ci:9x:gP:6p:bb:lb:Jc:es:xb:c6:kU:P8:3k:tL:Ju:sa:lq:c8:tL:D0:6V:1H:uF:lq:IU:qH:Kn:wX:Ic:xD:CN:i6:uD:r7:XB:R9:Wk:KV:l6:TQ:BP:Hs:uH:60:Zr:ia:1x:J3:EK:y2:ZK:nk:4e:rl:mS:YY:q4:nm:dz:kA:z0:Jw:4f:4L:BH:s2:Yv:g4:yc:Dr:fV:Sc:2A:ji:Lv:Vg:Ck:if:TN:Fm:CN:o5:JC:PC:sl:es:3l:Uf:wx:UO:kT:8i:Nd:0c:ej:NZ:Cv:ef:iB:Ng:8d:ur:mz:lz:Pl:tx:84:B5:3V:ue:mh:xv:c5:qn:Gz:Yu:CN:dC:VB:GO:4u:Cp:WE:um:vH:2r:wy:ij:rt:cR:Zn:IJ:ap:7P:1G:GS:od:XY:1K:ge:D2:4u:7g:ep:6m:fJ:tB:Q4:N5:uL:ki:a6:hh:ER:s7:16:AD:gW:t5:UV:Tc:4E:D3:y0:VL:jw:oq:j9:0N:eh:xe:V9:qJ:Pc:DV:3S:v0:1o:eM:ay:eN:7H:O9:nb:oZ:Am:xE:zI:Un:Kz:U7:fY:hG:iv:ji:2E:5u:XW:b1:DK:p2:mN:x4:Jj:dE:GP:fr:sL:qg:jX:4w:eY:5P:cW:Kn:u4:iY:xp:SQ:bz:tm:Wr:IO:6c:19:zx:CJ:LC:YK:v8:O8:rl:jB:dj:sx:iL:dM:7f:FQ:Be:nm:kd:qY:Kv:mT:sJ:Nu:pm:Z9:da:IW:EE:Pe:XD:LQ:DN:YE:E3:77:mh:Br:y8:lQ:hm:Tp:kQ:8Z:K7:9L:tm:UX:ro:Mw:os:77:DZ:Tb:G6:gA:81:FK:DZ:GQ:3R:y4:GT:QJ:sN:s3:1m:Dd:dg:rM:M2:Ij:Vr:OW:QA:bi:bg:YQ:CO:2N:tT:0w:GM:r3:Xc:Ua:kX:z5:Ap:eN:Dh:bC:Vv:iX:1q:jO:bZ:H4:wF:Vk:Fh:38:Rm:ym:BK:7f:1H:i9:nL:qw:HP:bc:RJ:g0:XV:nB:7I:NV:de:hp:hf:so:vD:Jz:0E:U1:Fn:4H:Kg:h8:BB:yz:Qz:H6:Ke:gj:ku:bN:xP:7C:US:C3:ON:0I:mr:gp:Ex:z8:Sf:sz:KF:uf:Kj:mi:is:z5:oM:gF:ci:RG:t5:pw:kZ:Wq:Hb:GS:VL:kc:ss:tv:6a:e9:vf:ZG:FV:yp:Sv:LV:qp:bE:0W:iA:9y:wj:fu:wA:pP:aN:TQ:s2:kr:UL:4z:Ze:Lh:KV:4d:xs:g1:Lm:uL:SU:Yr:Yc:yG:MW:t3:II:T5:gC:HY:5W:vY:HH:AC:42:x0:Pw:M4:1j:y2:iK:Nm:Vo:Ae:gh:S2:bw:Z7:iX:PA:U9:zH:Ml:JV:B1:gt:OZ:Rg:W8:0P:KJ:y7:L0:qr:hS:J7:JY:st:yO:ND:28:Dg:Zj:Cy:Fd:if:H0:9r:Mv:Jm:uF:I6:Uv:So:AM:a0:gl:EJ:I1:gk:nj:n4:f5:wo:Ct:AJ:zA:U6:Oz:C0:ZZ:dG:Jc:nR:Fk:BR:mJ:Qc:Ob:29:1n:5m:AY:9i:4F:TO:Ty:XQ:12:ch:gI:ok:yd:YF:HC:Qp:x6:7X:0e:DP:p2:7B:Js:zz:pz:3E:a6:Pc:Hi:jm:84:Zj:vp:u0:ub:Vs:cI:Mj:MD:9U:hE:96:K0:Pd:TU:Fx:rr:ac:kl:q0:dl:xA:pD:Yd:V7:rV:JX:31:mn:wl:W7:op:Gq:nB:0x:zj:5j:zw:xc:Kv:ZR:kK:Z9:4z:bN:lb:W3:15:P2:7y:5n:qj:KZ:hs:zf:Gz:FQ:0O:yv:2C:da:wP:QP:za:5c:5G:gb:jV:CJ:vw:yB:x1:8i:pL:V0:aA:Sy:gt:O4:2o:3Y:68:oh:Gv:3M:6l:gJ:Gs:4s:zl:VM:u3:lD:6J:DJ:sL:Qz:Ey:hN:c6:FU:J4:N9:nc:vK:oW:yw:cW:Jm:jj:Br:PX:2l:c9:PV:oj:dS:c0:4s:i6:VU:ql:dk:Yr:gI:C4:90:iV:7g:tT:8S:QD:zh:jF:Xy:qi:gD:Th:6f:Oh:v8:yB:fX:pt:Ev:Oc:0L:Th:iq:9u:tf:Wh:5j:lI:MT:xI:0r:IS:Ez:3W:2H:r8:6R:vc:pV:Hv:7v:yA:IR:5U:T9:aG:D6:Uw:q6:Wr:l5:2T:aA:Ex:3E:i8:o7:Az:d5:Tg:65:Ik:Bt:uo:XX:99:B2:mK:GO:o8:LZ:Kb:Tn:Yy:uV:JT:0z:jx:uR:xa:ax:UC:Fv:mv:kM:7Z:sH:Mt:GE:se:XV:sr:Fd:35:4h:hn:xO:C9:N9:qk:3f:Kl:Cl:Yi:IN:99:C0:tp:Jl:EG:Er:wz:Jl:cr:2I:Pe:ZT:vy:oI:gw:QW:wA:UP:HQ:CT:IT:5H:hK:S9:jW:pr:8G:AB:g9:94:Xw:dt:No:mK:3R:Az:Zv:Sl:Zj:vl:SJ:hx:kO:vd:zc:Ia:W6:Ay:6i:0E:sH:M0:qq:d6:iv:Ve:fi:Yn:bz:Eo:EJ:kp:gH:bR:lZ:Yr:Bo:Pg:yR:mK:R2:rs:8s:Ej:kV:JL:K4:gB:wQ:ji:Sx:dD:mG:cK:4n:fo:G3:ao:Ze:Rb:Gq:8E:LQ:Xa:hq:Sr:KD:Os:jV:5F:f3:dL:NQ:zs:Ot:Nk:6Q:Iz:ZZ:j5:97:6N:rV:KR:zZ:9b:XE:3q:kJ:8L:i4:Xd:Xg:E0:de:CC:5b:S2:Kt:WA:Of:SX:uI:S8:9n:Qc:mQ:0b:X7:Sy:Ej:Tx:8e:uS:ly:jQ:r5:MU:z9:sy:sv:Wn:zL:55:Fr:X3:WJ:JS:xa:93:XQ:Xs:Hs:Mn:nr:fe:DD:Mc:oW:Wq:jt:4A:03:Pj:eV:4z:gh:R7:qB:k9:vY:xP:Ca:nA:As:6i:t3:FC:TL:Fn:Nz:xA:d4:Af:Vp:pn:nu:L5:r2:xm:5m:Bp:8Y:8g:NA:Dt:vm:39:8B:He:Kp:WD:MH:pl:hh:PM:y6:O8:j6:4T:Gn:AA:q5:kY:3U:TA:pN:tn:CD:b3:sj:9a:gn:o7:cj:XP:rM:DU:Ds:rB:nO:c6:us:6a:TU:o4:Oi:5g:nf:6E:JD:FI:Da:9d:eV:6R:GR:5n:3L:yv:Fp:dV:St:dO:UE:Ny:Og:8k:fH:jj:5f:pX:u0:Xw:fq:9F:9K:eg:6v:29:cz:4n:Su:yC:Pb:Z0:7P:e2:Kj:UN:LH:JA:ol:YN:jR:HW:SW:B4:Uf:pN:Q9:7v:IB:Nq:Id:aK:dH:ij:sy:vF:Vq:Sy:dX:cJ:1d:Mb:RG:SB:tS:pm:Yg:SD:Cv:Fn:Kx:KK:U0:S3:wp:st:WQ:mk:ge:cH:ZB:De:Xo:lR:Pl:XS:Ft:6e:Sh:DS:1R:Lz:yl:Au:6H:AI:5O:zY:0v:qA:8j:Hk:uc:0r:Xg:fI:fR:um:tB:K3:27:oB:oY:ZA:sq:uy:Jp:YG:6o:eb:nF:0E:tP:Ds:ps:kx:hU:YL:VX:fI:81:8E:pw:nB:Yd:ND:ie:YF:Ei:zK:Pn:XI:Ty:uh:OK:xd:jC:YN:3F:x6:q5:7r:zK:It:Dy:tl:qE:9H:ur:6x:RT:g6:mF:ch:eI:Nb:Pt:xu:9g:3B:Ro:tm:hB:98:CB:ze:d1:r7:hz:iT:Mu:UY:AS:Yy:dj:jr:Kw:s1:Bl:gG:Zg:CB:V0:ql:cq:t5:al:F0:jy:5f:fS:34:nf:zR:C5:LC:CI:Sw:lu:TJ:PI:Gm:8b:50:HH:Yj:l2:wD:ZH:RO:31:xU:I7:dS:jj:Db:D6:Si:Eq:jN:7w:RH:nF:BT:vN:q8:Hq:fC:Vj:2L:xh:qY:J0:OX:zH:Gu:np:O0:53:88:wT:ld:EE:pr:hT:ZX:Ii:9p:5l:tk:Xw:Lh:NZ:7Q:Jc:jj:Ky:JQ:Cp:JW:xB:OO:6O:Ob:ER:55:gx:FM:Rl:GR:qQ:hE:yQ:uU:9n:ie:7G:t5:q4:Hc:n5:bJ:vB:gB:iw:Ry:1q:jx:2O:mL:yk:pf:2P:5f:gy:29:jb:gx:Lq:2q:Ux:jM:kQ:c2:Yo:xL:ql:pn:Jh:jx:Wo:oV:Vj:h9:Bn:qF:0d:Qx:71:wS:f8:qL:7B:rO:NJ:Hw:XF:3F:Kv:Mm:a0:6T:nm:wL:YN:T7:I1:Nw:U5:Nx:Vb:zi:pz:oZ:rD:xu:7T:oz:ye:5K:gf:pS:C5:fo:xP:xf:d0:sw:Dl:MO:td:BL:h6:vU:jx:pA:Z5:zy:1s:97:Zp:pi:GQ:t4:GK:F3:Ye:cx:di:tz:VQ:1f:7A:zu:Xu:sY:H2:QY:Fd:be:Ld:0c:t7:25:lf:LT:Lq:OG:Bk:1F:sx:YX:Fm:39:YE:4c:7i:SH:g2:19:ki:dP:TZ:Nh:Qn:V1:gS:I0:6z:gs:2j:Ua:E7:Vb:Gm:vk:ki:9X:RO:e8:ig:iq:Vm:U1:Kq:Z4:xD:pP:NH:uu:80:Yp:MV:Qp:io:5N:UV:l7:ef:69:ZS:qW:v1:dM:2Z:TG:jo:Ym:ma:8z:Ip:JT:xw:uX:TW:24:W4:PT:BZ:oO:4N:oh:7O:ob:Wd:v6:kc:Ua:ZR:hu:4r:cM:wf:6V:kr:CT:ME:VN:Va:s7:TZ:ar:M0:hw:9u:2o:EB:JP:5T:h8:YG:qG:Jx:Ke:SR:sx:gp:BI:4e:QR:pd:mU:B6:6d:ZC:BG:gp:DZ:SV:UD:OT:DB:g1:0l:sv:wV:f9:EB:hx:8V:US:c0:ws:Nm:VO:QG:uB:9P:XW:J3:j0:63:fE:Nh:M0:l7:ty:Q6:s2:9B:Y5:3e:dm:SQ:4Q:CK:zL:AT:dI:Te:8O:sX:V1:in:P0:6o:Pd:Lk:8c:ml:lZ:7G:cq:CI:Cg:tV:Ed:Yd:TJ:lf:5o:mJ:eA:UW:LB:fB:la:Oz:sk:n7:re:uw:5V:SK:hc:jL:a2:Vo:5t:rD:7N:x4:Kh:44:oF:Zk:2i:nA:Pa:3u:XU:Oa:ak:eW:nm:Wr:Cj:Nq:Ch:Hp:4w:Uy:mj:7e:sI:lf:vS:ze:UR:Uv:Z4:IK:PF:hy:Cy:f4:kk:lF:8P:ie:Qx:vT:rj:ll:Nt:GF:Lq:8Z:Ef:Gr:cV:kg:mn:lS:rV:cT:PF:YS:Uj:Vt:Nt:Fy:sW:qp:rO:K9:qj:IP:io:N3:5W:7w:y6:tc:is:VD:KM:ZJ:JO:oH:rk:Q3:4a:BW:Cq:Oy:Sk:Mu:6F:gq:hm:oQ:q7:C1:yX:iE:ac:oy:50:yw:Wg:A4:B5:6L:7h:2D:E9:MP:rH:KE:9v:IB:We:lG:ir:uo:AI:HL:Mx:gA:VN:nj:BV:A6:eB:MA:T4:GQ:Y6:T0:Rk:72:aG:wz:iY:aN:Mt:KA:8F:yf:82:2x:sd:VC:tV:nH:PO:QA:1H:Rm:Wf:wj:bO:om:zd:0X:7Q:bI:LS:rD:XO:JI:p7:bk:ra:NI:kB:7q:Ag:Qg:Bh:vK:W0:Zi:sv:k5:qX:Wc:GC:5V:Ku:7I:QS:6N:Mp:fm:C8:d4:wV:8J:KX:8T:yt:Df:6L:oR:eI:1h:ET:vK:yu:9M:Un:oR:m2:vH:Wo:Gb:VF:Ki:wr:8p:QP:pi:8l:uv:sQ:KG:ct:rD:zJ:LE:01:ao:Ld:HY:Qo:62:dg:k0:nj:Jj:PB:2D:8F:Ch:AY:vu:ba:ji:sa:6d:or:zT:DQ:hF:1y:WS:nL:X7:sn:g6:Iq:rv:dN:Yt:ud:Ge:0o:iu:aT:A3:rY:As:kS:AS:eC:Mq:wZ:Mk:M7:yd:yD:Zw:bX:0f:rJ:Zm:sP:6J:GQ:Sm:NQ:xI:Ib:LV:lE:aD:Ug:aY:Pm:2h:IX:gq:5I:WG:K9:kL:m8:wR:Ns:GB:CU:NJ:LH:Nd:KN:HX:sz:ip:K1:vb:QV:K4:HW:w9:Gy:6f:6L:nC:5t:AD:9e:q3:9r:Ug:r6:G8:B1:R0:nz:0B:dc:lF:ou:VA:lz:15:UM:EP:fN:hX:Gc:Ge:KA:OF:V3:jw:nC:aU:4b:Mr:MT:Ra:M2:tA:sc:G8:1p:mr:8W:nh:pd:gl:8d:ij:Cx:sc:3f:dd:1H:MH:5J:8d:Fm:5Y:9o:Uh:hO:Np:TF:cl:1M:39:41:Vt:D0:Gv:4r:m9:8y:my:gA:wF:TZ:Uw:IJ:k8:af:GB:97:9C:tF:cz:Pe:uJ:Ku:ke:Vv:VL:XB:Xt:5u:LW:zy:2w:SB:Ln:cp:Ol:rQ:Ty:Xj:or:Cs:at:Sn:hL:0j:po:H8:S0:kn:lq:iz:SO:TZ:w2:E8:mv:Si:BY:yz:mN:SP:Nu:iD:9u:g0:Zp:HN:kX:Jm:Rf:Ac:sD:Uy:Md:Kk:ab:dg:DH:TB:bQ:L3:Cn:dG:wl:JO:vN:pf:uT:20:49:Ht:di:iu:KF:To:6W:cn:2b:k8:Uf:p0:J3:bA:p4:ka:Um:ep:GA:m9:8e:Ur:mt:0V:DE:wr:M5:SR:mW:Y5:my:tR:vR:lx: | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�
p�	�Ty��|��$W�G4O⇀ �ijkc@$֜��b0����T�X
Ma*ߡ����ռ���ԃ�4^�\lM�?�ē�9�M�F¢dచM��\�0E�ܶ�KSՁi�O�<\9i�l&�4o����\�ڍQ;�j!�Dj\�F [���q���q.�-��/����
U��!c1~��U؀j]/P��B���B�kH���3��"��i���E}���f�Pz��[\$�28Ғd�T�%Xԭ�
I޿~��r�l	�T���\f���[9��!����|�Q�����hWr�����H\1H�H�}d�ܗ���ɧ���i_fB�|���̟;r��l�ve�����=!:Hs�zn��7>�GV1��թ���É�z$�4��-\R��S`�ݩq���mh�<���H�َ-�OZi?�:Z�a�I�_ �M�aWb/wuo�v�s�����c\&C���`<�R��9��_�e�N�7SAa�7 2lZ�փ�}�<����@ �a3$��2Y�&/�rc�9���2=1�ۼ�j,�9xR���Ni��Qp���y��ꁣӳ)��{�;ED�T���Cp`�ڌ�i҂�E��_��g *�:���As�(���u��۪[`xR�*;�U�կ�t˧�{���<�97��8��3���N
4r�je/��a��lͨ'�&����c�i����=��$���f))�����-��\�7��%����������?�r�$&>
��1Ѥp��64dK�YĜ�rꋠ���'iI���pnƥ���~Z��M�/�д\q@��PKk���٢��f)לe�z��S�ג?Ȧ���?)�u�5�$�%)vV@Z���� F~���٬��bY�~א�j�]/Qn�M�-EjZ &߮�oeT���훓�ϗ��i��&4u���� ��On�)X��V�U.�Ub|�R�� ������gJ�V��p��|��c�6]��|垦e
+o����A�'��ќ� ��,K��u�V@�$Me���qݍ�m:#������w���{���Y�6���%�y�Rm�V˦E<��aW�S*��6 �^���C���VO�X��}�|��G�"Ía�q١?	S���ŎhpJYrMHS{��R\��pc.�S�8��&\��&�H�y��c# ��'�`�<�p�������%�L����Fk�Y?�I���Z	�>��Td@�2�F�JA�jla��h�q�j���e;��t�v�V��/=v@�+�m�t�o�S<½�*Ѥ�(�T};���=�p���t�_��"��)�fe>�7�`c��KmK���>b�٥en9ޱ��]��$g[n����(}>�^�?j8MV�۝��/�
�sY�C��'���X�����=ԭs����6�w{�0�: �	z�dd!�� rĩ����1��Vc����rE�'Y�3t�h��a9���i�B��]ݯ���@lK�BI�U�e%hٞCl淁�Jv{�!���Z�ҹj�y�ݚ.Qy$;I˙�h��@/����� 5��O�[(\:�V��g����X��2�8Q�S_�x�%��v�D�^!��I�?�p �0�Ќ/\啻�1C���
�?Q� ���Ѽ��z��LkF�[}����\�v_�1ECng�}bf���9h�����r`y��J�K��~����V����9��j��+�5sK�V�:U�z����Y��hM!�!Z;�Lo-:�uG��|���E%d�_�tB����������Ex���+�/X*/��@=��eWT{?a@��?�?�������§�j���f��{��_��9�