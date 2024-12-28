#!/bin/bash
#
# This file encrypted at Sat Dec 28 18:59:34 WIB 2024 by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | 2j:UJ:yu:LH:cS:7l:2P:y9:nS:Tz:bj:lQ:5L:Wf:1O:L9:ZU:tZ:Pw:0m:wc:ca:Qp:pK:Zg:2a:qW:SQ:9o:DP:Vw:8d:R6:Xd:VS:Ko:bX:K3:cO:af:bD:NW:1H:Y6:gQ:wA:zj:ci:Bk:ko:lw:TD:Ch:nh:D3:vR:8c:rs:NC:3S:2p:3K:mp:CT:M5:ed:h1:s5:Yw:M8:LS:Fs:Zq:LY:rS:xL:bN:YZ:3i:AL:Ip:zj:gG:ia:R8:c5:G5:f6:ey:59:Mq:od:uo:ta:PN:vr:u6:NG:MS:Vj:aV:Ws:EG:DL:9I:UT:wj:h2:S6:DI:6t:o4:jC:j8:bM:lR:EM:Yi:wF:ZR:ab:bh:dN:6P:sl:Hg:cc:Ds:Uq:EM:Ju:FT:Ps:sf:BD:EO:C6:LE:K6:sV:MY:ML:W6:P8:AG:NX:Ju:Xm:7v:iD:91:7z:aw:90:d4:8z:8C:uI:pU:xS:Gt:fm:QK:PF:aJ:zH:ve:Zt:hl:jz:CH:2C:1Y:K9:DM:Rk:7L:h8:qY:vQ:HC:fH:wx:AW:wN:4l:et:Qx:DU:RC:sg:Xa:5o:Hk:iH:0I:C7:Od:FL:iy:oJ:ml:OA:nX:qL:wT:0E:L7:yG:xj:wt:Ly:Wg:e2:5q:Pa:w6:Xy:aV:4c:sb:ea:bO:8Q:aZ:qZ:NA:C8:ip:vp:bC:Cy:aJ:Ee:oh:om:qO:d7:f5:Me:ka:Xv:3v:vV:P5:6h:M9:sr:7k:W4:jI:GT:MR:1G:ZE:ox:JG:dF:Op:BC:mW:3y:1t:Bn:Zb:aL:4e:aH:Ds:g6:wu:g9:Xg:cD:Wi:Ay:YZ:fl:3r:6n:Wa:kw:7t:eU:rb:V3:bs:Uv:WY:Gm:we:Ij:bX:C6:qq:re:z7:cv:wR:8I:hL:57:ee:Wb:Tt:77:0X:Yf:wt:nx:rL:lf:UI:bc:M4:He:8L:bu:4Q:AU:iO:6i:xT:oY:e2:ox:iW:B0:57:b0:2D:6B:2X:zP:qT:9f:wk:Yd:Is:uG:0Q:w6:7x:ez:DA:8B:zl:NZ:lz:1i:Zi:zu:GB:Xv:2I:Ld:rc:cf:K5:Ri:8R:al:GA:UK:iY:i2:in:Js:xe:uh:r0:Od:nJ:kC:WD:Ah:Dw:t1:rs:ie:1T:GN:RC:Bv:rJ:Pj:hc:UN:BT:XZ:uS:s2:zR:6t:Xn:zy:Sx:os:Qp:f9:4B:gU:qa:gI:69:un:iY:j3:H0:J1:uq:Ma:iu:C7:M6:hu:Sk:z9:1W:eu:Bk:So:zr:v0:d9:lV:xT:N6:0s:6C:81:C3:Y4:Ws:MV:Wv:pC:PF:1M:NX:B0:F9:FL:qI:wi:ix:9s:Xw:hH:tG:dq:jv:B1:on:Jo:o9:fw:Gy:4i:1F:3f:xg:ed:xn:vU:pb:rL:jy:Jc:ZT:ON:nk:Js:JH:ni:nY:9K:OY:yX:1Z:Fo:3P:Tf:3x:sz:sF:Az:bK:IL:5c:nB:q3:ou:7B:Q6:v1:ki:4z:30:ZG:2l:7i:y4:Sp:I1:7z:RH:N6:X4:8J:iO:yn:8I:Y4:Ej:do:v6:Rz:2w:Rs:fE:1j:ji:OO:qI:Lm:Mo:hN:aQ:VP:fq:ma:aU:lx:qC:Yn:on:Qd:ci:37:mH:0X:GE:Iw:E1:fj:FP:D4:4b:en:NA:f2:I1:Q0:BS:YT:eP:Z0:I4:j1:wE:Er:AK:mP:2j:c8:IS:o4:od:Nm:J1:b1:dS:eg:5z:Jh:lk:gX:J1:9A:qI:l8:Yj:Ug:Ns:SS:5t:T1:7Y:9j:pL:eq:y1:sf:WL:JY:jX:Wc:VD:dC:2N:tl:SA:rS:Nz:Fy:Yr:2H:Lu:pW:vc:Wt:ch:Y8:Io:IX:6j:YE:VE:mf:31:nr:eZ:h4:QD:wh:i1:CW:7G:IM:XC:5I:CS:sQ:8V:fJ:Y0:u5:xD:9C:c8:Wc:kw:33:08:L1:hv:kt:fS:kw:hi:8H:Q3:7K:Q5:kr:aS:Yh:xn:aN:ZV:Vu:VD:Uj:Hv:DE:BT:tv:0K:ys:Zj:Ju:x1:o7:ez:3f:5g:sp:AO:Ni:6x:7Y:mO:OH:AU:9I:Ws:MA:gC:nY:nw:oJ:1j:bT:M3:or:IM:VG:0z:xD:lm:yW:mp:ne:pR:OZ:4L:CQ:Rv:eE:Xl:EI:uJ:I6:si:dj:vb:3N:r8:oF:za:IN:11:5O:ib:Jk:4b:5m:CH:oz:Gw:sa:sw:f9:1T:2n:Qc:L4:R1:KD:Fy:Ot:1H:Uz:ja:hn:Qp:XF:7p:yP:Q6:a0:qD:gn:65:PG:rZ:HN:ix:2n:Ln:nW:IT:KP:UT:nZ:kU:ed:I2:uO:o7:Ue:8L:wR:bC:CM:ZK:dh:2P:EL:19:hb:Wy:Qq:Hu:YI:pV:Rv:zh:By:XJ:d2:GI:GK:lQ:Vr:uK:eU:Kw:vF:Vm:zj:cZ:9f:9W:gg:mk:zP:dk:JK:2v:Ly:yO:RY:Q5:AR:Dv:kF:7l:Pe:Vr:Uh:Bv:VP:Tq:qq:ND:SI:HJ:FH:as:10:Bz:5I:Qe:hQ:ld:UP:gf:uH:H1:5n:Cc:Fb:0X:lQ:Dk:eG:rP:ey:Gq:Ya:93:Qt:Zr:Oa:iF:D4:Do:nW:f5:4a:BR:Wg:jW:Fp:n6:eI:RB:g7:vS:rB:xT:Bt:Lx:OP:ro:6d:yt:nD:tS:GP:CN:GX:6M:Dq:qO:cY:yU:VQ:4U:Vr:Wm:ZG:8T:TX:dX:oH:8h:0o:df:tw:5x:62:m8:mS:2L:ZT:S3:r3:Ge:Ru:te:72:ST:ii:k5:Fd:pK:W3:aX:CJ:9I:dX:7o:DT:hx:6g:ht:ky:E6:b6:Mh:vH:7V:Ba:nE:jb:S9:il:AR:sf:Y5:g4:EX:uf:Fo:RG:An:lm:5X:NG:oN:yn:RJ:KD:x6:xk:ZL:9J:aC:4K:Iw:Y8:QY:fN:RL:1j:r5:dj:XO:9d:Pv:WD:5K:au:XX:Yz:Pz:tN:aL:gl:iN:Jm:am:8F:sE:Gk:eJ:3V:kv:aQ:n1:mA:n5:fb:hz:ev:Nd:cs:jR:Hx:Jb:Ky:iQ:lV:nh:9P:oB:fb:fy:ED:RZ:vm:w3:jS:Ne:8T:km:IK:4Q:b9:cW:FW:tk:FD:tm:xW:XD:QR:Kf:AY:o7:0M:Dw:0u:oU:tm:PH:jP:U8:wY:ff:wu:AX:po:pl:Uy:Be:zR:mf:fv:0V:td:VI:Y5:F2:ZK:Cp:FB:Xj:TO:5b:r7:v6:qa:uH:60:Pa:9M:8X:Uq:k9:YS:Rb:z0:9l:nM:lY:mb:Hi:PQ:5X:Qo:qy:Hh:AL:JD:vk:EY:tU:2R:U8:tz:Vt:3H:hb:Ix:bm:7r:6s:Hk:aY:r8:QB:DH:5Z:BH:FQ:k9:3u:vX:1V:rY:Rw:Gu:WK:ZW:zJ:Ce:Pk:VY:Qu:ye:5U:SQ:qD:Pr:rs:vR:xx:Fy:at:R5:0i:9f:o8:Yv:4p:Ff:JV:cF:Pq:6S:Jn:Wb:Bh:bt:Co:aa:DN:SN:zi:KH:Tt:3Q:YK:8Z:fg:eX:WK:KD:1k:rl:MF:Ti:t5:9L:f4:DH:EN:Lm:dt:BA:8D:Jv:gY:2R:iy:Gq:bH:CF:3S:NG:Hb:16:HL:0W:fE:tB:1a:Sj:XS:UQ:tX:Hi:zW:3w:zP:FC:1S:Es:Z5:BY:Tr:Qs:fi:le:h4:FP:xO:wV:uc:f7:d1:nV:oM:pN:fK:Fl:77:8S:d9:D0:4C:2c:sd:lB:gi:W4:bD:4G:Md:YB:WI:UI:lD:64:qh:8p:G0:Gb:ec:EH:V3:FI:1D:QW:ND:py:ks:tb:rK:QF:yC:Bz:K8:FZ:JJ:RU:0B:bE:Mp:W2:bj:42:Wf:ni:so:hy:rV:Gf:ej:JZ:Pi:F1:jP:ft:Rs:5v:gs:A9:jR:AB:pa:nk:Au:fg:pA:dY:Sm:eI:mr:0x:je:qF:om:Cs:fr:wt:K4:gg:PE:LO:Zj:A1:79:Qn:9t:1N:3H:8n:MX:47:qL:JP:Uq:AO:1P:r1:Rh:bo:qJ:Ie:Fi:lD:iq:K9:Nx:rp:w9:4h:MG:91:OQ:vj:C1:AJ:RR:e4:IC:cP:pz:QL:hR:8E:o7:dX:jK:Li:H4:Nb:qz:71:Q0:Rt:LN:uD:OL:gr:SW:Ff:al:hJ:f0:o2:ds:hd:rE:Uy:fX:IO:5H:8w:K6:qN:Ec:77:IK:wu:Qp:dM:D3:Mw:l8:0p:nY:XB:2D:M7:pD:1S:qT:VX:5n:xn:4V:X2:1V:Dv:nH:t3:Vr:SI:pi:xx:do:mz:pI:k7:xQ:Bw:vi:3u:od:Ts:V4:U4:q8:aD:pu:vf:na:vL:Dh:tS:VH:mf:Nw:A2:wY:l1:bx:NY:dj:oE:V1:8D:wz:i1:dY:qX:DM:aM:KA:BR:Xp:8I:6x:An:YK:Py:bY:Oa:7S:IW:s1:Lw:Sc:zy:H3:wx:gM:t3:va:k1:1J:V7:n8:Zm:bu:Ld:by:I3:YX:SG:QX:qX:a6:yM:W1:W7:Im:0n:x8:X6:XX:3q:fX:3N:Gs:5v:Eb:Le:JP:2W:pe:Kq:YP:ur:Gu:TZ:FC:cL:WM:VJ:Li:qN:GN:zO:n5:3k:ty:It:ag:RG:gN:fW:b3:9t:qu:EU:Nc:pZ:bV:kz:NR:J6:65:XL:da:8O:jV:uF:pX:Zs:lD:KS:IB:Gz:wh:01:9g:Xw:e8:s9:0v:2X:8q:UZ:Aj:Nr:xl:8h:SV:Uz:fK:f8:v9:rq:EQ:PP:8M:Lf:ye:0a:rS:Xp:rV:eA:hK:rb:JB:c9:ip:rK:T0:2L:ES:n3:Tf:1p:lh:QG:Yk:tm:cx:2q:gm:UB:ni:h6:AK:xN:1s:Jk:6M:Gk:Rv:hn:r9:eO:RE:PH:7d:mJ:da:ZZ:yN:e5:Pz:ph:gD:ZZ:vz:5Y:la:q5:Qs:DJ:rF:lr:bl:Zi:Ow:z8:7y:VL:db:kZ:p9:Mo:c7:nQ:cZ:W1:8t:bj:wx:T7:Y0:70:q8:N4:Ez:GQ:xH:Qj:wO:fC:pV:El:ki:kx:UB:eJ:DW:11:yW:Gv:6t:WL:7b:Zb:Ia:em:0q:ey:uJ:Qj:8A:oO:fK:zh:Lf:UJ:H3:Fv:A8:F0:lh:Tk:wo:xe:DT:IO:yu:UY:Ve:79:RQ:eF:Qw:Jl:lp:7H:6G:s6:2T:QO:zl:KA:ar:ND:Lb:oo:9S:ki:fC:Rv:Ee:sr:ih:ly:tq:mA:Xx:63:aQ:xy:wD:Da:OQ:p2:5J:vV:SM:bb:xv:69:1m:Ac:Ok:m9:rT:ZL:Em:tP:q2:UY:9t:bK:IZ:wm:QC:ke:HA:bg:8W:n7:or:Fe:pm:F2:kO:pE:F9:x5:mw:9T:s4:RF:xB:Og:nR:Hf:G4:Rd:3q:Wd:5U:mT:f3:8p:V0:v9:Ys:YM:gl:ZQ:nC:LY:jy:az:EG:G2:Z4:bY:5H:8N:0d:Tt:md:PH:ex:b1:0V:Uy:Wh:Pj:be:3v:A3:tG:8u:Wn:Dq:Cc:ig:76:Pi:Wl:NI:TE:9v:h9:hv:sI:dF:Z8:e6:bJ:uD:ds:IH:VP:BK:VV:Um:XO:pt:wl:Iy:VK:Bz:Of:Hy:KM:5h:AM:c2:U0:f2:l2:Z2:t1:nk:Bl:6x:f4:dz:k9:RN:2Y:gZ:H8:J4:iB:f9:5n:Ee:pf:1y:UG:Fg:pQ:Ey:BE:8u:Tk:cO:0A:SL:fM:IH:gZ:Eb:YA:Ql:bY:rR:0H:Hi:sq:sU:fx:jF:ar:Ws:wf:uk:MJ:C3:KJ:dI:2E:Xn:9O:S0:O0:KW:K9:AW:qa:a3:qc:m3:be:DV:Sr:ff:Fv:ZF:rs:7l:jN:PL:5h:zu:gq:Wi:mW:gt:yH:G3:WE:CH:tB:BR:K3:Bx:py:wz:cb:mj:12:Hp:io:sS:rU:xV:te:IX:iG:xQ:B9:Cl:Dr:5S:fe:0g:yA:2g:5g:Gg:pg:Dd:Xq:jN:pI:fb:EM:4F:U0:pL:hb:ug:CB:Z4:WA:Gg:y9:vP:yA:Ur:E7:0p:3e:06:Sy:5X:8Q:pV:q2:mn:77:p9:pb:E3:I3:uk:hN:Or:Jw:XO:LI:o9:iG:DX:p1:M2:ZF:OI:ro:J7:EC:MQ:hT:Ej:wy:9P:E7:iC:6X:HL:22:zq:Xb:cl:LN:LY:jz:dK:nD:Vp:GP:cT:bu:4k:ij:Z5:Oq:qw:jc:rn:t3:kv:Sq:Pn:GG:Fy:zf:6p:nN:6S:Oq:rY:sr:d1:AP:MW:YN:lC:lB:TX:iF:eg:Ex:Rw:hw:ai:rF:Bj:hY:4D:x7:aX:eu:yf:ut:pa:mN:Ub:tx:HP:Fs:PY:xP:kc:G4:tO:ZU:1d:K7:92:YD:cJ:5g:qd:z6:LM:Y6:VL:Jr:26:bh:cz:QP:fH:5P:Nd:4i:RZ:HM:bO:u8:wL:za:W2:VP:Kr:2i:IK:Gx:DX:FJ:FY:bx:v0:mU:jR:nR:39:ER:HM:uP:JN:aT:Ta:f1:sv:oj:39:jM:Sj:X6:hH:7o:pX:j1:Uq:Ik:hU:GU:rU:v1:Rg:jJ:sC:kF:KC:vo:fd:0x:Qg:oN:8P:OC:hA:7B:nl:BK:nK:Cx:0Z:RC:G4:r7:pT:F3:Qt:Ic:dt:gh:VB:8z:fp:uC:vu:hV:sN:Xn:Yz:bq:rB:1I:ZR:8K:VL:On:dE:JT:jh:oh:G3:V9:Yp:qw:F0:YY:Bt:uz:T3:3P:Rm:Dv:fk:BH:Mo:hk:BH:Gm:he:5k:O9:vW:be:FS:3D:8b:ft:V6:PT:86:xx:Pe:qm:7H:gd:VM:yV:QX:K8:dd:GJ:x2:ya:b8:sN:2u:sR:q3:Yh:nw:7o:OB:QJ:OB:pH:mt:rv:AV:dC:uo:Kp:6M:xG:pr:ni:vH:85:aZ:nE:WL:y3:2k:6h:Wh:v1:b2:pt:ex:gH:3g:F3:tp:S9:7y:wA:FM:wp:zx:2t:pq:qc:Z7:HL:Th:3R:hi:Wd:Ti:YV:rw:hH:a4:Z1:HE:2W:om:W8:bs:n3:Kc:An:9v:WN:bH:ji:oe:oQ:Ig:nZ:lC:Il:kD:8q:VT:6g:4q:CA:YC:gw:2d:ti:CF:Jo:wI:dY:q6:MO:0U:uO:tJ:QO:Go:pF:21:9O:ju:V4:Eq:zu:Sj:Oi:P2:7P:rK:I6:ZY:HL:Cs:2X:v1:xI:dT:yD:Xs:7X:9h:hF:4J:6o:01:S8:zF:9k:xx:7I:pb:L3:G6:N4:31:wZ:56:Uz:cE:x2:KS:Sz:lK:xv:1Y:t2:4c:8K:Ep:KF:YI:2t:Td:IS:1r:zm:0S:OJ:TZ:Xh:Vm:JW:Mf:Oo:9O:X6:Ss:yZ:nT:Dl:6J:ym:3V:Bs:7V:z3:BT:Ey:nl:2s:60:A5:tp:HW:vh:a2:TY:Md:Lp:WD:OX:G6:lO:4L:LP:pL:Z5:55:OZ:gn:1D:GJ:EH:QX:Rb:u4:ad:2F:SG:Oj:PN:Nt:kg:La:JL:GX:NA:7Y:E6:3m:rV:Ai:Zu:be:rH:oC:V8:d9:Z2:Ij:Pu:Ro:E1:rV:Cs:ha:ht:8q:FH:4C:WJ:j9:hg:pU:p9:qN:3A:yw:xT:8K:is:tt:EC:ku:KL:ui:Fg:d9:Wq:jI:iE:69:Ii:XM:4l:Cw:yo:Z8:id:pV:2M:uh:nZ:04:hK:ol:1m:oo:0r:lM:ik:kt:3h:Vw:mO:Vs:wc:H1:Uf:nP:r2:L4:Jm:rI:bR:TD:G9:2O:4y:lq:VE:mp:SC:q5:B7:QF:jR:1Z:ZN:wa:GX:Ha:3z:g5:aA:Xm:KQ:xa:JO:Fd:dh:fY:EY:xl:UG:bi:gR:aU:cc:uV:G3:Hz:og:lS:ZP:Rp:FC:Ht:4G:w6:6Q:3E:jC:y8:AQ:rH:1g:aO:yF:xy:3A:el:Q9:0U:Fw:dx:RP:w9:uh:0j:mb:Kx:rC:2K:l2:jg:VM:Mu:fn:uU:mx:3b:Ht:WH:dW:k4:9g:fg:H2:5U:tY:JK:5H:qr:Zo:gv:ZW:dx:gf:8Y:tJ:2j:EK:Ai:of:l0:2f:u0:f0:p1:37:vP:TC:jl:j1:vf:Hq:0s:Xb:fr:wL:Tl:MV:dV:HZ:TS:02:EL:ra:a6:If:3k:0a:QG:fd:dw:Je:3n:bt:2A:nY:2o:K6:Wj:m9:2W:wH:t8:5V:KL:Nr:Bw:Ww:m1:J4:nr:7l:kq:Vx:uz:uj:YK:sQ:Rx:px:G0:NK:fm:fg:7e:OV:ZC:pM:O4:Bm:5M:ZC:ll:FL:3N:cA:fG:9C:PU:d5:ha:Af:zn:Tc:im:er:MN:3l:7a:ZO:7n:1M:C2:2e:hW:68:hy:ms:Jy:Cm:y5:ih:2e:aJ:jo:H9:Hj:MI:dJ:8b:2s:C8:T4:nw:q7:B4:Nj:n4:iA:il:i5:BI:mH:3Q:um:SS:H9:0N:ci:Ds:NI:1z:Ig:Es:x2:2g:32:xA:nk:Fr:ON:pl:la:3H:fq:Ej:4o:Q8:Tj:yL:3J:wB:0E:OQ:A4:Mt:Zf:RU:Pl:EE:KC:k9:66:VD:Sy:Sy:We:gY:2N:rl:ZM:Sm:Dt:bi:6n:ib:qk:ZZ:oq:yE:n5:HJ:go:XP:S8:wS:by:MJ:cq:hp:G1:Ck:Ft:Bl:g4:MV:mT:E4:1h:LH:Z5:Vg:39:oL:F6:2I:Du:dG:lX:cY:xm:QT:Vc:gj:Vk:rd:Z5:eN:DX:zW:1u:KB:vt:zs:45:7m:mf:7e:uK:LH:ld:Tw:yL:h7:gR:4W:2j:sL:xa:2W:Dl:lV:2w:v3:sn:JU:uw:ap:SO:6h:1c:uA:I6:wO:9r:gd:UJ:Ng:p5:CQ:ua:Mo:HP:Uj:zs:6h:Sb:RO:y3:94:M5:J7:cv:2L:fY:s3:t4:oj:vb:KN:VR:Sl:KG:3K:Nf:gq:1R:hX:Nj:Yo:Qu:XQ:fW:RZ:x8:Y9:S3:ST:ES:C0:J5:cJ:be:lb:Z4:BQ:1r:BM:Qc:py:AE:oo:8H:WD:6h:MJ:UC:RU:wA:bg:HD:mO:ed:rI:Xq:0B:ih:n3:bs:Bg:V1:4R:cP:bj:qZ:wQ:QK:1B:Jw:w4:oM:hy:Kz:Gx:sB:QU:vt:e5:Fw:Ff:5e:yA:SD:UM:Yg:2p:Z8:uC:J9:31:Wu:On:Fu:ZN:Ma:cO:xt:Uq:Ug:Kk:fV:59:vr:p4:fq:FN:fd:AZ:Z0:6O:pW:z6:vH:Gy:rn:ZX:Dm:fv:sx:1h:vb:Q0:4W:SE:y0:EY:Gp:t9:HU:ws:d6:2N:rO:Lm:Ln:SU:eE:Ty:mQ:vF:Gx:8p:Mr:rl:Fr:CQ:ow:Jm:0A:A5:QV:5k:kb:uK:KN:Zg:0m:9P:Fn:Lm:8r:G9:08:n3:C0:YW:RZ:CO:7I:AT:Nk:to:pL:C4:TD:hg:dT:FA:qz:qK:JP:DA:GC:Dy:bv:kj:1T:Gx:gs:1R:Px:2h:yk:S2:RV:l1:f4:OV:dO:bO:5W:2g:SD:hZ:jH:VY:in:u8:f1:3o:TK:wb:QZ:26:so:my:NG:fk:Jk:jn:xq:1I:Q7:w5:BT:Ci:ao:hl:3B:Ru:eu:xc:Oq:fV:cB:al:Es:Te:RP:8i:Gv:8B:yc:TA:30:7i:uw:rb:ZM:Uj:ni:ZC:zA:B0:91:Ue:lU:WL:5T:R8:nc:D0:HC:yU:Ju:Sn:AR:Ux:xk:w6:iV:qn:jd:Jk:jb:w0:El:W3:RZ:xH:pw:6K:D7:pK:gc:NJ:c6:hJ:1c:l4:1u:aQ:qH:ze:F0:eD:Om:1J:7T:TG:fz:7G:g1:Ru:hp:92:1X:v2:SY:0g:jc:7n:Hz:eR:06:vO:8x:I6:8z:Z3:9p:F0:wn:wh:aS:Ab:Oi:73:78:GX:FZ:yn:QI:5E:y1:Fb:4I:lK:qF:To:oP:fz:Ie:ga:bS:4N:lj:Vq:5F:bf:Sa:sl:9Z:vZ:Qg:gy:gc:rE:qV:tf:P9:yR:XI:A9:s2:M8:Z3:5t:Bi:fY:ho:tk:my:6G:hf:Nt:RF:RF:M5:qG:AJ:Rj:Et:lm:Cy:zc:Kb:YY:f5:OZ:s3:un:QK:Yi:sC:C5:Ge:YT:Hf:0S:hp:o2:z6:WP:38:cu:mo:yE:w7:6g:Sy:Y3:Ou:77:wm:be:tZ:yr:yH:Yf:of:Oe:Nb:vA:Yf:GS:rd:KB:XZ:FX:s8:FK:18:xS:GG:r8:Vd:hA:nq:R1:d4:IG:XQ:Ps:QL:rF:Gd:gW:ze:54:S5:RD:9g:3x:61:6p:bz:zX:2q:CT:Qa:os:dU:31:KX:sj:In:sS:iB:Fq:8j:cV:tg:aq:a7:Sq:BL:es:ky:TY:6l:5G:BF:Rd:pj:bS:YD:k0:an:h1:za:uw:nJ:tp:UW:OW:nf:RM:8G:7H:FI:dU:MM:2s:yC:hm:Sf:RP:cN:01:7b:Ev:q8:57:IY:ol:pt:Fs:pN:B4:2k:pL:ki:HH:8R:uX:HF:iN:rN:5q:ID:FQ:ou:3x:Hx:sa:L6:Ab:4S:Sb:1N:ZV:nw:V2:pQ:Jr:jw:Ml:x4:Yj:jr:UI:1F:Y0:Oe:0C:Yp:9F:rn:iC:jN:6o:h0:XA:m6:y4:wt:hc:Ew:4W:s8:3M:84:gC:p6:LN:iY:as:ZN:Pp:zv:fC:u0:EM:tu:xo:vl:Op:fL:Pm:fv:X5:kj:Fq:Fr:g6:oZ:kc:vW:lK:1H:0N:d6:Ef:Yv:l2:mS:40:qf:KV:80:IS:c5:Aw:ox:2O:f0:4d:cj:uO:Cz:jb:zX:ko:Qx:fW:nl:uz:ng:jF:fd:Gi:Xz:Lz:co:JU:My:4E:JI:a7:bM:lx:VW:OK:wj:Fm:2V:lF:tv:Jt:Ja:XF:2A:MJ:Yk:pB:A3:WJ:Vp:sr:Bu:oq:0i:JY:N4:fg:FV:fr:1T:CF:zv:SM:61:cy:6y:ZO:fD:Dd:Cq:9J:NJ:rX:wi:5G:qs:hi:vm:b5:8n:ey:WQ:GM:lj:Vv:YS:ds:9k:m4:pl:8h:3G:7T:tX:ef:yd:JE:sw:Sd:Rz:sU:5F:xl:7x:xy:y3:Tk:aX:a9:3G:2I:wT:4y:rw:lV:BH:Gx:A4:Cu:z0:Yn:Nz:vq:Q1:Fu:hX:1H:wg:0E:5D:VY:vF:Tq:9A:GY:Je:jd:YL:ks:ls:80:HO:OR:H9:Eq:4i:Gc:Ky:t4:em:E4:F2:Ia:3b:df:kN:FI:iG:5V:7x:jj:jq:o7:Uh:dM:gA:ON:3d:2d:YB:LN:4Y:1x:iQ:P6:68:SV:CP:16:jq:G1:yb:8b:F9:yx:nS:Rw:GU:rs:1i:1H:2k:x1:Wz:4B:BM:Ga:8x:ee:YX:9p:v1:cc:jl:IO:hO:88:2V:cX:m1:Kj:Ag:cc:04:QH:uU:76:gE:w5:3l:5q:q8:H3:aw:jX:0e:yc:zU:G9:Zx:T8:oc:xK:aY:p2:2z:u4:IS:oK:X4:Oy:Es:Rb:v5:jw:8K:jx:Eq:yI:AQ:Rp:F1:uT:L0:w3:Ji:nV:hR:ZB:S0:0o:do:xw:BE:JY:VQ:sz:oz:39:kW:Lg:0o:26:yW:2v:LB:6o:Q0:Ef:0c:C3:aF:ql:MY:WA:Us:IV:tZ:po:FL:lF:yh:ur:NF:aF:F2:8H:wt:Pz:Bd:il:Nk:s4:1d:VP:6X:9y:Wy:5x:TK:ak:75:eP:Jx:mo:yV:tL:gO:k7:GD:J6:Gg:KI:JC:zZ:i6:Pq:Yo:WW:ZJ:Qo:jc:nQ:dV:Cv:xa:xj:SF:rA:vf:Fz:pC:Tm:EQ:jz:1e:Eo:KE:En:PQ:wt:bz:Gi:LY:wr:xJ:Au:TO:WN:wR:Qa:Up:YV:ov:U6:b9:Cw:Mg:Cb:Qx:BN:x0:lh:eJ:7U:L9:3G:TU:no:Jp:Fl:Ld:9X:dV:xE:Y8:yD:H1:oU:zD:Ws:lR:WR:E0:Mb:3d:Sp:y8:Vb:0R:f0:LG:zF:zY:1a:fX:ka:uH:Cg:qC:g6:oP:jC:tF:qA:cW:4T:9l:gw:IX:7h:FT:zD:iG:Fv:Yl:aM:XQ:VW:qj:wD:n8:UK:Xq:27:ty:qf:Qp:mC:eg:gy:h3:qo:Po:S8:uI:Zp:hD:IA:Yw:XF:vF:oh:Xm:c6:6p:cr:Yb:9v:Qp:7O:hh:or:hL:xJ:ZX:24:bK:05:jR:0N:t7:GM:hy:bs:GS:79:E7:26:3k:TG:kO:mr:3F:Fp:UW:wa:ga:7d:1I:ie:9V:90:RI:Cy:Yk:lu:ez:l4:Zr:7y:K4:nj:oF:Dn:jl:Ry:zi:VB:WR:9P:4J:Ld:rR:1J:3g:Su:Uq:TH:DU:JQ:K3:fP:zH:o9:Ad:Vz:tt:Ot:eT:bw:Z5:wI:ny:El:JA:Ew:pD:n7:01:Pp:jo:CS:m6:Db:xx:nN:Be:kP:R2:zv:LN:07:W6:cP:ud:ga:iL:sB:xQ:vO:Pd:W8:fJ:Z1:HL:rG:Ke:HG:45:9e:hb:27:3U:wu:Sv:D3:lh:ii:YU:Xj:Dh:q5:us:fw:oG:dX:Wc:yk:pa:DO:Ih:22:nk:vO:eP:m9:0J:8G:9X:ZB:3O:xE:cB:bh:3N:8T:xX:lF:nv:kF:jq:Dm:vv:Fj:zL:4I:lE:iN:k9:5v:9N:QC:ty:xS:1t:cR:6h:On:bq:lb:ZD:Ui:uL:rJ:Lm:tQ:QH:qE:yx:Il:Dl:lW:8p:Cz:kC:eM:tH:g9:w3:Rd:JT:xu:P5:8S:wp:1Z:m7:xs:gN:KP:Ke:yI:Im:Du:EE:En:1Z:3d:bR:v1:Yb:D6:il:fq:Lw:Jy:hA:mB:wt:ND:5K:6C:C5:qb:oL:HB:8m:oD:g3:th:IU:b6:YN:QN:ZR:hA:tY:Vs:1S:4Y:9K:wP:d0:Oq:uk:oE:tA:vk:IE:FR:Vn:rD:ec:K2:9I:61:if:rj:Ld:QS:OP:oE:RL:rW:Bm:aB:xa:Qs:Zk:9X:rh:cW:sh:Nd:Bu:xm:SD:KL:LK:cS:aF:hT:OA:WS:pQ:9n:vx:eQ:Us:6s:xx:Ly:Of:29:Wp:0S:Rl:G6:SK:0A:6y:4m:qw:ef:iR:wF:Ij:Me:vu:vW:XY:iP:Il:rp:HY:bP:MZ:hg:nV:Us:Fo:bC:dM:pc:y1:yK:I3:U8:wS:i6:i0:XE:7x:Xc:8B:wM:7F:cQ:sT:Ll:ws:V0:JD:RP:Fm:T4:bE:G0:J2:Qw:ZG:QB:YV:u8:8i:dH:IS:rS:1K:jN:Jv:UU:us:N5:WK:SB:4W:rV:TY:eG:eI:9K:VY:lt:ht:AX:2N:uw:dO:xQ:y8:62:Bd:Wd:k1:OT:fY:8f:5t:ei:fk:J5:Pi:6m:gj:qe:39:yo:e1:xl:au:8W:Ge:ii:0P:XG:3c:Yq:Da:31:w4:Lb:j9:lS:Oj:Df:A4:5r:Ov:d7:pD:2R:va:Wg:OP:H1:bg:Y4:oL:KT:V4:Qq:TJ:kO:g5:Kg:kr:7X:NN:K7:Lg:2H:uC:8f:kt:N6:KT:gM:eP:Ms:z7:H6:d0:Iy:Q5:zw:Ee:RR:ok:Im:Dv:OF:gc:wR:bl:wu:wu:TX:JE:3o:rJ:k0:Vt:DR:yp:LR:m0:f6:yh:mI:Ou:VI:mU:St:aM:So:Fc:bG:nS:t2:UI:LI:z2:To:GB:2c:ch:wk:QU:tJ | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	e?������������j/���1��J0wJ�ci�)���H��!7�v;�!r�	��G%�����a�X.�s�H�O��nW0�����_���-g�r~1̕��5P��d�s�=���z!�+Z�q�*���ͩ9�ʬ���+��7�GL�'w���}�&��c�n�/(E�}�R^ؙvڠ��{���h_���V�N,T��f�;�M��'km��R`k�/�ո�U< �9b�P4;ʃƗ�+��3v�K�cJ�S���4_�J����o(_���0���\��:g��Z�h�4D5F%*�z�y�Y�
'���%{�.l��C$�S�qE]����G�}�'=Fy��}ͮ���