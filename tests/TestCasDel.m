classdef TestCasDel < Prep
    % TestCasDel tests delete operations.
    methods (Test)
        function TestCasDel_testCasDelete(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            % https:%github.com/datajoint/datajoint-matlab/issues/379
            dj.config('safemode', false);
            package = 'TestLabDel';

            dj.createSchema(package,[testCase.test_root '/test_schemas'], ...
                [testCase.PREFIX '_testlabdel']);

            users = [{'user0', 
                    'user1', 
                    'user2'}]

            insert(TestLabDel.User, users)

            duty = [{'2020-01-01','user0'},
                    {'2020-12-31','user1'}]

            insert(TestLabDel.Duty, duty)

            TestLabDel.User()

            TestLabDel.Duty()

            key.user_id = 'user0'
            del(TestLabDel.User & key)
        end
    end
end