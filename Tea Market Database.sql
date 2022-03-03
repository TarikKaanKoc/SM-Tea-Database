BEGIN;


CREATE TABLE public.colors
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    color_name character varying(10) NOT NULL,
    created_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.favorites
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    tea_id integer,
    package_id integer,
    created_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.orders
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    tea_id integer,
    package_id integer,
    shipping_company_id integer NOT NULL,
    total_price integer NOT NULL,
    order_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.packages
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    tea_id integer NOT NULL,
    promotion_id integer NOT NULL,
    daily_price integer NOT NULL,
    created_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.promotions
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(30) NOT NULL,
    color_id integer NOT NULL,
    quantity integer NOT NULL,
    created_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.shipping_companies
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    brand character varying(30) NOT NULL,
    created_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.teas
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(30) NOT NULL,
    color_id integer NOT NULL,
    region character varying(20) NOT NULL,
    "tier_id " integer NOT NULL,
    quantity integer NOT NULL,
    daily_price integer NOT NULL,
    created_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.tiers
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "tier_name " character varying(3) NOT NULL,
    gram integer NOT NULL,
    created_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.users
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    customer_number integer NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(10) NOT NULL,
    password character varying(20) NOT NULL,
    address character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    created_date date NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.favorites
    ADD FOREIGN KEY (package_id)
    REFERENCES public.packages (id)
    NOT VALID;


ALTER TABLE public.favorites
    ADD FOREIGN KEY (tea_id)
    REFERENCES public.teas (id)
    NOT VALID;


ALTER TABLE public.favorites
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.orders
    ADD FOREIGN KEY (package_id)
    REFERENCES public.packages (id)
    NOT VALID;


ALTER TABLE public.orders
    ADD FOREIGN KEY (shipping_company_id)
    REFERENCES public.shipping_companies (id)
    NOT VALID;


ALTER TABLE public.orders
    ADD FOREIGN KEY (tea_id)
    REFERENCES public.teas (id)
    NOT VALID;


ALTER TABLE public.orders
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.packages
    ADD FOREIGN KEY (promotion_id)
    REFERENCES public.promotions (id)
    NOT VALID;


ALTER TABLE public.packages
    ADD FOREIGN KEY (tea_id)
    REFERENCES public.teas (id)
    NOT VALID;


ALTER TABLE public.promotions
    ADD FOREIGN KEY (color_id)
    REFERENCES public.colors (id)
    NOT VALID;


ALTER TABLE public.teas
    ADD FOREIGN KEY (color_id)
    REFERENCES public.colors (id)
    NOT VALID;


ALTER TABLE public.teas
    ADD FOREIGN KEY ("tier_id ")
    REFERENCES public.tiers (id)
    NOT VALID;

END;