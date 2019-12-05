function anomaly_score = BernoulliAnomalyScore(X_test, n1, n2, p1, p2)

KL_1 = binopdf(X_test, n1,p1);
KL_11 = log(2*binopdf(X_test, n1,p1)./(binopdf(X_test, n2,p2)+binopdf(X_test, n1,p1)))';
KL_11(isnan(KL_11))=0;
KL_11(isinf(KL_11))=0;
[row,col]=size(X_test);

sum=0;
for i=1:row
%     disp(KL_1(i,:));
%     disp(KL_11(:,i));
    sum = sum + KL_1(i,:)*KL_11(:,i);
end

KL_2 = binopdf(X_test, n2,p2);
KL_22 = log(2*binopdf(X_test, n2,p2)./(binopdf(X_test, n2,p2)+binopdf(X_test, n1,p1)))';
KL_22(isnan(KL_22))=0;
KL_22(isinf(KL_22))=0;
[row,col]=size(X_test);
sum_2=0;
for i=1:row
    sum_2 = sum_2 + KL_2(i,:)*KL_22(:,i);
end

anomaly_score = 0.5*sum + 0.5*sum_2;
end