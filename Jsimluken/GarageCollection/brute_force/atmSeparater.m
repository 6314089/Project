function [res1,res2] = atmSeparater(org,src1,src2)
    [~,mIndexSrc1] = max(src1);
    [~,mIndexSrc2] = max(src2);
    syms u v;
    S = solve([u*src1(mIndexSrc1)+v*src2(mIndexSrc1)==org(mIndexSrc1),...
        u*src1(mIndexSrc2)+v*src2(mIndexSrc2)==org(mIndexSrc2)],[u,v]);
    u = double(S.u);
    v = double(S.v);
    res1 = (org - v*src2)/u;
    res2 = (org - u*src1)/v;
    return