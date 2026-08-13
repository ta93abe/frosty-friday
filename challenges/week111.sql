-- https://www.frostyfri.day/en/challenges/blog/2024/09/20/week-111-sql-query-techniques

-- Did Shakespeare talk too much about love?
-- At FROSTY_FRIDAY() we're feeling rather grumpy and want to know whether we're right in saying that the great playwright might've been a bit overly emotional.
-- Luckily, Snowflake has released the SEARCH() function for this very exact and specific use case.

-- SEARCH() 関数なんて知らないので知っている知識で解きたい。

with quotes as (
    select 'Better three hours too soon than a minute too late.' as quote
    union all
    select 'My words fly up, my thoughts remain below. Words without thoughts never to heaven go.'
    union all
    select 'Brevity is the soul of wit.'
    union all
    select 'Love looks not with the eyes, but with the mind; and therefore is winged Cupid painted blind'
    union all
    select 'Suit the action to the word, the word to the action.'
    union all
    select 'No legacy is so rich as honesty.'
    union all
    select 'All that glitters is not gold.'
    union all
    select 'Love all, trust a few, do wrong to none.'
    union all
    select 'Our doubts are traitors and make us lose the good we oft might win by fearing to attempt.'
    union all
    select 'Some are born great, some achieve greatness, and some have greatness thrust upon them'
    union all
    select 'To be or not to be: that is the question'
    union all
    select 'All the world’s a stage'
    union all
    select 'What, my dear Lady Disdain! Are you yet living?'
    union all
    select 'If music be the food of love, play on'
    union all
    select 'I cannot tell what the dickens his name is'
    union all
    select 'Shall I compare thee to a summer’s day?'
    union all
    select 'What’s in a name? A rose by any name would smell as sweet'
    union all
    select 'A horse! A horse! My kingdom for a horse!'
),

ilike_function as (
    select ilike(quote, '%love%') as contains_love, quote
    from quotes
),

contains_function as (
    select contains(quote, 'love') as contains_love, quote
    from quotes
),

regexp_like_function as (
    select regexp_like(quote, 'love') as contains_love, quote
    from quotes
),

search_function as (
    select search(quote, 'love') as contains_love, quote
    from quotes
)

select * from search_function


-- 関連ドキュメント
-- https://docs.snowflake.com/ja/sql-reference/functions/search
-- https://docs.snowflake.com/ja/user-guide/querying-with-search-functions
-- https://docs.snowflake.com/ja/user-guide/search-optimization/enabling#label-enable-full-text-search
-- https://docs.snowflake.com/ja/user-guide/search-optimization-service#label-search-optimization-service-how-it-works
