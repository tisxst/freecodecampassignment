--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    weight numeric(10,5),
    has_life boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    weight numeric(10,5),
    has_life boolean NOT NULL,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    weight numeric(10,5),
    has_life boolean NOT NULL,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    weight numeric(10,5),
    has_life boolean NOT NULL,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: temp_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.temp_table (
    name character varying(50),
    temp_table_id integer NOT NULL,
    not_null_one text NOT NULL,
    not_null_two text NOT NULL,
    unique_column text NOT NULL
);


ALTER TABLE public.temp_table OWNER TO freecodecamp;

--
-- Name: temp_table_temp_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.temp_table_temp_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_table_temp_table_id_seq OWNER TO freecodecamp;

--
-- Name: temp_table_temp_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.temp_table_temp_table_id_seq OWNED BY public.temp_table.temp_table_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: temp_table temp_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.temp_table ALTER COLUMN temp_table_id SET DEFAULT nextval('public.temp_table_temp_table_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy_1', 10000, 10000.20000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy_2', 10001, 10001.20000, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy_3', 10002, 10002.20000, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy_4', 10003, 10003.20000, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy_5', 10004, 10004.20000, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy_6', 10005, 10005.20000, true, NULL);
INSERT INTO public.galaxy VALUES (7, 'galaxy_7', 10006, 10006.20000, true, NULL);
INSERT INTO public.galaxy VALUES (8, 'galaxy_8', 10007, 10007.20000, true, NULL);
INSERT INTO public.galaxy VALUES (9, 'galaxy_9', 10008, 10008.20000, true, NULL);
INSERT INTO public.galaxy VALUES (10, 'galaxy_10', 10009, 10009.20000, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon_1', 10, 10.40000, false, NULL, 1);
INSERT INTO public.moon VALUES (2, 'moon_2', 11, 11.40000, false, NULL, 2);
INSERT INTO public.moon VALUES (3, 'moon_3', 12, 12.40000, false, NULL, 3);
INSERT INTO public.moon VALUES (4, 'moon_4', 13, 13.40000, false, NULL, 4);
INSERT INTO public.moon VALUES (5, 'moon_5', 14, 14.40000, false, NULL, 5);
INSERT INTO public.moon VALUES (6, 'moon_6', 15, 15.40000, false, NULL, 6);
INSERT INTO public.moon VALUES (7, 'moon_7', 16, 16.40000, false, NULL, 7);
INSERT INTO public.moon VALUES (8, 'moon_8', 17, 17.40000, false, NULL, 8);
INSERT INTO public.moon VALUES (9, 'moon_9', 18, 18.40000, false, NULL, 9);
INSERT INTO public.moon VALUES (10, 'moon_10', 19, 19.40000, false, NULL, 10);
INSERT INTO public.moon VALUES (11, 'moon_11', 20, 20.40000, false, NULL, 11);
INSERT INTO public.moon VALUES (12, 'moon_12', 21, 21.40000, false, NULL, 12);
INSERT INTO public.moon VALUES (13, 'moon_13', 22, 22.40000, false, NULL, 1);
INSERT INTO public.moon VALUES (14, 'moon_14', 23, 23.40000, false, NULL, 2);
INSERT INTO public.moon VALUES (15, 'moon_15', 24, 24.40000, false, NULL, 3);
INSERT INTO public.moon VALUES (16, 'moon_16', 25, 25.40000, false, NULL, 4);
INSERT INTO public.moon VALUES (17, 'moon_17', 26, 26.40000, false, NULL, 5);
INSERT INTO public.moon VALUES (18, 'moon_18', 27, 27.40000, false, NULL, 6);
INSERT INTO public.moon VALUES (19, 'moon_19', 28, 28.40000, false, NULL, 7);
INSERT INTO public.moon VALUES (20, 'moon_20', 29, 29.40000, false, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet_1', 100, 100.40000, true, NULL, 1);
INSERT INTO public.planet VALUES (2, 'planet_2', 101, 101.40000, false, NULL, 1);
INSERT INTO public.planet VALUES (3, 'planet_3', 102, 102.40000, true, NULL, 2);
INSERT INTO public.planet VALUES (4, 'planet_4', 103, 103.40000, false, NULL, 3);
INSERT INTO public.planet VALUES (5, 'planet_5', 104, 104.40000, true, NULL, 4);
INSERT INTO public.planet VALUES (6, 'planet_6', 105, 105.40000, false, NULL, 5);
INSERT INTO public.planet VALUES (7, 'planet_7', 106, 106.40000, true, NULL, 6);
INSERT INTO public.planet VALUES (8, 'planet_8', 107, 107.40000, false, NULL, 7);
INSERT INTO public.planet VALUES (9, 'planet_9', 108, 108.40000, true, NULL, 8);
INSERT INTO public.planet VALUES (10, 'planet_10', 109, 109.40000, false, NULL, 9);
INSERT INTO public.planet VALUES (11, 'planet_11', 110, 110.40000, true, NULL, 10);
INSERT INTO public.planet VALUES (12, 'planet_12', 111, 111.40000, false, NULL, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star_1', 1000, 1000.30000, true, NULL, 1);
INSERT INTO public.star VALUES (2, 'star_2', 1001, 1001.30000, true, NULL, 2);
INSERT INTO public.star VALUES (3, 'star_3', 1002, 1002.30000, true, NULL, 3);
INSERT INTO public.star VALUES (4, 'star_4', 1003, 1003.30000, true, NULL, 4);
INSERT INTO public.star VALUES (5, 'star_5', 1004, 1004.30000, true, NULL, 5);
INSERT INTO public.star VALUES (6, 'star_6', 1005, 1005.30000, true, NULL, 6);
INSERT INTO public.star VALUES (7, 'star_7', 1006, 1006.30000, true, NULL, 7);
INSERT INTO public.star VALUES (8, 'star_8', 1007, 1007.30000, true, NULL, 8);
INSERT INTO public.star VALUES (9, 'star_9', 1008, 1008.30000, true, NULL, 9);
INSERT INTO public.star VALUES (10, 'star_10', 1009, 1009.30000, true, NULL, 10);


--
-- Data for Name: temp_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.temp_table VALUES ('temp1', 1, 'data', 'data', '1');
INSERT INTO public.temp_table VALUES ('temp2', 2, 'data', 'data', '2');
INSERT INTO public.temp_table VALUES ('temp3', 3, 'data', 'data', '3');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: temp_table_temp_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.temp_table_temp_table_id_seq', 3, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: temp_table temp_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.temp_table
    ADD CONSTRAINT temp_table_pkey PRIMARY KEY (temp_table_id);


--
-- Name: temp_table temp_table_unique_column_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.temp_table
    ADD CONSTRAINT temp_table_unique_column_key UNIQUE (unique_column);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

