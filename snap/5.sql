SELECT "id" FROM "users"
    WHERE "id" IN (
        SELECT "friend_id" FROM "friends"
            WHERE "user_id" = (
                SELECT "id" FROM "users"
                    WHERE "username" = 'lovelytrust487'
            )
    ) AND "id" IN (
        SELECT "friend_id" FROM "friends"
            WHERE "user_id" = (
                SELECT "id" FROM "users"
                    WHERE "username" = 'exceptionalinspiration482'
    ));
