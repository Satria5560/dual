#!/bin/bash
#
# This file encrypted at Sat Dec 28 18:59:39 WIB 2024 by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | Ms:wV:EN:34:Bc:b9:BX:Gk:ea:jD:9Y:Y1:oP:tc:tj:PY:4b:l5:X7:lE:9w:lr:u4:OT:BR:0L:kP:Tt:GM:Fk:SG:C4:Lk:KP:m0:90:vM:p8:Yy:5C:KW:ZG:gR:vq:V5:oJ:pa:X0:pf:qO:Zj:iQ:3r:m7:wx:o6:rk:oA:WV:IZ:8A:yp:Mk:tB:GP:Ac:j7:rc:Mb:1H:AS:k2:bI:4w:yR:ML:BB:17:Id:BA:wx:So:VZ:W8:V4:xI:Cz:no:U5:ul:oB:uc:kX:WL:MW:v7:on:lN:ep:yq:jH:x8:G3:zd:Nf:Nu:Hf:qB:Qp:0o:4e:Fa:2Z:Lr:Op:0B:kk:Lw:7Q:MW:Jx:jY:Zm:ta:vR:aE:Sg:Ni:hi:2u:Lj:b1:IL:TB:82:N4:gM:fl:BH:Wa:uz:cw:dh:pD:7v:Yl:t9:DJ:hp:Kl:Q4:m6:QE:2b:wp:Rv:4x:CA:t3:Li:SO:2i:QH:4H:rd:s5:kc:Ae:7v:zf:uk:Pz:k1:TY:D9:QT:Ma:Vw:FY:Jx:b7:gK:9b:jp:J1:9G:La:aD:7a:Hk:oT:DI:50:XX:a5:5q:nm:sR:w1:mS:ze:Iv:ae:Ec:8D:y3:c0:T1:uU:Mt:te:C0:m1:8L:Py:N6:q6:Gs:kR:NS:0I:7t:uu:ar:jx:8g:qI:eq:1V:Mj:td:Se:4k:FX:8Q:hL:Tz:gE:jr:zG:jC:Zt:Qt:8x:wB:v6:Pg:nz:se:S6:ST:BV:MZ:LK:pY:wR:zY:Mv:vV:J5:UR:su:QR:X3:Xv:7w:aV:Sm:6L:E3:Vq:Fh:5Z:Jk:dV:mI:EY:lD:Bh:2O:pk:mI:yD:pA:G0:Bc:kp:30:mt:qN:u3:6Z:fw:p3:Wp:tC:Fr:e5:oA:ke:Hp:3Y:Q1:Qu:EY:Us:Pz:8t:1Z:ak:wa:cU:7s:v7:Ga:cJ:dG:MF:Kb:2X:OO:c7:as:TZ:Df:UL:Lh:AY:jm:09:lc:A5:l2:ts:Dn:UX:Pi:dS:sJ:Qb:Sx:jz:tk:cD:8y:TZ:eS:aP:GN:mS:Fh:RR:gy:fP:FF:Xw:2t:cR:xP:Z7:x9:XO:1K:Ez:5S:8X:VP:NG:6R:8Z:xk:LZ:S6:Y2:tu:5b:Qh:lv:nN:6o:Kg:rh:Xm:3Q:Ta:bW:fV:wm:yE:Cx:jy:DS:DA:7R:ny:SN:Up:Et:Ik:oC:4t:ul:UX:6W:m1:FT:iC:CV:i8:QT:Mf:eE:H0:49:L0:ge:th:Bh:6s:In:jw:fB:o4:hY:9Y:VP:yL:6A:fW:zP:RX:GM:L0:16:mG:uM:a5:8Y:k8:NT:TH:3Z:bX:vN:OB:7W:az:4E:Jd:3Q:m6:ig:m6:Wi:hn:6S:Hh:32:Os:yC:Xl:11:c7:un:Db:73:ma:2u:GN:An:pL:In:4F:iG:wS:2u:NU:Oy:up:y0:X2:AI:My:C2:AI:vO:ae:RS:Xi:LU:Lq:BW:KJ:Um:my:1e:E3:Tk:r3:6P:nt:NO:rp:rw:rB:J3:xp:Ja:pr:vW:V7:LJ:N4:PN:Om:hY:ps:Mi:MY:wn:cC:zr:Gf:SM:hI:wr:Wj:SM:5V:Ak:xN:oA:Jb:gD:zG:3M:Ea:W4:s4:A3:4B:2K:zG:5u:ks:Vg:2l:el:X1:SD:4B:LS:Xi:LK:bc:Ba:Ab:1L:EF:Zk:R0:1n:7Z:M5:QD:8U:yM:WL:4C:OM:0y:7L:wA:qx:rR:FC:3c:BW:En:fg:BS:aT:te:Uo:bL:oP:Hv:ku:sE:pc:Y1:Ds:sd:wd:HF:D6:MD:NN:M3:Ba:KB:zs:Cg:Dq:Kt:W1:L5:sr:Hy:9D:3V:zx:2v:gV:zP:Lx:zl:WJ:ep:RA:Qp:K8:hz:1F:C1:kp:sc:om:34:hP:Fh:fc:1w:Gf:CI:w2:Wr:8X:sR:r4:yO:kX:Vm:wR:kW:52:1u:uZ:rZ:9a:YI:Tx:2a:3l:EU:xa:Qp:fQ:U5:qu:kk:JX:VK:UP:IX:B5:2g:h7:oB:05:4B:FP:Ng:d9:KG:Jk:7u:2a:7n:zK:Zd:si:HM:pj:vD:qv:dF:pR:yt:ba:sQ:VT:Jz:bw:wo:cs:qV:mA:ne:ev:ke:bN:fu:0Z:dA:x2:jH:tU:94:7i:Gu:8q:M0:mC:71:2j:F7:AB:n2:w8:F4:xP:nW:ON:G8:Wh:oC:P7:XA:9p:8i:3J:Gh:4f:Zd:I1:rg:df:0s:GA:Eu:7c:qG:5K:wX:8X:ED:ud:3B:Gl:Pe:SY:6J:bq:Dn:tS:eb:U0:9B:n3:8t:rw:sB:eu:8j:6k:yU:hY:JH:wK:s1:eV:Df:sS:Pu:xg:TQ:Oj:kZ:AY:Si:Q4:fQ:c7:Cs:pI:4w:rt:qF:uM:5h:Hf:qS:cF:PT:b4:Dv:c7:70:in:u5:VC:9S:01:Kw:vi:di:X5:Jm:Uj:rQ:ji:RQ:dW:LA:a5:Lm:md:hg:F2:UN:64:QK:xf:c4:Xd:Bw:i4:02:j1:Z9:Mg:Ul:LS:Lb:st:O4:DS:nL:Pb:Q7:Bw:G9:SM:Xi:LE:84:jb:Yn:IY:XV:Eh:Ru:GC:QS:RA:pd:Kq:PO:2m:Y7:Ny:E0:Gq:qI:IH:Xi:DZ:2j:ga:0s:D1:01:BS:xC:YU:zZ:OU:P0:cs:WN:mN:bU:tZ:6o:ez:Jr:CA:TW:OW:EK:O9:jq:dP:Sq:yL:1Z:DE:0k:G3:vM:9y:v7:JI:Lv:u8:M3:9x:3m:3x:Fu:HU:9R:jm:cL:L7:Xp:yt:iY:NJ:JT:pP:O2:l8:c2:BE:9J:uX:Iu:4F:Uw:EA:mf:LU:UM:rJ:YK:kU:KR:0L:TW:UL:Qa:kE:US:57:h1:Rd:45:TA:lY:zO:VM:X7:ZN:3t:hW:lZ:Ex:1B:wT:lD:A8:vV:uH:gk:cz:bz:Hm:gn:uX:1v:ta:VA:Yv:dx:rh:Fq:RO:m6:Ir:z7:dL:Iu:1G:kI:C9:YK:qG:lg:lk:pX:EV:oG:ij:z9:k9:Kk:el:XF:2i:4B:et:mx:sg:0Z:t6:vy:9a:qT:C2:ej:m4:hq:LN:fp:Au:iw:rI:g3:z1:QH:tE:Ss:nI:ZZ:I2:er:Xj:iI:ZB:AD:nS:3X:FA:7z:GB:Wr:Tx:Qk:fC:bj:dG:p4:kc:Ze:vY:Hm:P7:5U:QM:ZK:eD:lz:ii:1V:wo:V5:iL:P9:kA:MF:cg:8P:vO:E7:1A:Qu:Yo:e8:Nf:5L:B8:qa:O9:Wv:KW:KI:2v:wH:HT:dU:F0:cD:B7:Xo:aB:QN:K0:rV:q8:IW:Fn:6v:jI:Gc:id:3u:Kr:tR:sW:Rh:4C:Vj:Ra:z5:aC:4j:FU:mB:qg:CF:rg:Cn:ws:gk:6G:y9:9I:9y:KI:Gj:cS:ob:ie:V6:U1:Gb:8D:fl:Nn:si:uS:8D:SB:6y:nd:hA:ss:Bp:U7:bi:AT:RJ:FM:q4:AG:Vr:UQ:JW:D2:ir:LO:z0:Yl:A0:YU:Xc:5K:fg:uk:yh:Le:5u:of:AD:V9:kX:KI:hh:jg:gU:xt:sD:05:cY:gk:Np:5w:0i:Bk:xd:Yf:LL:OM:IQ:xP:LL:Lk:hi:1a:Bp:AO:Hp:6f:sk:MH:Uq:YV:7m:oH:ln:ny:WA:44:7A:dU:Qj:9D:Eo:Qw:9k:8N:rC:OG:RN:0W:Gq:BZ:cO:eT:32:41:cj:ls:R8:sF:pj:hH:hR:5p:8b:xx:CE:mM:A0:n9:EC:wB:A0:9F:MN:uW:pN:2n:rn:p6:ei:Cq:tq:Bs:kC:ci:rE:pY:ND:0u:0Y:G4:C9:X4:e6:ni:UJ:u1:cQ:4E:eE:mA:26:YI:k5:4c:3y:GC:pu:3n:BR:62:Iu:8Z:wi:uw:JC:32:uP:tC:sY:JK:L0:qQ:qn:62:cz:zA:GK:KS:VC:i3:YP:Fn:mi:m8:cd:1w:rU:NK:rs:oq:RU:Hx:Io:jD:5m:cT:IP:V7:RS:qO:F2:NX:4o:pC:rh:BL:xd:mL:Wx:r8:f6:Gw:wi:i8:iL:ap:Bs:oY:Iy:J5:XZ:nK:tr:fd:FP:ov:M4:VA:c9:qH:j2:Ub:sF:Hr:yK:rw:pK:VL:BC:h3:1Y:mA:h4:Vc:SC:MI:Ti:4M:xW:i6:WI:1f:EF:PZ:1R:G9:7v:gv:gS:FV:El:U3:CT:A7:kr:xD:Ml:74:qK:mH:9r:Xn:TB:KS:Fp:Je:xY:Yc:12:0v:nG:tW:V4:xA:FA:gO:MH:5v:cl:xR:Rn:i6:Ev:u0:4v:e1:ZH:xD:Gv:KK:xO:9O:c0:dj:jo:ig:D2:QR:ns:Je:ME:nP:1t:Pu:Yb:A3:ic:2z:oI:A6:qW:Yi:Z3:F4:CN:AW:53:fL:9z:Pb:iv:Cu:db:TI:An:fW:GL:lf:FW:cv:79:gY:Xc:Dn:4Z:os:r7:nY:Sv:sK:4L:Ew:UA:sv:HQ:Ez:tL:p1:wF:WA:zb:Sp:yD:k2:lC:hD:QY:ee:nw:1g:HW:J3:zm:np:Wx:2V:JN:ac:C5:X8:nS:ZB:SP:BD:Ig:0K:m1:yR:6E:rb:kJ:JE:Jl:wd:4A:jx:I0:3Q:nk:dw:CZ:fh:Hg:fT:hT:a0:rd:sq:Ck:m8:O7:cx:ly:tR:4K:IC:S4:Zk:Pp:69:Y1:Wp:WG:C8:Gu:PS:G0:bw:z7:Ew:SF:CM:68:BZ:m3:TN:8b:q6:ve:MH:uX:3L:NX:GD:VM:lo:pi:dO:kM:Ft:uG:4A:1u:Xa:X4:Jv:ZS:GZ:tB:vd:PJ:we:JR:nl:eV:tA:e0:U0:N8:ZS:Yx:r5:xy:cG:62:QN:sB:2f:pV:qs:E0:aB:fs:yI:oM:fb:TW:Pl:uL:lX:DL:Di:vm:fu:yy:iU:qu:OF:TN:sA:YM:9x:2W:tH:Y0:Nt:uo:ES:Uc:oP:VU:zQ:2s:bY:1I:YI:nC:LY:5K:sI:ol:wF:zR:0i:0P:bK:4N:sv:jl:Y4:OW:hy:r4:Zv:Dc:72:2A:39:Op:WK:Jp:ft:zN:ML:wc:WZ:cC:3P:A7:8i:VC:OW:II:3K:O5:MG:er:No:FB:Xt:Mj:0K:ns:7f:Nt:MF:VG:Kw:58:op:IL:UA:Wh:ub:BI:yR:gm:BD:uj:cz:dI:VZ:rI:jc:vo:K9:Jn:Bx:fy:jy:3k:nN:O4:qR:FY:MO:My:FO:Op:cU:sr:vO:Kd:FE:h9:ab:1d:fF:eT:fh:4a:hm:hB:6k:1r:W1:6L:c1:94:3T:rr:BW:8V:9z:VF:OG:xy:QT:nc:K4:Gj:4T:Q1:XL:dt:uY:9I:8y:ZH:xs:ec:Cp:AT:yz:CK:JP:Yn:jY:gI:HR:eD:4D:nz:UH:4y:Km:0g:BX:IP:2N:ee:tz:5U:Je:zN:Pe:XJ:iP:8d:vx:mb:HD:pp:wM:9U:nz:YY:qh:nR:a5:Uq:Xx:b1:Qe:Px:PP:pT:cc:Gv:LK:yg:ZR:KA:X9:qx:78:Iv:n6:de:Ss:ig:pd:cW:g0:d7:Cd:i2:oZ:XE:Bs:Xt:VC:T9:bw:Qy:oV:j8:CQ:Jy:p6:t3:5O:dX:Ku:gN:qE:QR:Rs:Ph:0w:Fa:jI:qS:Os:5J:CC:nC:BE:K9:Pm:7Y:TF:Ql:DG:Fk:aH:2g:05:0r:ib:3m:DP:eO:nB:vi:dY:TM:WY:Lx:fQ:yK:k0:tQ:2A:TR:fr:2Q:HE:Mq:sR:Ox:k0:dq:yz:CA:P6:zN:ks:H6:NO:Fb:g3:Ch:St:cW:fJ:cn:cg:OY:DZ:if:Vc:Fx:m3:YH:p8:5N:pv:xd:mO:z9:Ku:xf:7G:cy:6x:zg:bj:GV:Vk:Ev:A1:Wk:Gc:1g:av:4Q:GV:eS:G8:1q:wM:MF:me:dk:dO:h3:Z9:C9:Cz:oM:m6:BK:h7:xP:6p:pb:6o:fz:2A:LB:FO:qm:wb:7b:Pb:pA:4S:ow:rC:ee:NQ:g7:fV:1L:qW:cc:am:xn:eN:KU:Jg:32:vB:Ob:Mt:CF:55:2P:7y:K4:US:eV:zD:XR:uR:em:oO:fn:SW:Ex:SW:XT:V5:xI:LW:MT:g2:GC:26:PE:dj:J4:4t:oZ:Gz:LS:tZ:6B:jT:o2:gr:cy:2w:Mc:kn:nS:hd:Yq:8r:Wi:Lq:13:EO:Sg:t3:0W:JQ:ZI:Ou:Un:Ad:bB:xX:w3:jl:2u:hV:Tl:9v:Ir:ru:WJ:uA:Sd:ho:XP:h6:ZD:R9:Yw:5u:7C:SP:df:If:bT:rw:1y:lG:Qk:Q3:y3:Q2:uC:uf:ev:Rt:Q6:Y0:HE:yM:Hp:K4:Vs:Ai:oX:Wr:gc:lZ:ax:nr:HE:Ij:od:MT:QN:Th:29:JM:Lv:Qj:Mn:VO:4t:SW:r6:jF:qS:09:ge:3t:gb:AK:jx:g1:jF:uw:Cq:KL:zb:SX:Cp:Aw:Mm:VB:Tp:G3:ue:2H:Y9:Tz:hk:NH:ro:wJ:Jh:5E:kA:Wq:if:DD:ET:X9:7j:wD:uD:4J:6l:TJ:MW:cd:EC:Gv:Cu:Cj:3z:Kv:sT:ts:RJ:Ql:EE:2U:B0:V1:X2:dl:o1:mC:SO:Qf:Po:5k:As:uA:ie:pL:ou:NX:BB:kc:cg:kz:RU:J0:Oc:XX:uk:wm:df:Pw:lT:44:1B:LY:By:Uc:Ra:0Z:5U:46:uV:JL:MH:vL:Kj:18:ex:3A:Qu:n8:Kz:7L:LF:FJ:aZ:3d:rc:AX:nG:PF:k4:2U:ys:Pf:5Q:cG:aT:1t:uu:7r:6G:YK:b4:et:xO:4k:uW:V8:VO:Um:Mg:Np:2T:dP:Kg:nt:TZ:l4:Vg:mA:Uv:hB:4p:8s:H7:Fy:N7:TN:Pk:F6:vb:JP:oP:j6:HV:4H:bg:ET:t6:mk:sa:A5:aJ:ee:TY:zW:dJ:ck:21:J2:oT:rk:0v:BM:bW:cK:9j:eC:cs:sq:pe:nl:cD:ow:fS:sj:0i:d5:u3:KG:l6:s9:EK:JL:EK:X2:B7:yV:Tt:NZ:s9:BS:HY:ZC:bT:0R:Js:Fq:Fm:zV:ia:Cc:pD:O1:wo:qA:Gh:fA:PI:Yi:dz:5X:ir:SD:Cd:iI:sf:S9:M1:LL:US:tS:sX:SK:XB:Kr:7p:bP:zQ:x7:xc:58:cm:c5:Oa:ec:Fu:Yd:4u:7q:G4:UP:IA:V8:iP:OP:A3:is:aU:KZ:Ek:MM:9X:br:Zd:le:Tv:QH:Gb:e3:zB:zz:Zr:Rz:Ft:6e:l1:rZ:gC:ks:ST:4C:cu:Z9:Cf:LU:0Z:9P:QE:IO:HP:k3:N3:GS:8Z:7b:em:Qh:jJ:NJ:dP:l4:Jw:7E:FZ:2D:fa:YR:Xx:7I:V7:Xc:Jk:8Z:o5:zx:iw:qX:vd:F4:d9:nt:vE:jj:rM:B8:lA:Sj:BN:90:Sn:61:Dq:Jv:MQ:Zx:xP:wI:4b:6G:cN:rN:6e:ys:B9:sd:ml:3D:tk:UI:OF:br:P1:ka:au:I7:Lb:dm:uN:ZH:8C:tF:bj:cy:cv:cz:Mz:J0:pl:sH:08:il:MZ:o3:nV:au:7r:iP:BY:97:8Z:Oq:W5:u4:tw:B6:k1:7B:LM:8c:dY:og:hJ:L4:SF:bE:v8:U9:pH:Jq:p4:Hz:kf:GB:iv:kb:Ng:zq:CT:tj:is:zM:sn:Nx:CX:6z:dM:4j:L1:2m:N6:Ko:eY:3j:55:tO:ik:Vz:FP:jU:tG:PY:v0:rA:Lx:6z:tN:yW:XL:I9:Jb:tX:Uy:fG:VC:Oo:pR:OT:lb:nM:6y:eD:ZF:4A:Gt:Bi:01:IT:Bu:tw:Dj:nl:Cs:dw:pY:vI:TJ:Rn:W2:7n:XE:iD:Oz:3E:vg:Ki:1o:Cq:ZA:jp:jB:MY:gr:cx:T6:R5:6m:si:ao:eg:Lx:KW:aB:Dy:Am:ch:ro:Xa:me:nx:XT:TY:EJ:Xd:Wn:YE:06:ZK:p8:sm:gx:9Z:4m:wz:BA:jV:AI:4B:6W:IS:IK:Ti:g3:dS:ek:ni:Q4:Uk:Im:Yk:8U:mI:bx:Zi:ZL:Jj:fb:O4:Q5:Z5:ak:zk:uG:6n:pD:on:I8:30:pS:Tg:eu:4B:5X:wZ:zQ:Iq:5V:zf:l7:rM:ts:xB:qQ:WG:K3:7p:9S:Zw:yW:qI:H9:qe:u2:9W:tu:ZI:eI:oO:8p:35:Ub:aC:ZX:hd:ta:uk:oU:lz:FH:FO:Su:9E:PJ:Qb:1W:SK:ff:uA:zn:pG:Ix:hy:XU:mf:Pd:U6:qe:3e:fh:vt:1S:M1:AQ:e6:CX:QQ:5R:nw:1r:H1:Sl:3P:A2:Yk:Jb:kV:uH:hK:5G:DD:Zn:yC:pF:Ui:JL:Ee:yW:tJ:Br:wu:nD:hl:nj:r0:kK:9D:3X:4X:fG:v0:xk:zr:0L:r3:P2:i8:l5:zO:VB:mJ:ts:ay:Ok:Cn:H8:Lo:ZO:92:cB:yC:7s:Xz:KZ:3t:h1:R4:Kj:1p:4u:Ul:sd:Cy:5h:wR:Rq:BJ:3w:7s:De:Sn:V2:Tu:gY:Xu:AI:ml:TH:lV:wn:WX:N7:Sj:ys:UV:q3:SX:PB:ha:Ee:sv:FJ:BK:5v:zI:LV:XO:7T:cF:ss:4g:V8:BT:dd:UO:e7:zv:RL:lO:eb:DC:U5:j5:f6:qF:v7:fr:SE:rS:oa:xx:ea:dg:YP:2y:Zd:xP:su:hh:o2:Hx:3I:0Q:XP:gS:j3:1Y:FE:eM:Wz:eL:NC:1Q:jL:25:yp:jt:zA:0j:eX:ps:3Z:vl:NE:yP:XT:WE:1J:uU:S0:zH:Ka:cJ:Om:IE:2W:wa:MD:k1:KE:mc:E5:f1:EI:KL:3A:oQ:hE:K3:Fu:Fh:sh:0X:5x:fS:MM:OD:xp:CQ:Lq:F3:9s:Yy:SI:av:ME:0c:1x:xe:k7:ZM:Rv:aU:Zd:33:vC:Or:o0:55:F1:xE:4K:Lf:jk:bH:aa:Na:aV:Tu:X7:xP:Bf:rn:YX:g7:4n:DQ:Js:wJ:kt:VI:wV:qb:2X:17:Hf:ax:jh:EY:b4:jY:UZ:Zo:3b:Zt:Ur:Bs:aY:SN:MN:Wl:QO:Ej:5F:a5:tI:dn:7C:Fo:he:zJ:md:Dw:TJ:qE:4X:Ds:HK:Zc:QM:J6:Xm:28:1I:E7:Hq:Qj:iQ:fM:VO:D9:CG:Oa:l3:iY:xI:dW:F7:Xe:dI:1P:V0:WI:Tf:g2:IM:UQ:z4:lb:V2:bj:qH:Ke:y0:9L:RQ:HD:JP:ja:a7:4M:du:DS:Vc:Xz:bg:OQ:SF:vw:fR:gN:ds:BL:nY:QD:5P:Th:4l:YW:gO:zp:jb:Ca:gK:fo:XB:MI:Ak:al:am:up:qq:jv:3s:qO:eT:3W:9w:q8:CI:hv:Qp:Wi:b9:BC:7m:Pq:vX:Te:Oe:x5:Ga:QU:Us:MR:z4:4N:fC:3r:La:3w:5h:4v:Yl:rL:z9:Og:9c:zW:oE:bT:8a:bm:9t:Ho:Y2:gD:TK:i1:gR:r8:Li:Yb:aD:YX:7w:W5:Tk:7c:PB:Rr:vb:3m:ys:ZX:fx:6B:F5:kg:Q3:sP:2r:nS:qN:0y:P5:Wj:KV:3Y:rB:Qb:wT:Ew:4z:SS:bb:U6:uH:Xv:El:f3:N6:3n:hc:og:3S:wa:SS:qw:1q:aY:bM:y9:TV:yV:mS:1J:5X:70:ZS:2T:vS:dN:gz:jJ:Ig:pn:0j:n5:sh:3l:cj:mF:Q4:Wx:Mr:MI:HZ:M7:nZ:XS:1K:Wh:SK:zF:O8:0M:OJ:nr:P6:P1:QC:m1:CE:6H:YS:7I:Uo:X7:hn:ex:Q8:Lq:BP:5r:Q9:1H:i7:QQ:oO:6e:f7:Lo:BK:wL:v9:F3:kS:EP:mL:PT:aY:7J:RE:mH:Ch:iW:LU:nR:77:4m:Ge:EF:fK:uC:zo:2I:CE:wX:xd:GJ:b5:sN:eE:0J:Jf:mJ:Yh:tv:20:vF:YS:Yd:uH:fV:Gc:gJ:GV:n9:3Q:Or:Ps:FF:Bx:id:My:VQ:uf:Ns:OZ:pN:fn:CB:1V:Ki:BC:Uq:yV:qW:cV:ss:fx:h3:T5:65:Gh:On:Ne:lK:cR:57:RB:wt:Bp:b0:nL:H8:Vm:IT:ta:07:tO:bS:Sz:2I:DN:ac:uj:hS:xz:GJ:8B:Zh:9K:0R:yp:fM:cM:ge:3D:xv:Rb:RK:rt:Wu:qp:Lx:7d:6E:9s:p8:pC:Jd:07:xI:JN:OR:X1:Qd:br:Ur:8v:Lu:iz:1t:MK:hV:Hz:Y7:mu:kK:Oa:je:tq:um:PS:dw:jo:ti:QY:Wf:gh:f6:5e:34:To:dF:W4:3Y:eK:xq:4T:Wa:CI:Of:uh:v9:IM:nL:mH:dF:xs:7Y:It:7H:hX:aK:xu:PL:jV:Mc:sd:Fc:Cq:QD:7z:l9:CM:XK:Wd:cR:Jz:lA:wI:fm:Gy:J0:BU:CA:Xd:KO:c0:dr:cc:9C:oq:xV:2t:yZ:KP:6k:mg:yV:2I:06:UW:lG:Va:gV:Jn:Ed:Zf:4o:0I:51:Yj:CN:qa:3O:vG:fe:8u:rZ:na:sq:zO:Lj:3f:pr:mk:26:n7:kS:1f:sd:Dx:HH:jc:LG:pU:Di:6j:i2:nn:q0:W2:Bi:ac:jL:Zi:N5:CE:Ms:c1:V8:gv:c7:m5:yn:GR:Gj:ND:xO:d9:HI:DV:9M:vu:sV:jh:Sq:V2:iC:Fo:F7:Lk:Wh:ee:IH:jR:dV:h2:gG:BR:rS:bi:tq:Xc:ev:Xq:Vb:lo:S8:UB:rM:cG:ud:6t:9g:Ie:No:dE:HW:lT:sG:ns:mL:sI:Uo:hH:mx:Fa:sk:KX:Dn:Rs:Fm:iv:Gm:Hp:Ro:10:nu:2t:1f:iF:eu:Es:BL:sG:jQ:vc:40:GE:Zw:35:K0:jY:K7:1F:Sc:Hz:kD:3B:Uu:q0:JT:r1:s8:QN:Ox:hp:XL:1i:4n:sU:D2:g3:Vk:cw:Qc:1t:yz:Wh:da:Oi:34:mi:87:Td:hE:SB:6t:0c:nz:NI:sA:5m:Aw:Jk:pt:JF:J1:PQ:e7:Zg:La:DG:m5:NE:vK:KB:du:Sl:LJ:Dp:c5:bq:tk:eC:Ki:D0:4J:Cg:Mw:LC:t6:CQ:IU:Ks:t2:JM:f1:3E:Ej:I2:LE:06:4w:J0:FS:vO:IG:cg:7a:vl:59:Uh:Er:pC:N0:nH:QT:Kx:Vk:zN:Tm:f6:vM:uA:Ml:I4:NG:Oe:av:Gf:I5:cV:uq:HX:bq:bx:cX:aY:Kw:V9:xw:Cm:Gw:or:S3:Gg:I4:Dr:TC:AB:e6:tl:Wm:gI:5n:Ap:CA:8i:dM:GV:JH:kx:sr:37:m8:8O:LG:fo:oG:Ex:yb:gD:IF:2c:ql:DY:5M:3m:Px:HV:h8:sr:1u:Bp:LV:rj:Pg:Qt:dI:Hh:Vm:q3:Xq:GZ:aR:yZ:NN:Fm:5l:RY:5a:GM:jB:40:Wm:pH:2J:bI:pr:sd:8l:kJ:Qd:hp:tL:Si:tF:94:1Z:t9:dL:Yu:B7:L1:FA:Yg:ko:St:Ue:F2:8e:vE:iL:6g:88:JD:0s:dC:bI:FU:qs:4K:5J:VI:0k:PE:Wh:vd:9j:PN:tp:4M:y4:CP:Jt:zJ:Pi:5S:nF:Jl:uQ:01:yY:A1:Mf:so:hx:2H:H5:gn:zx:ys:tq:86:NY:HV:qR:Rl:bi:qh:hW:rv:Ql:mf:G2:kt:LS:HT:gX:jj:Hf:WT:c1:zG:Ir:Lp:QH:I4:iF:Uq:4g:HS:cU:eC:fq:u0:uc:te:w7:mM:d3:qF:6s:c0:de:GT:fu:Xj:wV:WN:UY:Sv:Rp:gM:th:eQ:3D:mP:UK:nt:iB:x3:iL:h9:k9:gS:hp:m2:xC:m6:CR:be:7V:AD:Cd:2s:q6:IU:2z:lN:GO:dB:iv:tf:fB:7V:p4:o9:RU:Oh:P6:s7:Uh:1m:3j:qQ:NS:tH:1J:VG:QP:T8:OQ:sj:fP:xb:sU:Ju:2m:hC:Yd:Ky:3v:vR:Dm:jz:sB:NA:OV:UM:a1:v0:fV:MT:Oa:Zd:u0:sG:vx:GP:Sm:xz:3m:zJ:dr:b6:3q:lK:Cx:CH:5L:3H:DP:qT:Kg:EG:uy:dy:np:yw:Rw:im:6j:qo:s8:z2:2C:7d:b1:ho:dD:13:OK:DH:Oz:LU:cd:yQ:Jj:Og:1L:gS:W3:2d:5J:X7:Y3:H8:MR:x6:Ej:ZA:X3:60:z3:Nw:2i:gd:wI:rf:KV:IV:Pl:rx:5h:rw:Oz:hu:Qr:sQ:PS:Mx:Er:CU:cz:L2:Hw:Ax:48:AD:M0:fO:XH:5J:FR:wN:l5:qD:9B:yN:7G:Go:fp:WI:eJ:hX:9o:rk:sN:Xg:wU:eC:Yh:rd:xi:Bg:PP:8n:XY:fy:lJ:ko:dS:T0:mZ:b5:5h:xv:h8:J4:wE:nB:Dy:rA:Cn:Y1:df:F7:zT:LA:EG:fW:lz:mE:0m:XG:aD:jw:yg:4R:lO:uZ:de:qM:Nw:DE:bx:NO:dt:da:e5:t5:QA:C8:KR:YW:pB:DQ:d2:1f:y6:w0:Rf:UV:Na:hM:xY:G4:sV:fx:BO:b7:gg:kW:RG:Xw:ZX:rS:VG:s4:x0:jT:Dt:iE:Lj:8O:cu:cU:sx:IL:0c:sb:7l:fh:05:BU:By:Zg:Fc:ik:wr:0D:1L:kI:lJ:1E:I1:y2:Vm:Tf:Lw:Fp:4u:QN:6X:vN:Xj:JY:Fz:yh:SB:nL:Aa:3K:fP:3h:mi:ez:hN:zA:23:oM:Sr:xy:f4:tm:hf:M4:iu:5S:rQ:Nl:z9:nZ:54:ol:KZ:Sc:xk:j7:Zj:59:mE:aq:Sy:S5:Ij:h4:AQ:rJ:MW:2O:7P:lJ:4n:kG:u1:Zb:YV:B1:QT:4y:f5:kc:TZ:g1:XM:KZ:AV:IQ:z9:Wz:mi:Nu:FM:wP:GQ:JN:oL:XS:8y:e1:ed:iv:eB:2L:1R:Hh:M9:XE:bS:83:ir:3i:OP:xw:53:5w:Fn:Sa:va:sY:yw:0r:EJ:ea:0q:0K:wY:h3:Uc:B0:3L:Q8:kv:JM:uG:ZM:k3:zA:Gp:c4:IB:fY:Js:xA:8l:xL:GF:D1:df:6n:sD:21:DQ:0q:q9:Jr:OK:28:JQ:ZD:C8:wo:jR:em:xk:i1:LF:ba:Hv:PW:R0:Kb:Jn:gC:eN:so:VK:OX:sd:iq:sm:Nz:6o:Jc:tS:j4:ia:UK:YI:cK:xy:Ln:hH:xK:v7:eD:mX:p6:UR:uq:62:vt:om:xo:hf:Tj:eY:0e:uZ:Br:uC:o0:LI:mX:sV:OH:RL:Zv:lg:DL:rD:vQ:Da:yh:ZX:s7:oq: | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�
Wx��:W�c�4h��2��C�c�����[���Fs�0�%�ɲX��/ ��}��5�n˙�"�r\}�ZJdT�s�A��vB7[�$(Hk�\�T�?�RZEv��$�R{��G��������U���܃�9��6ʕ�g٩�po�~�����[���h�K�W:��F������_�z�R?��%�˓]�� 0j���Ko��5�r*���RM�[N�0�ٸ7I]
�۾�Rj$͂�%�@+GG{ Y�~Bn��K)�0rNA����ձŕS�)�24�q�9�w�30�p�,l�PU��ʩvt�m�������?ۛ�!���9l��*/!�,Vъ✯��=�_R"�2�wQ�@�DBA���0����r.t�\��|;*+�wy`hjT1LM� I��]�7&�{�I��sNXE�2�u�5鰒�gx�g�ާRz�/6�A��N��+�c�L\��9���<į5Oy4�
[��e���^Nb�����e����5��}�2Ϥ�s�Y>�zM(��G*���3����Y[����S��vF�!���s�����32�[9O��� �&Wc�3��)�w!6);���8��6�bqB��6y17���yUJ�!�TKD��B""6Ð ��'ډ�]'���/���)*3(�f,���~�����@o��Ct� d� o�l7�m��]�<��ٌޱ~���1x#/u�[OU3Y�J�r��(��2 I�hs��̥�
b=iI�;�Eq=M3B!�w�S�h���O��pD'}k�⃕bT>�Ps�Q���Z��K�<��҅��6N��J��Uy����9iUkb����@�Y�>-�i`|�eG$�YX3�q����v�y�l�i	��c�dv��Z��+��e3��r�}]n�Z�Ѓ�{�Wb �\��JL<D�=�<R�F��/\*�Q�&�l��sY�� �GnAeB.�l|�	��v�R�ƻI8ц��-����H��/&�w/��>���ǎ0ڡ�
Nc�����t����K@��x����IG{��s���"f�v�i;�c>����̥6e�� �}G-ƙ���3_�W'*�����'��y=X
*}�v�'s�层{��(��]Q���Q:L.4P�29����[`:�<� ;?JoC�(Y�zF��v��*,����D�UI]�-�8
�Uzê�J\���� 8���n��w�z�T�F��:H�ژ�kG���E9��a@�e��Ƌ�t~Gʜ�d�μ�88��ƴx�O�|���yQ/������e@+�9t|�g"fp�Ζ&jc�,ص�l���<t�X��e])�DeS��w�<��*鼍'���MX��BF>JT�gN#pk����k����z�R�ޛ2	��(���eۑb���4R�s�|��H���/P���ڼ��}��&M�g���߽���SCQ 6c��k&?�Spu���,�X_���֍#�k�A���������1�}oV�� �u