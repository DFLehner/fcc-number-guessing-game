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

DROP DATABASE user_data;
--
-- Name: user_data; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE user_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE user_data OWNER TO freecodecamp;

\connect user_data

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username text NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1722719751873', 2, 64);
INSERT INTO public.players VALUES ('user_1722719751874', 5, 315);
INSERT INTO public.players VALUES ('user_1722719919018', 2, 434);
INSERT INTO public.players VALUES ('user_1722719919019', 5, 162);
INSERT INTO public.players VALUES ('user_1722720177613', 2, 236);
INSERT INTO public.players VALUES ('user_1722720177614', 5, 315);
INSERT INTO public.players VALUES ('user_1722720233309', 2, 402);
INSERT INTO public.players VALUES ('user_1722720233310', 5, 383);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

