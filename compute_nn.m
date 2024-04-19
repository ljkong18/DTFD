function dist = compute_nn(feature,query_feature,type)
%CALCULATE_MAP 此处显示有关此函数的摘要
%   此处显示详细说明
    switch type
        case {1,'L1'}
            dist = sum(abs(feature - query_feature),2);
        case {2,'L2'}
            dist = pdist2(feature,query_feature,'squaredeuclidean');
       
    end
        
end