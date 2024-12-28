#!/bin/bash
#
# This file encrypted at Sat Dec 28 18:59:21 WIB 2024 by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | kO:Rw:iy:cK:ft:gp:UW:VA:kJ:Ic:5H:67:bC:CU:10:tT:3f:p3:sr:9B:n1:p4:JT:Ls:qt:rJ:sm:9u:9q:Gb:JS:2K:w5:pv:R2:lo:D2:jg:Du:7G:8P:tm:fq:P2:gx:8k:S5:7P:wt:9z:mR:HV:YU:Fw:1R:s5:09:SP:55:lB:Go:V4:6z:6e:gZ:xT:6J:aK:L9:0D:gr:1e:wR:2F:on:dM:4H:UQ:MB:G7:L9:bf:mc:Xs:0X:3t:du:14:t5:1R:uc:Mk:NJ:BM:Xb:HF:C5:3z:gu:6q:XT:RO:s2:y3:EH:Ym:0O:tI:Wc:Ct:oJ:sE:Qd:ML:OI:mT:Da:qd:JK:a1:ws:Lr:eW:vX:CJ:kJ:2Q:Pt:o9:AV:n3:mm:ei:e3:Yg:IS:3d:AR:1x:JO:og:No:lV:Hw:EL:Uq:NV:le:fo:0o:9u:ff:vT:3C:5C:gx:re:ql:np:YX:Hq:Iv:4e:Dy:f5:iO:el:Y9:yT:e6:Qw:fd:2N:Uu:HH:z6:kO:Vq:eK:yT:rA:4U:3Q:Dw:X6:aD:N5:Ws:Sz:7S:Uk:0Z:7c:gu:2h:Ep:Jq:IR:yc:yy:WQ:nR:mH:Gk:Xi:kT:MG:Sc:TU:0v:cS:0O:cT:Ij:CC:ly:7a:Am:EE:l2:sl:xi:8x:8i:50:wL:gs:S0:bs:2N:6D:8Y:GE:He:B0:UI:Gg:yT:5C:ja:3s:4Y:KH:t2:ET:wk:3z:Gs:0M:ZJ:5l:Vf:jo:FE:7t:h1:lN:qe:FF:rV:5l:e2:HD:YA:SQ:HI:h3:tT:lH:nD:Tm:QK:Vt:i8:2z:Uk:vy:1y:k0:V2:hr:lZ:e4:L0:bT:Ym:1e:3y:tT:zk:G3:ok:rs:r5:gI:yp:A4:A6:sf:97:na:DA:GC:aA:i9:gT:47:ga:YC:sA:Vj:iA:k0:Ap:S7:3X:Qq:Z8:bc:MA:7X:ip:eY:iJ:9H:w2:Rm:30:gO:L3:tz:XT:Hd:24:wQ:qM:IT:TC:ZA:O6:Ni:JU:6D:9V:ab:cW:hv:f2:NJ:mA:GE:4I:57:CS:ZM:FT:bZ:t2:Um:gm:wC:FN:WF:Xv:tc:M4:0A:gz:3U:Hb:ms:Zx:3U:ti:Zo:M5:EX:UV:sR:Xg:IW:KC:ND:iL:De:J5:Aj:5p:zZ:GQ:Pl:p8:yi:lj:PO:0C:Rf:AL:S6:nw:ue:Zo:Ns:b1:9v:2H:4S:uv:1O:X3:eX:FG:CH:cu:VK:0x:2s:X1:RO:ng:uF:xs:kq:9j:dG:b4:dy:W5:VG:bm:LH:AV:fO:kE:7C:7j:zg:RF:fA:Ux:XW:0H:TH:Qn:jQ:Aa:h9:g5:1O:9n:ou:hT:Dn:Sw:0m:C8:5S:tR:Ij:u1:UJ:Cy:me:WH:Qn:Bw:9J:gl:Nm:mA:fI:sU:og:KU:mk:gs:WR:OX:kK:GN:Uo:ot:xK:Gy:Ky:0S:1b:GE:ke:VK:3z:Qa:p6:lq:GD:Px:nd:TR:fJ:Un:fZ:rE:HK:Xv:9k:Dl:rS:Zi:fL:3m:uD:29:qm:NC:67:kG:S1:Rz:zS:dw:Ev:di:0l:Y9:ek:bP:6p:3O:rj:zN:Yd:Jr:t3:Ns:Oa:Hu:j0:eo:8Z:jR:ef:Vr:Zr:BO:Dk:IE:r5:9O:7M:D2:tA:Qp:jq:DA:rX:NW:wq:VR:cK:RI:Hy:VG:rW:hE:ay:2L:t5:5y:dh:e1:ub:xW:3d:1E:ka:a6:EU:si:5E:NU:aY:lz:JZ:Vp:pM:uB:4O:XB:Bu:MW:r0:dK:sj:Yg:2u:Iz:cr:WG:B6:n5:Ym:Qj:x8:sx:s9:dW:QW:X9:SX:Uz:Dn:VK:sx:xY:GM:bP:yY:Co:ZB:x5:NS:Q3:dx:RR:bk:ej:8V:w1:C8:Z9:MW:ws:M4:ht:Hk:wA:dK:JL:Lp:zE:sF:RG:SB:9A:Ff:lI:Ig:si:vi:kt:rQ:Ja:2z:Hh:WJ:Xg:jP:ET:pC:v1:zr:LQ:U7:pP:d5:ZG:bn:zT:H2:ye:b9:a9:M4:k5:x0:3b:Tl:XK:Z9:CE:j7:Pw:qw:8A:Bk:5n:Vm:RX:oT:ot:LQ:4e:bK:1d:Zn:3H:9S:4I:tg:YZ:gP:xH:Mn:3d:Cr:7y:Sr:8r:dU:OK:wS:cG:ak:kF:40:TK:JG:zB:U0:xX:n1:Da:96:xd:4N:T7:Pe:DM:TG:64:R1:Qk:xf:DD:hq:EW:ZS:13:az:23:oa:Z5:xv:ij:ql:zZ:Zz:Yd:ec:qR:J0:ek:90:wK:Eo:lX:SS:wK:tQ:p2:eo:gn:dj:XI:2e:j4:ut:so:lb:F6:Lr:sd:OI:Ip:7I:X3:Aq:f0:8E:C8:HC:9b:pa:lV:JA:aQ:EX:Cm:E9:WQ:Ac:qT:Wi:lO:BL:ls:eK:OX:EM:0Y:Km:Pc:wf:Qu:yA:FR:4n:Zi:ZN:Zv:zu:Cf:Ep:iu:1t:NG:Jo:zS:pg:kU:Ng:xF:6a:05:eW:34:BP:6u:vM:Q2:wQ:hy:WI:WS:Ra:61:cv:9r:WQ:1y:4k:u2:ds:x7:XX:v0:Gu:yG:h1:NA:yf:6C:wX:DZ:Ye:Af:fS:RU:J7:NZ:5o:n0:9f:jg:86:Rm:FR:TA:Dc:DT:jh:W9:2a:kb:7W:hU:NJ:lp:P2:SI:lQ:qI:aH:11:TY:Hn:vG:Sw:VW:XG:n2:4G:6E:fJ:k8:u6:yA:cv:nv:Xx:Fw:Gl:pU:OK:o5:1V:xZ:OU:f2:WD:mZ:O4:CD:Ig:gh:vk:Sc:YZ:vp:Xm:55:ux:cj:QV:XZ:Ex:Tq:15:fA:wh:tt:sQ:Ns:gB:Bm:JN:T2:iZ:C6:yA:u3:DT:8B:tD:Ty:MN:DO:qI:8r:Ta:Y2:Nk:Ya:p5:oY:hd:E4:82:6W:3L:RC:mE:oI:Tx:T5:h0:ON:Vf:hL:hn:tF:qT:Bu:ap:10:1p:yS:0g:vV:vw:YO:Qn:q6:LU:4u:iu:7t:pQ:Ar:7h:YU:zK:6S:8X:CK:5h:XA:8O:AA:eF:JF:Re:gO:HP:dm:9T:PV:KI:2v:jZ:4h:wI:L9:3M:kP:BQ:zN:Dz:UY:uf:6S:st:T7:VV:v1:lr:qA:Gj:sa:Vc:bV:2V:tf:e6:UA:oS:zT:Xg:Mq:2N:86:XJ:WA:tr:JJ:y1:zY:a6:xS:RT:tR:Gr:Za:69:Dp:rj:Zv:nD:VN:YC:Nu:u1:Ii:tK:9B:Mn:YG:pL:Oj:jr:aI:aV:qb:Lo:dU:ea:px:17:oO:eE:ev:3z:RG:JQ:xB:kX:Nj:y5:98:LA:Dj:Gv:JD:21:eX:G8:pF:ng:Ct:c0:KS:sm:pO:fH:kC:bv:Y6:Ae:dF:tG:6p:yW:B3:Rx:RC:IJ:iL:SP:rj:WU:wI:vW:z3:1B:SO:fC:4s:1a:uS:Sa:b7:jX:eL:Bu:ZK:18:or:9e:0j:3I:99:wv:pm:Yu:Ve:8o:T5:nC:pi:nc:KY:rm:mW:A3:GK:Fo:ff:Q1:R5:t1:H8:QD:Ps:Eo:AK:Kt:Ai:my:3M:p8:Fa:b1:mX:8R:uT:0F:rV:sp:oV:M4:c8:e3:Yt:4L:lQ:L9:GG:ne:Xj:js:WQ:w7:TY:JL:bF:7N:Gn:w4:BG:aT:SL:mr:WM:qy:Yk:Cb:u3:ls:NZ:xd:IN:WQ:xD:n6:m2:Pp:9q:C4:DG:E2:yv:LJ:0k:zy:sT:lk:NR:9j:iJ:lO:by:K5:XN:EV:zX:fe:iT:cS:p0:dK:6X:ww:n9:Uo:zV:h5:ZN:58:39:W0:uA:qi:Rm:fl:Ln:ho:n1:1D:H3:G5:rC:gj:BP:Ow:PJ:Wg:Cc:kC:MZ:ok:yS:UI:Ng:Fh:NX:Ei:nX:n4:di:PB:cP:qs:NX:MO:xX:T3:Sp:F8:1M:0S:Bg:Nu:BD:70:ID:uk:B3:Yk:zW:qY:D0:jl:Lr:X6:u1:0F:Gu:47:fd:DI:cK:LX:y8:iE:cs:Ol:5N:uM:2y:Jl:7O:qw:Fj:FE:OO:EA:yf:t0:z5:l1:aB:wT:7o:3A:c3:I2:g0:wv:VJ:oh:Zg:3l:aU:FK:EC:Nu:D8:3V:b3:Xl:pv:e8:lD:RT:32:VE:tQ:7Q:j5:VT:Pa:Qp:D5:5c:dv:WX:dB:jq:Fh:4v:mN:Zv:tX:vC:FS:Iy:xP:UB:UW:z1:1p:0O:K5:bO:cD:G7:5q:d6:4n:2y:Ae:fS:J2:eg:sH:h6:UJ:ip:pU:KG:sO:6N:xa:mV:WT:Ae:7t:xG:Cu:GO:Fd:N4:D7:JV:S5:VV:lV:Iw:gg:fb:3T:V6:gK:vd:Xm:Pu:tG:mQ:d9:2D:VO:mj:wQ:Ry:9f:PM:4A:Db:pU:Yw:Px:x7:ZT:bh:ZM:MJ:BK:AA:Kw:1c:vo:ch:3p:Cu:te:OA:RY:NC:BX:1U:kS:8D:hq:aG:Xy:ea:Vi:x4:bE:dB:J8:1W:y1:eW:FN:sO:qM:YF:kA:Tw:IW:U3:sK:ui:Kl:LX:Q5:T6:nE:yS:s9:Ek:ck:ov:Sf:Js:Gk:Qf:nn:Dj:6d:RL:9C:SK:nF:dx:RT:Rk:Co:PT:B8:Y1:16:fr:cs:8p:ip:Ue:Lk:TZ:zJ:jH:U8:ti:9E:ZV:9T:w8:C0:cU:iP:S2:Do:Um:kB:E3:ej:G8:JB:Lb:dF:5d:Rn:Ok:7O:qk:ik:Lc:zp:kE:ci:41:Ez:Id:pA:Ik:g7:2L:zT:23:QP:5a:OP:JF:BC:Oq:Qe:Wm:Xs:RI:rY:tZ:3y:oP:38:iG:L7:N7:UH:1n:V7:FY:0F:Zm:Bu:j6:s8:td:Kf:UY:0f:Eq:hW:ym:1c:uA:In:be:jw:9J:mK:jA:9C:a4:6i:56:4R:qo:ZO:JA:Ux:wW:nh:80:Mq:VX:7U:o1:o2:jX:7o:DG:tI:TL:2V:2L:Iz:dE:QZ:j5:qq:Fd:tC:nS:46:16:Og:ui:zx:3c:tz:l6:Dh:2P:mz:Au:xt:8F:Y1:Q7:Rw:Qo:aE:Sh:kw:7h:5d:qt:TI:aK:co:IR:kw:jr:sw:4u:xP:3Y:Mj:SB:dG:3Q:8L:DQ:5N:Zp:6u:9R:IT:S2:v7:PZ:Ue:7B:AB:bf:0M:an:NB:vT:Af:uQ:ki:5y:Vh:zY:ky:WK:KF:1u:vz:3f:fo:iy:0Z:tw:wN:Qc:QL:Oe:V7:nQ:Ot:rp:Z1:uM:Av:XS:wO:kK:o4:00:jr:L1:sx:X8:bN:tL:Rx:Li:j8:1v:5U:dn:CD:e7:jE:Fc:ui:Qg:rZ:IH:2V:FD:KC:Uv:4q:iY:r0:ql:uR:Lo:0O:so:9i:xl:qx:y6:9s:RD:0p:2B:bE:Vw:UE:T0:lS:Yk:29:nE:O0:Qq:JN:4y:lA:9e:ZF:2m:9y:SO:Uk:r5:2G:3Q:71:0w:Jd:Mh:8R:B3:Mp:yQ:x3:fK:EU:t7:LL:1Q:bI:FY:Px:Cd:0H:u9:jH:40:j5:0T:A5:kL:It:H8:Eu:ip:kR:42:0k:1z:Fy:f9:2T:Z5:aS:tH:Be:1v:CL:XP:5X:DG:X1:zm:y3:sp:Ro:Ux:Wu:Lp:If:DK:EV:FC:DP:tW:uF:Dt:0i:NB:e7:TU:oy:7a:GN:sb:mB:qg:aA:Eq:tN:Br:3X:IB:v1:do:LI:MZ:0h:3V:Fg:PP:0c:0V:xZ:zW:f2:bY:pS:R2:Rk:xT:aO:hC:Uo:Kn:d5:Tx:cu:N9:ib:FL:aA:zE:BZ:ZK:tj:EW:I7:Zj:ha:DR:hW:o9:KF:Sy:0c:Ex:Q8:R2:TW:OM:1V:51:u9:m4:Me:1y:Vd:dB:lx:aF:I7:8X:6y:Jy:9W:Uy:Xv:Sk:4H:r3:Y6:by:kI:xe:Zw:sS:kL:hq:V1:p4:0j:Ch:LJ:h7:CN:PP:hq:En:9I:EW:H4:cv:Q5:04:KU:3L:mO:o7:3K:MV:Hv:NA:dl:DK:rO:Mt:Qc:Ia:vg:vt:24:pO:5Z:Ko:no:6O:1c:8P:Sr:tL:q2:Bq:TD:T6:wY:AF:tK:am:NA:og:NS:TE:WY:EA:vf:cv:gB:3R:XO:Xz:Qh:hk:6r:io:0j:Fp:n4:2A:sf:va:rT:Zq:MG:3o:F1:l1:zL:uR:Bu:VK:fY:w5:1Y:Vi:4t:lP:kJ:hb:Po:Eo:mP:4N:kV:1v:wf:1Y:UE:wY:Nm:6d:s6:Tv:Ex:CH:E7:bv:UL:xJ:sy:yx:k9:8Y:W4:qz:AV:OE:Vn:Hu:OM:V3:s5:hS:1O:gU:ef:WV:eU:1F:jg:gU:io:9f:yv:Ep:hy:Jq:ed:wZ:jI:bz:Ia:rf:74:VV:s3:D6:3u:NP:Ps:BU:wu:oO:Zm:bW:hq:sh:vx:X0:X7:uj:eD:j6:Fd:9v:el:gd:uw:ix:JI:Yw:q6:hF:ch:Cl:kO:z4:Sl:NX:QZ:Bz:gk:O5:aV:g4:h3:yX:Nv:nT:vL:W1:6M:9U:r4:NW:LA:iB:M2:9m:Dh:LK:WH:vk:vK:3C:0E:Qc:5y:ro:Uu:QE:ur:Kl:oc:nA:pX:wE:Nc:ML:A1:XI:pn:0N:VX:oH:Re:Bz:Jk:AC:IY:Jl:gE:5E:iV:JG:XU:ND:iK:HV:tL:Ez:gv:ew:eA:t3:II:y2:4O:lS:fQ:uk:OF:Ov:Lq:gi:kr:vX:kV:Bs:wB:rN:dY:Xe:fU:Ym:Oe:u0:dj:eN:2z:BF:Ks:1S:Lw:ml:dW:Wv:ny:v6:uQ:Tp:oP:3U:YB:Nj:Wx:ue:ze:v5:A3:4B:p8:z2:Ri:ZO:4B:Px:mj:rx:H8:2B:n9:U5:1P:sJ:ml:a6:zp:Ru:Wz:sR:km:D3:QX:Hy:zA:ur:or:84:Gp:Ly:T0:n4:9r:hn:3T:MI:24:MI:l5:B4:vl:q0:Tt:ks:6w:LK:Vp:ef:0x:2U:Jv:sc:Ab:ek:D1:bV:69:Di:aV:Q9:oX:EL:Vh:Yp:jx:BW:4P:V3:3b:MV:aE:wc:ew:aI:Ol:Lt:eN:AD:Mt:nq:hI:Ke:xk:f5:34:0v:HR:Ms:qd:nD:fm:YH:2g:39:wC:qO:4K:Ka:Cs:ep:4n:Bs:Jm:ph:Va:NU:Qg:EJ:Bz:LE:4P:z6:3E:1B:uI:lO:Kg:WJ:Oi:pi:Eb:ob:oW:Dc:nD:hx:dP:wB:DM:Nu:9c:kx:Am:vg:dE:XH:6Y:8n:w4:lg:fB:h8:L9:IT:IC:hY:Fj:nV:Qf:85:lt:oB:B1:EM:u0:4c:KD:n0:yG:Lr:0k:uS:XP:Yo:4s:q0:F8:39:k6:rM:XY:74:sS:vt:1l:Jq:7p:ts:TV:2a:Lt:Hb:Ra:sj:M2:4a:0W:vb:SX:7D:yQ:6S:K4:MK:h1:mo:kW:ik:ED:ku:n2:0s:YS:Fu:QY:NH:aV:AH:VN:0t:NB:LF:Ww:yo:cC:ge:e2:3B:5W:FE:ma:4Z:4M:NN:el:oh:FV:rt:87:JF:HR:c2:TY:PM:Db:Sq:SM:Mj:an:rw:RO:Hk:Wi:O3:DV:91:zF:8b:E1:8Z:0e:D3:nM:Fj:fG:2y:LO:x1:qe:aq:yt:VO:JB:Mq:zv:mH:3b:5d:Ex:NL:1F:V1:J5:ok:Uf:3U:w2:aA:Qs:Sj:HJ:LM:0t:cu:yi:uv:3L:27:d0:1C:H1:y4:E9:7b:h9:TL:z2:5r:fW:Qs:eR:UY:Mh:Bd:4d:Bl:EU:Xi:N6:d7:fQ:bo:8v:Oj:Zg:Uq:AB:ZI:pw:Ts:v5:Iw:P9:mK:Dq:d6:Sx:33:yg:8h:35:go:sc:Q5:Qp:dF:kU:V0:5C:9H:9X:fP:wk:rW:IZ:UC:jW:yR:d5:hA:ma:f6:AX:LL:XY:EG:Qm:M7:tI:aa:r8:oy:48:Ju:1b:Ra:sB:me:oV:ad:JG:1W:j9:JX:E8:Ou:8x:wz:Yd:3h:H9:y8:wj:Gb:eP:zN:4Z:Xe:u6:z7:mb:yD:aF:Zz:Oc:77:K3:hn:tC:RD:fA:CF:n7:5a:qe:uv:X9:0z:0x:LU:3q:1W:wS:jY:XS:lv:TB:DS:YF:ru:JD:GH:VO:sI:lS:s2:3M:nK:o7:wF:bX:KK:eg:Op:QN:gn:dl:Ze:II:Fh:HZ:0f:Gj:Li:t9:rj:mC:Pk:qK:Ci:zq:xw:8a:Dj:7c:zq:H3:YX:U0:f5:td:qg:0d:4d:cA:YR:Ij:Xm:vZ:ih:Ff:XW:bv:sz:r1:eV:sa:tN:b9:x1:AC:fd:MZ:3s:gl:FS:RJ:c5:Ho:Ij:CF:N5:bu:Su:ku:VE:KB:SW:Op:o3:Tc:jB:es:Di:px:QR:bH:7V:Qm:Zg:DH:s6:2Q:DF:Ec:b7:rl:Bw:La:W7:kr:e0:qV:4Z:1Y:w6:yE:XR:rR:Mg:dw:DA:HJ:a8:9l:F4:lB:3V:Lj:3a:7I:MG:rR:Vy:8c:fi:EJ:nu:zM:Et:hp:gb:kY:Lm:MO:1t:ZJ:wt:PY:Db:Ry:Hq:yy:y7:lR:NZ:Oo:xf:FN:ow:Ld:kW:tq:oY:v1:uc:Kp:dj:us:eh:Kk:JC:h1:gQ:8J:IT:PY:1j:Js:hJ:Ar:jR:gm:dj:ZZ:l5:t1:NY:7m:nQ:Rc:3h:ed:vs:vZ:pP:7N:Fd:SV:lb:VW:S1:D0:ts:L0:4z:35:xX:XG:cM:Tb:c2:kS:tD:da:BS:hY:yf:2R:hz:FH:q8:ID:wk:En:n9:N9:J2:cQ:aY:yj:8i:r5:8v:EX:JJ:PR:Nr:9i:4R:al:JI:CW:AA:zC:SU:0f:zH:iZ:MY:IO:uD:86:QM:sp:V1:WM:MU:ck:XE:D5:Tc:8P:cq:kN:WU:4d:Xa:Gp:gI:w6:nj:kP:cE:Nt:fx:qX:xG:xr:5a:2F:si:L8:Md:qM:s7:n7:ms:3A:lX:CY:qe:sc:CX:kN:k1:LB:Yw:yh:3O:EJ:UH:iO:Eb:Ui:bK:o6:TX:ha:ZK:AD:Xu:yO:Ay:2G:Wg:um:6D:0h:4a:hR:dr:uJ:pV:vt:gH:Jf:G0:vf:3y:xs:gL:Xa:mV:Fs:aW:CK:hj:f5:oN:Y2:5f:3Z:tq:xq:Aq:tE:dH:Zh:02:Ww:yZ:c1:bM:2D:vZ:q7:hb:f0:wV:2Y:6M:g2:ha:BH:iU:dM:qM:y6:eF:sy:4f:tc:Fy:sU:w7:WP:tt:Rs:FM:AF:4R:p7:rz:lo:uX:vV:vH:ET:Fa:Js:6L:lX:il:ZH:3i:hc:YN:7m:66:HV:24:MW:pA:2N:27:yt:Dv:3g:7D:nb:xY:Ok:Rz:vj:V3:ky:ik:1V:h1:yF:p1:xf:rO:KB:P0:E9:OB:YM:ay:Cq:lC:iz:wc:YH:n8:Oo:q1:UN:T4:tC:Ju:pS:q3:3V:wb:p8:Kw:fZ:yE:XX:cS:xK:23:j9:To:ze:cz:mv:V4:7m:WL:Ec:SJ:Df:RE:o0:VG:Kg:Do:kT:6j:bY:cV:cc:Ff:q9:O6:qz:XM:tD:Oh:Cx:pP:mR:mx:xA:LD:H0:Zu:zx:3z:ub:9S:Qv:7d:0L:2q:H3:gl:IC:Lv:FY:eT:HX:mn:GE:P3:MB:Ri:jT:G4:YP:vB:aP:fF:au:pT:VP:sO:RH:se:XF:FX:KD:A6:ML:f6:uI:3M:mc:ES:V7:xw:RW:W7:Wq:Uu:J5:ZL:m6:DM:Ak:vw:qp:hL:Tt:Po:hF:4c:78:X9:3g:bF:Jm:eo:XQ:8H:R2:S3:re:9Z:ny:1i:kB:eC:Tj:tW:YF:Bu:wZ:50:gq:DI:kJ:cj:ll:MB:9X:I7:8S:mt:0z:Mw:zv:HC:5y:Be:N5:ip:hu:4E:En:bH:ev:BC:hB:ZO:Q2:kJ:20:Y3:sP:jI:y5:Lo:Tn:Jb:Ik:A3:AD:3Q:Dh:w6:Ps:lH:xV:FS:a3:eU:Z9:ez:Po:mo:0P:CF:oI:iB:m7:kY:Dd:kr:xV:Yg:qX:pX:U0:vw:9b:CB:DO:fF:jX:Ee:N4:BY:Cd:ys:Kb:b0:yF:Nu:Ck:jf:e0:D4:id:M7:ud:F2:3V:hT:Eq:CB:jW:4u:8f:jl:xY:OR:MC:m3:0C:ZJ:ha:tp:Y2:RB:u2:Iu:3u:Ey:tX:br:mm:bN:tk:SD:R1:Az:VH:Dt:RP:Sf:KT:wP:5v:SM:0i:FX:DG:io:pK:Fg:lU:we:Ez:xA:Ui:m5:2x:Xk:mw:XH:J3:OB:aX:qW:xE:RR:z3:cZ:Qu:Hs:bP:Qq:gm:bB:K7:rz:fO:Ms:zM:mG:Zc:ez:rw:tN:0n:nT:gJ:p8:CJ:63:zr:Gg:A3:dt:sP:Ko:VJ:Oz:cs:kP:rw:JT:HL:Bg:Js:yp:W9:dY:L6:bU:Bh:Q8:cu:Vp:35:Zw:Cu:eC:RB:8r:ZK:xc:bF:W4:j3:TF:zn:v5:Qq:lO:zF:Or:wJ:pB:n5:sw:zx:97:Nr:1U:yj:nB:ZD:lx:0Z:8S:ed:3v:AP:oO:SP:Tx:vT:qW:fq:IV:sB:ei:ak:7p:vm:qt:pG:f1:ir:yN:JD:v0:12:lV:a4:rL:8I:ws:bL:a4:Wq:vD:ax:2z:34:Tj:NK:TC:X2:9H:MS:JP:AS:g2:R3:Jb:ZS:4O:Bz:bJ:uw:nz:z2:9o:MB:Mw:dG:6j:gt:ZO:un:wM:AD:f6:hq:ye:SR:HZ:t4:ti:is:F0:Q3:Zu:ea:2M:zX:E1:Nf:QI:L2:sM:vR:mt:B3:Ch:aq:Wf:Jq:sj:oJ:MM:ZQ:iP:YN:az:3X:vZ:rW:ix:kV:XH:Rn:9s:8c:tE:xn:jk:ki:AZ:8L:uX:6N:WC:9B:pR:s1:sU:aG:1T:fq:8U:Yq:gt:zY:SU:2z:rg:iS:ty:oq:64:6J:NO:jW:Zt:y7:LE:AU:rw:9O:wh:lO:iP:yp:8C:8Y:hA:Bc:rx:rA:aI:3P:2S:Hi:Vt:NH:aY:rD:Kv:QJ:4E:Iu:xs:p1:OF:SC:nt:EK:DE:EM:qV:UM:GA:od:Br:2D:Ll:M5:Kj:u7:gH:rW:JC:Fw:lO:Ab:bP:4Y:Kb:Px:gL:wT:G2:AE:IB:yO:Zz:aI:rr:bX:QI:8I:0L:2y:na:vv:rn:cg:Ej:a5:E5:iD:Y4:JU:eQ:Ej:OL:VC:Uw:JR:7o:9r:Jj:9F:7m:VP:xK:pA:MT:yQ:QZ:Q5:iN:uf:Om:uF:rZ:Gs:P6:9R:SW:eC:nc:lK:rG:kD:0X:pH:gm:IE:pA:oa:JF:zb:Np:SA:uu:vu:q4:Pw:5l:AG:ok:nu:gF:45:5e:Qs:SK:0V:Vi:eA:H6:UK:iT:n2:KY:1k:3S:AQ:DS:Uf:3S:BC:U6:8s:Jx:kL:mt:ce:53:QM:V6:H3:lK:3F:XG:1l:48:dB:9e:N1:nC:4l:kv:C2:GX:4U:Li:dB:on:CN:ed:Fm:fT:S1:o2:FR:sm:7d:2s:jV:0j:Eq:pX:Ns:03:uB:t4:Fz:4F:eA:hr:Q8:ju:C6:CP:cU:IM:RC:CB:FI:YA:AS:kY:MI:4k:Oc:nu:dc:gL:NI:mw:Gr:fc:a9:Tr:KJ:iT:VW:Z1:Kd:cn:NT:ar:sl:ut:xf:jP:0Y:9n:m1:UB:aO:pP:Fx:UT:LI:Ec:zJ:dA:9b:mD:6n:eC:FL:bV:v3:Iu:4F:w8:Wd:c2:7t:xp:qO:eC:8T:Z0:3J:Y5:91:e8:Bm:3b:CX:LV:zL:SX:Zr:GL:AW:Xg:0R:8l:eO:pA:ta:jf:sQ:92:CC:h7:p1:oj:el:93:xP:lA:rv:us:ja:6u:4P:sc:Y8:o3:o9:m8:I7:uD:dU:OG:XZ:Ek:jl:2Y:pj:fk:oN:mZ:4C:Em:TR:0f:6C:ne:GM:5G:7m:sT:ZH:U2:l2:w8:is:nX:uB:Dj:Nj:yR:ZW:mj:ac:Lm:xq:LT:zo:zY:ln:no:bT:U9:Sv:hA:Oa:1A:hI:Hh:TE:2a:em:5R:vL:mY:7S:Sb:rG:G3:f8:jR:qB:yu:f5:UT:DK:w8:XN:WD:ne:Hs:s0:1S:oU:ZU:cm:ku:qN:d1:dN:iK:zz:jO:Ch:qO:4f:wa:F4:Hg:M9:CI:xT:EO:yN:Tn:2q:6t:xI:a4:1o:zH:lR:SR:lv:uw:0n:dA:vy:Oj:kN:hT:cz:Ee:aS:WU:VQ:Mz:Sk:Xg:kX:Ie:ce:Nk:97:0a:Pm:pY:rW:zL:EY:pl:86:8W:iN:wi:EX:uU:JO:Hm:xi:Xf:9U:rP:Fz:mJ:wW:nc:Rt:n4:6z:2k:cN:Sh:d1:L5:zf:yz:eQ:yc:Xl:IP:3A:ZW:LH:oQ:Yz:qK:R4:s4:Z5:0z:id:uY:5T:jj:2D:G8:gd:Fr:7q:st:8O:4o:bm:EW:UT:iF:K6:LH:mj:Im:2r:po:Gb:Vs:Kz:NY:yy:f4:zk:Yp:Dy:dj:9x:Ui:lA:GL:6m:aa:zd:HU:Fa:yP:Q1:vF:uk:d4:Hk:Su:Ef:ky:Xv:ED:lV:Yj:X0:Lv:JV:rp:rm:f5:jd:G0:5S:sw:gY:SM:Fd:xl:tt:4U:D1:io:yx:Ra:KD:Tp:8O:ZE:2O:6e:wo:eF:Rc:2t:Pt:Wy:hr:b0:dz:Wt:Pj:iM:2X:kb:Ph:FE:La:2b:Bq:zm:qp:VC:tp:R3:2H:Uj:Hn:Oc:ZY:Fg:bm:Vn:et:Ee:Ag:0J:OW:ig:oE:MW:0G:OJ:F0:KK:JF:pl:Nx:AM:jf:4p:dW:0h:bo:U1:JW:nY:P7:vM:7B:3b:sj:rM:W6:Zb:1B:SA:bT:EN:BL:uF:AX:cL:Wc:ic:3q:QX:Gw:LO:Qs:AF:pF:H6:Xj:IF:ZG:Fe:Z9:AQ:JY:7F:z8:Az:QT:hA:2G:Ek:A8:JM:Gz:s1:Vt:TJ:RV:ki:jL:ox:Th:f5:KN:cP:vN:rb:n9:yC:Vw:0P:Py:F5:Th:G6:uZ:Ze:Xk:gP:B0:X8:9Q:4Q:0X:De:U2:wk:hP:0B:2I:jL:zw:Ci:2u:AE:it:JH:sf:VP:LF:1F:e6:Ng:OS:ZB:PI:74:gU:FR:G4:Gl:LQ:rV:l4:SJ:IM:gD:OJ:IP:Yd:R1:fs:BZ:Ra:QK:Bs:aJ:DM:86:WZ:8W:b7:Cr:kd:hq:4N:65:Kl:lo:GI:zV:YP:aZ:7P:h7:WZ:Xd:hA:c4:nm:Vj:IS:Em:mH:Gs:Ha:BQ:pW:bS:4f:3v:WY:ZU:hH:xs:U0:3r:Rb:Vi:zO:Sd:C3:PV:H2:hG:CS:3V:Mw:0I:7s:eA:KN:xj:iC:sO:SU:RI:a8:x9:cA:ml:Ry:BW:jQ:63:7E:7B:gy:Jh:19:kE:oO:B3:Tl:dJ:Wv:k4:iy:dl:k4:Zu:W2:sF:hZ:pa:C5:dc:ti:7X:m5:EJ:80:uG:gw:70:8m:11:Eb:mn:J0:M0:YI:QF:iR:6F:cH:LF:Es:b0:RW:CS:DX:rl:bL:6p:Y0:FI:UA:lo:57:zm:Gn:sA:4V:Op:5y:oX:Zz:Wr:3R:fQ:zB:lc:YM:ZE:cY:mQ:z8:Aw:Hu:gA:G8:Yn:p5:Pc:Qy:0l:ng:xv:iv:Ex:RA:G0:5U:ux:v2:9a:QC:Vf:dG:kC:vm:zF:Q7:FV:En:f2:pi:BU:CP:R2:0p:oB:Py:hi:Zf:Uy:4V:3z:Yi:YF:4l:UC:gC:mG:cK:ul:lA:Oj:iI:Wo:8J:CR:oU:Lg:gg:1g:UM:qw:be:U1:KQ:td:38:hP:N8:Ng:X5:h1:EQ:Fn:yi:g9:A3:mm:nu:Z9:C8:FJ:n7:ds:qC:gu:aZ:VK:Ox:Qa:D9:zH:zK:lQ:Dn:ey:8e:HH:Xp:w5:5P:0W:15:j1:Fu:4y:LB:zC:b2:QZ:e0:1h:tG:Hl:TE:9w:1B:He:0d:Cn:Qk:3o:Hw:5i:5A:p1:Us:ov:wn:8w:5l:Ec:Zf:Bs:OU:6H:D7:o3:rP:Gg:SC:Vg:Pr:Px:Cw:92 | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	��Ԣ����lâZc��lU8��n����3#�҈|y�S6���W��M��<�*0�Pp�Q%R�����fͣ9�?��n���� �z�|�GUʽ��Ɓ�7\S��ii:�-�e����k���=�P��<b%�+��L����7�O@��B���hmN#�Z�� ���fGj�@�`���{P`g�!���Ơ� �PѢ�gs�r�QݾX�Y�t�'&!��Ha Ս���|���������P�N�
6^C�UK�wPrg�,9L���8p�2�� ��@b���-X���4�����,���ڂB�31e�p�Ba�<�W�Z��;ڰ���o1�8}�J���V����xSuƫ���?^�}�Դ&���Id���Y���R4d�: %�ꑄ�3D*��nպ�u�ʖ�%���֨	a����<��!:2;�$e'�s�*��Y��"��z_D�-�`���))XFej3tk�7-	2]`���ALՔ�Ǆ�L��D˥\�6w���X��Y �,QF�G.�t�:V�}L��S E���=7a�����"}�g��]y��]*w8�濼ǌf+A��2��{�Q�Xd�xb�<%"�E$�-��(j̢ɳ�/��{� ����Ho+:��,`�}�I�#��4���
@��ٙ�Ѧ61�3@7�s�\�~��s7�u��.�K�.��px�ހL}�9c����׾wZ&v>�Wߍ��~B�le��h��= �[���\�t&`�k?Qbb	�]{��}~t=�M.�[�-v����{�W�	�=n��$��/Y�ǷYwB[*b*��r���:f�)�k��^-��ws\����wz\�s���!����gr�YF#J��G?���!µ��-��T([�Lh��.���y�<Z��YV}ן���xKѲf'e�l�&q�0�dB�ڢ|�DDA�,o�)jN�;���#K���V;���H4�{�[5��t>Rt�h�� S�Z97�o.��ѽ��MW�5)�V��?(��������!�2�M�<4jO:5��%�ϲ�åi��^D�;��IC9)���Gp�O�ٱi�,�^ޥeRF��"��$�{����������;��?
��nK�z_�U�f�!�Q�~�U2@L�)`~�F~9T����>)� �S�.����hP4�����dZ�n��zdfN�@���J1`��p7���A��KnAz�y�yM��]m^ڭ���U�ʯ'��iX!�