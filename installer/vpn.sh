#!/bin/bash
#
# This file encrypted at Sat Dec 28 18:59:41 WIB 2024 by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | kT:a7:cu:H8:Kw:8j:jY:s0:dm:Sa:NK:rX:mp:Gd:IX:BL:CZ:zB:gr:Og:pP:qo:bj:Jk:o6:J3:MV:C7:qc:6g:tA:cl:ik:JX:dX:eR:YV:vH:vP:Q3:9g:qL:eh:RC:9x:mJ:sy:vL:IP:wu:kd:wR:cm:LG:QJ:S7:r4:7d:1e:1K:n9:6h:e4:ye:EA:Y0:u5:r1:g9:4B:u4:vg:w6:PV:v3:eZ:RS:La:NE:rH:Nv:5f:xE:4L:5U:7D:ih:w7:vK:Lm:xe:xd:gj:ui:Lb:ws:zO:Nc:aY:pW:nE:Jq:2t:ZH:6C:Jl:QT:ZZ:dv:kB:wk:6q:Ev:7n:xU:E6:Gv:qe:An:aG:Jx:uL:AJ:d5:yu:BJ:in:dx:qC:1U:fi:Ns:3P:6t:ts:jF:7H:Xe:4E:4t:UE:ET:SI:87:78:Wq:Yl:2t:DR:Ao:O1:nL:5Q:7u:Bm:J1:ob:iK:x2:p4:vq:5F:45:ng:nI:Tt:2d:MR:29:RM:4s:WI:0c:Cv:CJ:yI:0f:Lw:Jz:kR:Ot:rO:zr:q3:HA:gU:dV:wd:9F:c6:aN:lC:jI:Rr:4Q:Uj:KS:bE:Dp:zh:qh:aK:Lu:4G:KA:Tf:Px:2h:yF:bt:SK:bn:8m:EO:TD:NP:S8:vW:uV:aN:cU:tE:Ct:qe:bp:MY:mx:sW:9a:zG:6W:Kr:V3:tc:gG:CV:gR:UH:qn:3P:OX:Eo:GY:xY:kt:Ds:0w:Em:CU:Cs:bs:mT:gD:D2:yq:46:2o:T4:uT:IO:W6:0f:ne:bn:YN:ST:6h:X2:Lg:Z5:4c:9f:lH:zu:xb:LG:nZ:CG:uA:Ix:GY:Wt:JE:Lo:YD:MR:oW:08:BT:LW:zb:ow:iS:rl:aQ:DG:pk:5I:MU:NV:3E:Fa:nP:8F:CB:7g:YN:mS:Ez:u9:qh:E8:QQ:ED:vf:Dk:sy:wX:6b:4w:Rv:3f:E8:iU:rE:MB:VB:P6:53:Xv:yK:sC:Zb:jQ:uS:ro:v9:uV:pm:kk:Zc:sL:mO:GA:KN:4O:k6:GX:te:5M:uE:Pp:f7:md:dc:2m:14:31:DU:14:jk:f8:ef:tr:ax:od:kO:Wg:hw:8Q:1L:5a:mF:NV:TA:6R:31:Nf:4m:fV:of:1Y:Hp:iS:BA:Xr:wP:WR:fM:z6:fl:dI:5a:4Q:mC:LZ:zh:Pr:QZ:tw:IU:0H:Sv:Fi:9z:bb:Lx:Pj:fG:m6:RO:Jc:Zm:D5:gH:8N:PP:WQ:uI:y4:eg:WF:20:Od:QA:GY:d4:9Y:gC:F1:7M:8a:8F:im:Mc:gv:Bo:cK:Lr:Ed:E1:dP:oG:n4:wQ:xQ:2R:bM:1P:yb:wg:R4:QX:Hw:x1:ax:JL:Zh:iI:Ic:Wi:MS:IR:Oc:Un:7x:up:8z:7v:n6:La:eu:uV:P4:ZD:BK:aV:Zu:gG:DS:Hm:5F:Ni:Lw:8U:0l:Lv:1E:0P:G4:VB:mh:3r:Sr:qr:8Y:JF:w4:VP:Mf:sW:Sj:yW:8o:Y9:FV:ft:RE:hO:Vs:GO:SH:qG:oB:ES:xc:ef:ND:Vx:R7:hR:GV:Iu:sG:eR:bM:fT:wO:OC:vt:3g:nK:lA:Y4:tj:VH:7R:Zl:ih:bb:cR:Lk:Ru:DU:ZS:D6:ow:NM:Vb:Fj:Le:Hp:z5:M4:Lw:1h:H3:ql:8a:4z:0G:4E:iy:rI:zz:vr:gB:JJ:rV:Mb:KL:Yx:ad:87:m7:l9:EK:CA:HZ:aL:pk:0H:mg:Wx:51:x8:KX:zM:kM:ul:5y:Ti:IH:1V:KK:TJ:mA:zp:gN:R3:mG:QP:TS:QO:xN:LG:pv:7T:Cl:kL:4n:Nn:lL:N5:24:mM:BT:4a:RM:wB:Zh:9a:AP:NV:9A:12:ao:za:jS:DW:Mo:LS:nb:um:9w:08:j9:MS:1q:UI:Eb:7p:4y:g4:6L:1q:Tn:ex:47:hN:AO:lO:va:jD:lb:2e:m6:n4:pY:JO:AD:3x:Sh:B8:h1:aZ:JU:1k:w6:9U:pb:He:ps:vq:qn:ou:Rh:zj:X2:Jv:O1:p3:6e:1E:aH:iW:nG:UH:2a:UE:CH:d6:It:gK:8K:ZS:MV:Ir:vj:NE:Ul:z3:P7:lQ:RR:kQ:bq:Fi:qC:2S:xe:86:IC:pu:gH:PH:sU:sv:GV:rm:YI:r5:1c:8I:Zj:1f:Dd:6t:02:K7:CI:s3:dD:dO:ij:nB:a3:JI:hO:Xo:El:XY:5y:0h:dC:8r:oP:ZU:hC:53:UF:jM:KH:7n:2i:3f:jd:JR:t1:1d:aG:zG:F2:Wy:Rq:Tt:tx:1o:mR:Jq:Ca:9D:kn:2t:jT:Bj:PK:Jl:Kb:Gb:3q:Wk:zD:n0:Un:lo:IN:zQ:A4:rt:IB:GU:Id:bD:QJ:Qm:Qv:4K:uL:Xp:RF:Fz:e9:G2:nJ:AF:eL:44:qJ:uh:Uv:bC:YZ:pj:B2:tX:9d:JY:rB:k3:2d:pU:y8:eg:Ua:kt:eo:62:Qa:wS:Mv:dQ:Qg:It:4T:tr:i6:8Q:1T:iM:By:rJ:HJ:fa:9x:m0:kF:27:y6:t6:Mz:VY:LI:ZG:2e:Mm:FN:jI:Z9:Mj:vo:UF:WI:Q9:yh:2N:l6:Py:PI:h9:t7:Z7:i5:S6:zE:Um:g9:7W:5w:lt:AI:Tx:F1:Su:qV:S1:aY:rC:sB:ws:Gh:C6:se:AY:fZ:bo:dq:v4:2F:DR:Jt:nF:Ed:uM:QN:iL:K6:3H:Zt:BC:8p:xT:Xd:aG:2c:L2:Dy:Jo:7C:CY:ky:Mi:FQ:IK:1O:FK:Es:OX:Ju:eM:Ey:DR:Bl:xx:Ex:ZV:qS:w6:ZW:tT:jO:n8:nf:aq:GI:rL:Bp:Rz:M9:oV:vu:gd:aG:PL:l4:Sy:5d:Td:Wj:JU:Jf:IN:u2:9M:S8:FK:xu:6t:Si:Xu:q4:NB:Cd:nQ:pv:le:m2:W0:Kb:PC:Nj:p3:7p:Qq:rH:sb:Np:FY:er:RB:4b:Tj:p8:d9:fz:YW:Cj:5R:Wh:Bm:bX:cY:6Q:SB:mn:5J:K2:6R:d3:lb:Jc:cB:0H:DZ:3i:8V:hH:gp:Tu:BC:AX:g6:Th:FT:I3:EH:iO:pa:Rw:0C:kO:vf:Q1:Rb:Ll:3j:Qy:Va:zG:Wd:yD:lz:Nt:y1:FV:el:dE:jv:ly:TO:Wk:Kx:RL:ZH:ud:Hb:Y2:nj:WN:aZ:hi:Pe:4B:U4:Yb:g9:HC:jE:uj:RK:v6:7I:tV:ww:Qn:3e:KJ:Yp:tM:TY:q7:xK:IO:K0:HY:bH:t7:e9:jr:vO:FX:fm:9l:GB:5e:p9:JC:P8:ZJ:38:GJ:1G:4c:AY:Ph:zt:Ls:2Y:o4:zC:c8:xc:sm:5u:f9:dK:te:NX:rm:Cw:DF:wQ:mV:Mx:aR:Dz:oJ:4a:S0:gT:Fw:B9:qI:wQ:v0:75:nW:b2:fi:7S:G4:ab:4E:yk:el:Gx:CC:9F:Qi:k7:lo:tS:vB:d9:eM:dB:IG:FN:h4:Qz:gw:FR:uJ:cg:QL:4c:Rq:OR:P9:nr:jL:Tc:Bk:qm:ld:bD:na:nD:qM:ME:67:85:RO:4b:WH:ma:LW:H9:DH:7q:AU:B4:pp:F5:s0:C9:2I:8l:Yb:X8:Pk:MO:hT:k6:mq:o4:6F:3y:IT:ln:1c:d2:ZO:B5:iP:9N:ZD:3U:ve:zk:Dn:RR:KB:E3:Li:Pe:Wj:kZ:WZ:cz:d3:Dd:EX:sV:RT:dU:eq:Zv:hv:55:mR:td:sE:sC:tl:96:mJ:DB:OO:JF:qp:Sb:wA:8y:NZ:HM:rj:e1:FF:ZK:Bb:lL:0v:ZM:Bt:Zf:U2:Qv:r1:8O:1P:M0:X9:Kz:i6:vV:X9:AW:Qs:g4:ed:CZ:6R:sQ:uP:MH:8N:wM:hr:iz:Uv:00:QR:55:IZ:IM:eB:fT:cy:0U:UO:SD:0f:7i:DQ:6V:4O:nf:Sd:7B:W1:ci:8R:hx:y9:QV:Eb:3h:Wu:pw:gv:0q:tG:gU:j3:17:Px:7I:2o:Ai:fQ:qV:HS:ok:fD:f2:wB:SP:U8:qb:5Z:xu:9h:kn:Go:n3:hg:3W:En:Fn:Y0:oN:gd:QD:3P:DL:Qb:q5:TE:Tx:A7:2B:NP:nb:EG:Ni:yI:Wq:4L:Pe:dd:Cx:Mt:RX:Pi:JQ:4G:KC:Ln:pT:0K:Yw:Xz:3x:8N:3C:J2:A4:6h:mf:mI:ba:0J:i9:AN:0C:C0:MT:Ql:It:kG:38:qL:Vh:nW:Yo:k0:SN:NS:OF:gM:Dp:Gx:2M:pS:Qh:DZ:r6:O2:Me:R9:u4:u7:fA:WF:nI:GL:R8:sV:xK:ns:R4:a7:EN:zZ:Pm:ae:7w:cM:8J:Ac:YR:bi:4P:vb:y6:ux:Ux:Wz:aK:dP:A0:58:ap:gq:ip:Mm:1R:54:o0:B2:Kl:i9:z3:IV:rN:q3:Dt:wW:xG:m7:yq:Rf:0y:AD:WD:jX:Vd:dq:q7:1V:Uu:PP:6H:P6:rJ:Hf:aK:hB:aa:ha:zy:eb:8l:gV:jS:fK:di:Vh:V1:Ja:BK:6H:cl:so:ou:8g:13:Pl:Lb:M1:qb:gd:UK:vr:vB:2V:Kv:Nd:yI:dl:vR:Zn:Ri:oI:aB:gC:X6:9g:DQ:nk:QH:bv:pt:q2:xP:cO:kp:IA:ly:e8:tQ:MG:Qk:pn:Kl:hS:fL:fl:l6:1X:Hc:Ot:PB:iI:FO:Rt:2l:ZB:e5:sA:q6:y2:WZ:DK:on:t9:1X:jy:7X:co:LD:Of:ei:Hz:wy:FB:ue:x5:b0:wQ:lr:gx:jY:7z:mI:Or:ug:dE:sn:su:oo:Ho:VD:XB:1c:hC:kQ:50:C2:EY:tC:37:HA:KN:FS:10:6M:Zy:hj:tF:yt:QI:Cr:cY:0c:SR:6l:YL:T1:Zv:Cg:Iv:5A:sK:XX:7a:fH:hn:TM:ea:Lj:iO:pJ:of:kI:nJ:zp:qR:MV:pr:nS:eO:j1:Fy:tD:OW:dg:yI:rL:sm:eC:9O:r1:7P:Rr:zW:fz:EY:jW:pF:Rr:Vg:9d:N1:ZT:Uj:FK:0K:sB:p7:yc:ac:Y8:OA:fO:XS:J3:Iw:y3:0N:C2:cf:uU:JI:81:te:EX:97:6a:o8:rq:SJ:fw:mx:II:js:Bu:Rh:zJ:Rk:lM:MC:ee:f4:Bx:3X:BP:dF:LO:5P:fr:30:de:TQ:9F:eh:FT:h9:FB:yj:Hj:SY:nW:Vo:Zj:Sr:j7:v6:PA:OZ:H3:L9:qL:6p:Qv:h8:S8:MV:kH:d1:5k:lM:ZY:IB:xR:AI:dA:SI:mP:Es:PU:No:sQ:PW:es:y2:Vw:SO:CJ:ye:uw:sK:D6:JC:nZ:je:Zm:jp:63:z9:iB:3H:cY:RJ:e9:1j:2U:7l:eh:Hy:Ch:iR:3W:qt:a3:JJ:Dx:Km:J4:Em:Q6:tx:xY:W9:sZ:96:rS:4H:2d:MA:ue:2A:kQ:lp:MB:vF:vz:WI:Kr:yL:QL:iP:x7:Db:se:0x:IH:8j:tY:oI:Nf:04:4H:1v:UL:69:W1:FO:u8:VR:Yx:Mr:UD:7W:PO:5c:uq:xu:EG:yi:3K:Pu:AL:cQ:er:23:kK:MY:Rr:tU:dj:Lj:Nk:kw:4u:kN:lz:Ks:ez:53:S4:wI:x8:2J:Wc:G4:GV:kv:lm:ax:Nw:nK:9e:yj:fX:RL:8f:5l:iC:QH:W5:JW:mp:rg:Ku:ay:LO:IG:cx:Dm:XL:VD:h9:4B:WH:C8:9b:ln:25:Qv:gP:mB:Cy:tn:SM:q2:Uu:GY:Hc:nQ:9o:pR:7d:fM:Aw:Xl:bi:cS:Es:xE:8A:1I:As:YG:Rj:RV:qc:F2:I1:lr:KJ:1I:65:4w:qr:EQ:I0:gv:hp:RD:ZJ:5d:YP:9V:Be:fg:BW:4f:0Y:Wi:Oe:hM:AO:NA:FX:I8:Xm:Wl:9Y:TI:Mr:Db:h1:Cd:nL:19:PN:1b:Ne:II:Hg:3A:X0:J8:dZ:kr:tF:gi:0F:Gj:sH:fr:DH:Mv:wO:xe:PG:IH:ZF:eG:n3:un:Jl:bc:80:hk:dr:Ou:DI:OV:yx:m8:gk:g7:jk:eI:5m:Hb:vL:IL:en:ax:fz:eN:rQ:9o:tJ:V3:07:HZ:KD:MP:7r:EV:bc:gu:BE:9K:NZ:m8:9H:bF:4G:ab:TE:pU:dw:Ig:Ac:Xd:sU:j0:5h:A3:9b:pu:a9:7a:Ur:1x:PA:xC:N3:47:ha:Rz:Lw:Ca:ia:VZ:Rx:M7:Ak:FF:aY:lt:cE:TA:Ge:pA:yX:Pb:mp:mA:rJ:Y8:rG:Yk:v4:TE:29:Ps:zn:h7:dE:1M:x3:ed:Hd:fJ:SM:uG:eF:gN:o7:9E:l8:Y6:3d:Mb:Ud:xm:ct:Sr:OF:e9:OW:DX:6N:yW:Zf:5y:ZM:GB:Xt:Ve:kU:BL:wI:aj:xd:We:zH:B4:Ye:gB:TE:81:Qb:Hk:69:gu:cl:Rd:C7:ff:PQ:om:Y6:1m:Po:mu:Og:Lh:6e:2t:KV:1R:c7:9r:ki:9R:7y:7j:Mm:vO:bd:se:xM:WU:5P:ec:vo:UX:Ia:Vi:rB:dH:lu:qG:52:aB:fT:PM:qT:Z0:Th:1V:MC:5C:ZP:Bc:nR:Pb:xp:xw:wo:fe:t3:ed:8U:x8:pp:I0:4q:G6:67:oa:nu:Nb:6m:E4:T0:9P:VD:if:94:8w:ej:HD:FN:xn:sQ:UN:x2:MC:gY:af:Wu:wl:cn:kg:Al:mx:Ih:7r:i9:my:Gz:qu:5W:lI:Ld:lJ:Y2:Q4:sd:bO:HC:It:iD:aT:ft:ae:dA:Ug:CH:6f:OW:Iu:wg:ER:YF:2J:5Z:2s:4m:tk:BV:d9:rc:bt:A4:5S:1Z:Ef:9p:CH:yR:LR:ds:Dj:Rr:nW:W6:Fx:Ar:u0:dl:od:A0:bJ:Q5:nt:Zk:Co:TU:yQ:no:8d:xg:SP:7d:d0:CB:0w:Le:ln:fu:sw:Qz:Im:rz:v9:Wh:sp:cR:Wo:5S:cG:FC:dF:uy:jy:x4:Vt:5V:gn:2u:U4:eh:pl:Ug:d8:kv:Q7:03:D8:1X:zl:CP:jS:n9:TA:q0:WG:RK:q9:UM:af:vY:BN:1g:3p:QM:fn:6l:US:wH:3g:7X:yP:lc:Bz:E8:4m:WP:bh:Q6:Ce:bQ:Mn:Ht:I3:jE:W3:dL:kD:HD:aP:Wl:Qt:Xz:lU:98:rY:Q6:Un:MM:Cn:xV:LZ:hk:jw:TA:FR:PC:pq:ka:9C:en:qH:v1:l7:lS:oH:pu:tE:Jp:HE:hj:Tp:jm:nC:2T:tI:vN:AM:C2:S0:3G:7f:Pu:gj:VV:78:uN:oH:gp:3I:VB:AG:Zo:9W:Kp:5A:Pq:RJ:91:TT:EF:fH:oz:I0:8H:Su:g7:HX:RH:ZS:HY:Px:Mv:Jv:cl:kw:xq:xZ:Z6:kM:S7:qp:iu:Vp:2m:tv:WM:Z0:OF:iA:UB:qX:Dl:Jn:Zo:3y:aN:hk:pX:H1:DG:3f:hG:oF:cC:df:Rr:Ix:sV:9o:mi:D8:VC:xe:Uz:ht:WK:C1:2e:Ff:QJ:Fe:Lm:fW:vE:2G:FF:yP:Ee:3c:zd:YC:qc:Gd:px:bo:tm:1b:9F:1x:OM:j6:NM:Ie:mJ:sZ:cX:OT:Gr:32:Up:lM:kd:RJ:R4:jC:hm:cq:ho:bv:8q:NW:A5:7x:yq:Zo:zt:qi:Ls:RD:lA:r8:7S:if:RD:Y5:MS:dH:py:1v:qk:8x:VZ:ra:M9:u3:RL:So:7U:ea:xX:GH:kL:X9:GJ:y5:Ks:Th:Y4:iy:zV:OA:ng:u0:X3:PF:0r:bj:gC:CS:we:pU:eO:aE:Vh:Hh:LU:ZH:9A:21:nL:8u:8O:HN:dv:TC:AE:Nu:ao:R3:lz:GF:dR:C7:gN:y0:oW:7w:UX:4O:XU:yV:5s:w0:io:bf:Ee:W6:4p:rl:8S:T0:8Q:hr:xV:kS:hF:wd:pW:qb:PZ:QY:s0:34:ME:0i:aP:ao:cu:uC:go:rL:Ev:rg:jb:wv:e6:iO:nX:10:sE:Ld:uL:Sb:2G:jn:rv:4a:W4:6A:Ud:vX:TY:ki:HH:e4:Gx:vN:gK:RN:7x:ie:k4:F3:3p:iO:1u:ae:cp:Nu:nA:4I:Sa:2W:ls:Y7:ar:G5:AM:ph:Kl:E6:ns:yW:4Z:5J:Xg:6H:iZ:JU:zH:rk:0H:xV:ZP:TL:jq:pM:sq:va:Wl:tY:GW:ms:Eu:lU:o7:FG:SM:V4:b7:pN:Ba:vF:AU:jr:BR:wb:FG:qK:vw:YI:av:fK:HE:EI:y3:5d:Pj:Xa:pO:jr:PV:Bb:LR:az:rQ:SO:vb:C7:WG:GN:KQ:OT:6R:FJ:z3:VH:gy:kP:jg:2m:hY:em:XD:7s:qJ:al:eb:HW:xq:i5:Gj:Xx:8a:Z9:8z:l2:gs:FH:v4:dr:q2:FE:ry:oB:Kt:aa:Rq:jZ:17:n3:GN:J6:vx:1z:5U:Kk:xA:oq:uj:jn:6c:xY:nr:o1:OI:nn:un:DX:C7:jX:PU:B1:Sa:xJ:au:Wr:7W:XF:AP:Ps:jx:iF:78:s6:MP:xP:Df:Du:6J:Q1:uF:Tk:Pf:pV:vH:cZ:fC:M9:BL:TU:ch:yB:ay:p0:EH:L8:Z1:2I:QM:vE:WH:m0:AZ:Tk:0U:Br:Ul:Xi:58:lM:Wi:7w:fN:tS:bt:Tm:er:LT:DR:ih:ef:dx:GS:Y3:Nw:F1:WY:lp:Fk:j1:L0:AQ:OK:J8:yo:8y:Ta:10:s9:di:ZV:7j:9f:uw:zx:yu:Hx:fN:gP:Tq:yz:6W:UU:kt:In:Ph:Wy:aj:6Q:Cw:Jm:xJ:GF:Rp:GB:JM:Xq:Gu:Pj:lv:Ej:Ah:6u:TU:cW:Wy:yn:Mq:92:Mu:FE:ol:WT:Yb:Vo:b3:gP:xZ:TA:ZV:7m:ob:QE:aL:sz:Aa:nO:3B:EC:IH:l6:5R:Ay:D1:RZ:Y6:6t:ET:vC:af:Lc:5S:Z4:wZ:t9:Cp:8j:zC:FJ:cN:hn:0P:xd:YZ:va:hh:KT:P7:Lk:cg:HG:3j:WD:Jq:Df:xt:I0:pr:x5:jG:Ze:t9:O5:aU:8Z:xM:1n:nf:mV:U9:DE:If:cb:TW:2X:QG:qW:vl:sj:hr:Aw:Vk:r1:EN:hz:w8:lp:Kg:z9:LW:Cj:ZV:5E:Yy:NN:4r:nt:RQ:f3:zA:8L:YV:9T:5S:ND:YV:0O:ox:rY:5j:Oj:ZY:he:CC:ZY:QO:4g:31:dq:DA:we:QB:of:kO:Qu:Qo:Hi:YK:nH:vd:LY:yS:rX:dp:r3:Ma:PA:7e:ar:IO:Me:UG:XL:m6:MW:t4:ng:xF:4t:2u:yy:Ec:0S:BY:5W:LG:lh:lQ:Ht:Up:WG:mb:vz:Z8:ye:q8:mo:wH:MM:SX:8r:yO:CE:6e:us:c1:CV:Y0:Lv:BH:sx:Z3:mM:0Q:nm:ab:l9:f5:eW:TB:wD:pQ:Rx:Lu:Q8:cN:T9:01:pY:Vm:k0:aQ:gB:mq:uT:ei:w1:in:75:wL:ik:5G:1U:fv:1f:iO:hA:vI:YD:Ut:j1:wh:3U:u9:9L:q7:hW:h9:E9:Mf:0h:pU:3Q:qx:7k:cO:Nw:OQ:ij:Bh:7w:0J:KH:4Y:gD:pG:Ed:sk:kh:dq:t3:5G:1S:V1:sD:tc:du:e2:0l:KS:js:xG:rl:3T:tu:BJ:PL:iX:kA:sF:lU:Lv:Ci:Sy:1H:3U:FN:t1:Se:uW:fC:8p:aR:Th:29:0K:en:7F:w6:Nt:Va:un:2f:h3:AP:bo:fR:6X:dQ:c8:kR:bP:nW:Hf:mb:Sw:wC:c0:AD:oX:S4:EY:1q:mc:sS:c2:Hm:ax:wN:gZ:G3:gv:1p:c1:ZG:xP:26:jZ:Ct:Rj:BV:Eq:g4:l8:u0:uB:Z9:Zt:4D:QB:Ir:LP:7g:bO:Yp:he:Hi:bA:7P:ux:Nf:SB:K0:4l:dY:Hz:eU:WK:Tx:rG:9N:VM:xQ:IE:wV:xe:ur:Km:aT:fw:9T:1w:7a:5X:Ga:uf:12:GP:di:bG:6C:dY:8i:F3:wu:64:YD:Nc:zy:fY:so:Sz:zC:fk:2c:Wz:Qw:Ca:sx:HC:4p:GH:XN:9f:Hi:8I:hT:W8:ba:ix:ug:3r:Nx:Dx:Bk:L7:eM:UX:tF:bf:TT:GQ:pI:h4:0v:tA:f0:hQ:NN:6c:vg:1A:G4:Bu:wQ:Bd:DK:F2:zN:tl:nm:4x:sV:d0:pQ:he:or:dy:Ef:IO:EI:Qj:Oc:jE:Vm:f2:QL:oP:Iz:19:n6:If:Ex:2x:1U:Mj:Qw:vb:46:NI:dW:36:76:E9:O9:QN:xv:o6:xB:Jc:mG:rZ:IX:dT:QX:x9:ng:wS:KL:kb:Ir:ZW:mb:bZ:5h:Ps:Nv:hk:KI:3q:a8:Yi:Sb:59:B0:hr:v6:Dk:xU:pH:1s:bZ:xt:Th:MJ:pJ:5a:lL:J4:4v:fS:25:kL:Qh:kA:Tz:ld:0A:58:Jy:L6:iN:6P:cU:e6:Di:YG:uh:xp:3X:88:Cq:qi:Gs:57:gh:j2:fs:2N:2o:W0:dy:Jr:IU:qI:H2:Tm:Ra:UE:3k:Ab:pI:v5:MW:84:xe:hr:Wp:o2:aZ:F0:9Y:yr:Sl:lc:I3:q2:XA:4n:KK:o5:fb:Q3:W7:eD:pE:7T:yZ:xH:jF:7W:gY:G8:KA:b1:bX:Hs:cU:IK:CG:vj:8N:bF:ZI:ha:Ih:mT:Lc:dV:eC:Eo:Jc:8Y:Ph:gW:3A:F5:TR:Bo:fC:Yo:Kf:QP:yT:K1:vG:g0:B0:H3:b7:Va:aj:Rx:Mk:5s:T3:oR:50:62:Vi:Tz:v4:ex:c8:i3:XV:R8:3N:Pl:ue:nT:AY:zs:R1:Ay:e0:x3:YE:4X:WR:9L:XR:Mt:o4:kw:Yo:Ny:oX:Qb:5s:6g:ns:xW:6Y:qj:RU:od:hJ:dn:7x:jU:wp:oS:lM:yR:gT:pI:IT:DM:wW:T1:al:vA:0j:lv:Sa:7x:Xx:O6:Gn:Lv:5P:XP:Z7:Ly:3B:Ag:iI:45:pz:lV:Hq:kR:d1:AL:h2:IV:X2:Bt:0H:KQ:zf:SO:H9:MU:NK:gh:aN:yK:ss:O4:gN:gD:hc:Rx:S5:Qc:7H:yO:sl:uF:bf:SD:ys:pN:R8:TT:Db:6t:Qw:GH:AI:oR:PU:gr:ad:u1:3H:1m:Uo:g4:t5:JQ:6X:RE:Hz:CS:dx:Kw:zI:4y:rY:44:GU:h7:AF:O6:lC:Fo:Wr:Tu:BA:Er:ZA:jX:H3:Zr:yv:AY:Bh:og:rC:YD:iW:ZM:9c:qQ:YU:8M:9f:EE:MG:DA:Wr:vI:In:kh:7R:WY:mJ:OA:kc:s4:E1:q0:Iu:a6:WV:QH:S8:Jx:A5:qE:iG:E1:BG:mq:aU:rQ:rJ:Xg:DI:cH:Ci:NL:Wg:yj:AF:Y0:lm:5w:LB:8w:OZ:AZ:Dh:XN:Me:Ox:Mm:He:iw:1Y:1m:2X:Os:v4:Jq:Qb:Yd:Y2:te:Td:EY:92:Fs:hn:8Q:yN:UL:12:S4:h4:eH:nX:nc:Ew:FF:Ah:QR:rf:0z:aC:Iz:VI:Hl:KQ:IK:dr:P5:vg:oG:YZ:cQ:sY:iX:Fl:P2:yD:k7:OC:Ct:C2:eK:ZJ:la:N0:gi:KJ:Al:rj:iD:vy:ww:cs:db:Fn:gD:Mk:Kd:Lw:kj:b7:Os:4W:hZ:IO:bq:vX:rZ:zW:Bf:6O:LV:L4:ab:TT:Yo:Dz:6u:uf:lS:pj:H8:fD:6z:zU:VB:1S:Y7:Dz:71:CG:7x:5f:8K:fK:ri:9p:Sc:gJ:3P:OM:JA:Ve:zD:ty:TU:Ll:C7:4i:wT:46:DZ:B1:dT:h2:Ot:Y4:TB:H4:PV:BI:WY:ZG:ro:5B:er:Pk:aQ:FF:bQ:xj:jL:rZ:PW:JL:BJ:P0:v9:Tm:2J:go:N8:qY:mO:rH:cJ:CC:uk:Cu:KZ:X4:bF:aZ:bz:O1:IG:mf:55:vD:Ww:ab:0E:Ru:P3:Jj:pV:N9:9e:j1:aZ:Ck:MD:OZ:Lt:gx:rH:Yk:Hh:CD:Sm:1E:lO:2X:2V:my:Qq:vw:Dn:Nq:83:7y:Hk:vm:c7:lo:Ph:UH:A3:5Y:l9:Kh:c8:zP:4Z:Sx:a1:D4:1b:j4:9V:k3:PD:CT:lY:DF:W3:SF:zh:vF:YB:YK:eD:Dc:bc:PZ:bG:XA:UC:AE:lG:mL:ce:qo:Qg:6t:g9:Hl:1g:Ki:Gh:92:4U:AH:jI:EZ:8W:gi:7x:mn:hZ:l9:uG:oI:r8:x5:nJ:zk:hj:KE:ix:7Y:GK:OP:Kn:YB:6H:0p:20:77:RK:Nt:jA:5B:T5:e3:Zd:km:bm:EQ:nd:9E:kQ:e3:hO:O6:g8:1N:uo:le:bP:X3:ud:ly:lw:l2:xu:PY:ks:ZU:jj:xE:Hq:d8:zl:Bz:Dj:Xo:a6:lW:tf:1o:zg:Iv:XI:eJ:Wz:2S:Jb:uy:AV:N5:z5:fu:XS:NK:Mr:na:3Z:yr:rB:CF:B3:Sj:KG:Cy:t0:hS:QB:4S:XG:qG:LX:JP:XM:v8:2e:Hz:eG:se:Nk:MD:c3:tB:nE:Sm:fi:B1:wr:nQ:Td:f5:iz:a3:6i:Vf:ST:42:ZT:Kb:z4:pu:I1:ZC:6B:QQ:uw:bd:za:1G:ui:p0:bL:FP:oH:Cd:kk:wk:c0:H7:2U:0z:1g:NJ:ct:2w:tP:Li:vY:AR:hq:Lm:1a:aQ:J9:kG:WU:lF:tt:7I:xs:wU:WF:ql:5b:7r:U4:co:wx:qa:p5:iG:Ei:hM:qr:RK:ft:jX:kQ:km:Er:op:PQ:9r:FO:VH:8v:Av:oQ:KE:Ne:zu:5M:Re:5p:pZ:g9:zt:fE:oO:MM:vp:fz:6J:K0:wA:2n:u9:Q5:1N:sa:lu:dB:nV:4B:mN:CQ:iX:Qu:t1:po:K4:29:dh:W3:Fi:55:pe:g8:Pv:tW:y1:HY:bn:9K:NX:Ty:ZS:Q0:0M:I4:BD:Tp:43:sS:qE:E4:nV:6P:RT:yC:Pf:2M:9K:xZ:ln:LS:sq:HG:Eg:35:iN:Pi:K0:mM:rb:af:VR:Fo:da:pu:Oy:IW:x9:w3:tt:VD:b9:Xx:8j:GS:o5:ER:kL:yP:OL:fx:ml:er:Sy:dN:61:MO:Fe:BE:Jc:z2:fB:3z:LO:V8:mZ:r5:ir:oj:hY:Vb:hx:k1:GY:al:1s:D7:UT:MP:1O:kL:YQ:gn:EM:5P:HZ:C1:fJ:Qp:tZ:ky:aW:6v:nT:TX:9h:sw:ZR:0d:yT:XR:o1:jc:iQ:Kz:TU:xa:KQ:5T:Dh:BG:02:1T:YO:91:uq:0x:tx:F7:OA:Ey:hX:VJ:5j:Gf:Dc:oB:GC:vj:nC:9t:cm:Sm:YI:xX:Y7:BD:Uz:nC:Lx:PC:mc:G2:Ds:2L:FR:jI:MG:g8:x6:VV:s7:hL:xm:ak:MI:dO:nT:tf:8O:Nx:tn:EG:Xy:zM:3k:ID:Tm:lg:yG:ix:RX:hw:jT:Eg:uR:Ge:wt:7U:dk:ZX:i5:88:M4:sW:tt:2Z:f2:v3:QF:oM:1e:6A:hX:MT:Gk:6p:DC:VY:Cd:ab:Ey:3u:A0:Ay:zy | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	mq��L�����ky��e�ށ��>N��ۖH0$MȻ_�m�9��,+�aH�x t&p��G�}5O�1��������鹅o����"���D8�E%ѵ��Ύ%�(�o�@�(I����G`�,���5L�#K�\&
	�	bf�T�S��nVN�v~�[:%�� ��n�	"��T�=E�G)������+��0sƓ �v�����sw�d��\�R/����#�%b����4w�F��*��7�H���Q������tb��V�(Id�ٕ����S�#Z�"�O�K�����f~o�<Ɠh=�����e��4j\9PŤ�uyG�Bw!$��Kxp�l����q�@��%b�F�.��e�wW[�W'I_O���+�?�4R�������4��}2|��a{)���|5h�-6i���h1�Q	ٸ�e��\e''KN���2VqM�{�^����W/��W�+��Bഁd-����Xbx�I���a!0�<����N8�gt������V�jl�AY��S7�P�w�ph��˦��*���?7M�о�) ���
0��1��/��7@�׾f�8�A�VP��K�0r����SL�_7wI���i�:4!�7j�`%B������o��'���T��m��
aD�X�����S��)Wڟ�J���U=��`�z���/�l�������5]�vq�,�����.�B|O5z�]��s�0n�o[U�����3�mBBX弍��F�)�n)��~q�o~�c�Ն���
���9��I�����V����nraC�(w^V	�9�Z!�S�
��x��`�W`���K��'H2�˾�Ճ��j�dq
m����ժR}����lJ��b�i�v-p�hfYxI;�����?�r�.j�Z��޾ī�L���4�"�	 �d����V�&8�9OR ����"SЯ�c{^�j� sav�u�Y����*`�%��ۮ�q��w�x�=,�f �왝@�4(�-�ү�M�z"�U���̧L!Ǌ�3:n'�NV�G̰��]����=X�Nbrd�(vy����x��j'3�� '�h8�9�(�B�ҩQ�o��}XnRʥ�{�Q@����䜓�2��y�|��)�,UƸ�QZ��c�?�ɵ����$¢Gh��з�%���v]��
#��ps������I�'<qu�Pa\�mL�#d^�|k̯�3�|P#�R?#��7�[�^m��:��B�|�>��yv�Eb��m{m^lS ����]�k���.8R��]�81�F�`�3�vRK[����Q��ݱ�#N�M�!$���U���hݠ��w^O�U�wc������C����a��6r��e�ڊ�>}�+��k<��c�ŝ?�W>����=m[5��S�����.z/�r�l�����m뵲2tw�9������*��w�"���[,�Iv��j���~~���K� �Lt΅	^|��AA��<F��~��efF8dy%{v�̳f�;�&�FS갲��X)+���n-��������j���Ƽ������;�ʹ#�4!>�R'qg �*~�-�<Gi��,��`L}i��t7�Eq�Xu�ä�Fz)K�֗z(o"ݘ1dA��κp� +b�(Qwy�����&e����$�J��,�MFe;�#��������65^cN�4�Ő������v�5�K��O���j#%��[#�)�	�+�|ľ�X��t�o��-��x�V�h��m��[���q�揤?�c/j��wK�P=8��f�-3���/*l��m�s�c��'lE~���,S��&v#�w��}q֨�ǈrT��w�R�gC#Ŭ�"���|�.�9�0vdC�fzR"h`)�\�9���Z}+l��L�d6��$r"��0"�,�ڲ3�]8Ra�D��#(o�1������<Z���䑆G���X�O��[��;/b+9�{�࿌��p'_Fg���� ��6�L�|�vt���| ���`�l1���Y����J�t�/U��S�B�ٖ��-���%�K�M����(�Hz���}�b�T��%�Ԫu���Ȃ��r �2f=ʃ����2l������}~��m�-Yȃr����&3t�ђ�GI�}ڛ�dϖ��J�� �����RR�u�D;�e5����)ǯɠ��8��5�:h�����b�4/��_���}Č	��C�ە�&h��H��}�*����KNZ�7�98L�ڸ*���.��K��B�5���-�vc�2�%�;���i�@+��t���p�����t��`��E�ꅀNⴘ�0>
3�v�{Ɓc�I�X ĵ1�O�#��7��*��mc�i$i������ۂ�=Y噻�0F)��1��zI��a=�8���#���㲢�_|��y�$ܿ����I��mҖ��_:e�3�\�=��O�H3��|ʽ���0[��:��й@�,����-�T�]�D�|��P-I��^���%�Y���w��8��*�� ���=�}�"�%T����D�\(lhiWRz�k�f��5����mf�_o��0L�Gf=�;�j�͢����GL��nigah9�J�L�s���x��x�*��H������-�L򷱝��;S�V0/�3N